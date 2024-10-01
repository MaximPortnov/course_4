using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Poprizhonok
{
    /// <summary>
    /// Логика взаимодействия для Page1.xaml
    /// </summary>
    public partial class Page1 : Page
    {
        public Frame fr;
        private int order = 0; // Для хранения выбранной сортировки
        private int iag = 0; // Для хранения ID выбранного типа агента
        private string fnd = ""; // Для поиска (если будет использован)
        private int start = 0; // Для постраничной навигации (если используется)
        private int fullCount = 0; // Общее количество элементов


      
        public Page1(Frame frame)
        {

            fr = frame;
            InitializeComponent();
            List<AgentType> agents = new List<AgentType> { };
            agents = helper.GetContext().AgentType.ToList();
            agents.Add(new AgentType { Title = "Все типы" });
            Type.ItemsSource = agents.OrderBy(AgentType => AgentType.ID);
            Load();

        }
        private void Type_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            iag = ((AgentType)Type.SelectedItem).ID;
            Load();
        }

        public void Load()
        {
            try
            {
                // Поиск агентов по названию, телефону или email
                var ag = helper.GetContext().Agent
                    .Where(Agent => Agent.Title.Contains(fnd) || Agent.Phone.Contains(fnd) || Agent.Email.Contains(fnd));

                // Фильтрация по типу агента
                if (iag == 0) // Если выбран "Все типы"
                {
                    fullCount = ag.Count();
                    if (order == 0) agentGrid.ItemsSource = ag.OrderBy(Agent => Agent.ID).Skip(start * 10).Take(10).ToList();
                    if (order == 1) agentGrid.ItemsSource = ag.OrderBy(Agent => Agent.Title).Skip(start * 10).Take(10).ToList();
                    if (order == 2) agentGrid.ItemsSource = ag.OrderByDescending(Agent => Agent.Title).Skip(start * 10).Take(10).ToList();
                    if (order == 3) agentGrid.ItemsSource = ag.OrderBy(Agent => Agent.Priority).Skip(start * 10).Take(10).ToList();
                    if (order == 4) agentGrid.ItemsSource = ag.OrderByDescending(Agent => Agent.Priority).Skip(start * 10).Take(10).ToList();
                }
                else // Фильтрация по конкретному типу агента
                {
                    var agg = ag.Where(Agent => Agent.AgentTypeID == iag);
                    fullCount = agg.Count();
                    if (order == 0) agentGrid.ItemsSource = agg.OrderBy(Agent => Agent.ID).Skip(start * 10).Take(10).ToList();
                    if (order == 1) agentGrid.ItemsSource = agg.OrderBy(Agent => Agent.Title).Skip(start * 10).Take(10).ToList();
                    if (order == 2) agentGrid.ItemsSource = agg.OrderByDescending(Agent => Agent.Title).Skip(start * 10).Take(10).ToList();
                    if (order == 3) agentGrid.ItemsSource = agg.OrderBy(Agent => Agent.Priority).Skip(start * 10).Take(10).ToList();
                    if (order == 4) agentGrid.ItemsSource = agg.OrderByDescending(Agent => Agent.Priority).Skip(start * 10).Take(10).ToList();
                }

                // Вызов функции для обновления кнопок навигации
                turnButton();
            }
            catch
            {
                return;
            }
        }
        private void agentGrid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (agentGrid.SelectedItems.Count > 0)
            {
                Agent agent = agentGrid.SelectedItems[0] as Agent;

                if (agent != null)
                {
                    fr.Content = new Page2(agent);
                }
            }
        }
       



        private void paginButto_Click(object sender, RoutedEventArgs e)
        {
            start = Convert.ToInt32(((Button)sender).Tag.ToString());
            Load();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            // Получаем введенный текст из TextBox
            fnd = ((TextBox)sender).Text;

            // Перезагружаем данные с учетом поискового запроса
            Load();
        }


        private void turnButton()
        {
            // Проверка, чтобы кнопка "Назад" была активна только если это не первая страница
            if (start == 0)
            {
                back.IsEnabled = false;
            }
            else
            {
                back.IsEnabled = true;
            }

            // Проверка, чтобы кнопка "Вперед" была активна только если есть следующая страница
            if ((start + 1) * 10 >= fullCount)
            {
                forward.IsEnabled = false;
            }
            else
            {
                forward.IsEnabled = true;
            }

            // Обновление счетчика количества страниц
            pagin.Children.Clear();
            int pageCount = (int)Math.Ceiling((double)fullCount / 10);
            for (int i = 0; i < pageCount; i++)
            {
                Button pageButton = new Button();
                pageButton.Content = (i + 1).ToString();
                pageButton.Tag = i;
                pageButton.Click += paginButto_Click;
                pagin.Children.Add(pageButton);
            }
        }


        private void agentGrid_LoadingRow_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            Agent agent = (Agent)e.Row.DataContext;
            int sum = 0;
            double fsum = 0;
            foreach (ProductSale ps in agent.ProductSale)
            {
                List<ProductMaterial> mtr = new List<ProductMaterial> { };
                mtr = helper.GetContext().ProductMaterial.Where(ProductMaterial => ProductMaterial.ProductID == ps.ProductID).ToList();
                foreach (ProductMaterial mt in mtr)
                {
                    double f = decimal.ToDouble(mt.Material.Cost);
                    fsum += f * (double)mt.Count;
                }
                fsum = fsum * ps.ProductCount;
                if (ps.SaleDate.AddDays(365).CompareTo(DateTime.Today) > 0)
                    sum += ps.ProductCount;
            }
            agent.sale = sum;
            agent.percent = 0;
            if (fsum >= 10000 && fsum < 50000) agent.percent = 5;
            if (fsum >= 50000 && fsum < 150000) agent.percent = 10;
            if (fsum >= 150000 && fsum < 500000) agent.percent = 20;
            if (fsum >= 500000) agent.percent = 25;
            if (agent.percent == 25)
            {
                SolidColorBrush hb = new SolidColorBrush(Colors.LightGreen);
                e.Row.Background = hb;
            };
        }


    private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;
            ComboBoxItem selectedItem = (ComboBoxItem)comboBox.SelectedItem;
            order = Convert.ToInt32(selectedItem.Tag.ToString());
            Load();
        }


        private void Button_Click(object sender, RoutedEventArgs e)
        {
            start--;
            Load();
        }

        private void Button_Click1(object sender, RoutedEventArgs e)
        {
            start++;
            Load();
        }

        private void updateButton_Click(object sender, RoutedEventArgs e)
        {
            if (agentGrid.SelectedItems.Count > 0)
            {
                int prt = 0;
                foreach (Agent agent in agentGrid.SelectedItems)
                {
                    if (agent.Priority > prt) prt = agent.Priority;
                }
                Window1 dlg = new Window1(prt);
                helper.prioritet = prt;
                helper.flag = false;
                dlg.ShowDialog();
                if (helper.flag)
                {
                    foreach (Agent agent in agentGrid.SelectedItems)
                    {
                        agent.Priority = helper.prioritet;
                        helper.GetContext().Entry(agent).State = EntityState.Modified;
                    }
                    helper.GetContext().SaveChanges();
                    Load();
                }
            }
        }



        private void deleteButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            fr.Content = new Page2(null);
        }

        private void revButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
