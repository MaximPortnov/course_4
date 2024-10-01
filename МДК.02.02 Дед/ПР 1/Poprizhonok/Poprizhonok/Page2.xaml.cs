using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
using Microsoft.Win32;

namespace Poprizhonok
{
    /// <summary>
    /// Логика взаимодействия для Page2.xaml
    /// </summary>
    public partial class Page2 : Page
    {
        Agent agent;
        private int curSelPr = -1;
        private int curTypAg = 0;

        public Page2(Agent ag)
        {
            InitializeComponent();
            try
            {
                Type.ItemsSource = helper.GetContext().AgentType.ToList();
                product.ItemsSource = helper.GetContext().Product.ToList();
            }
            catch { };
            if (ag != null)
            {
                agent = ag;
                Type.SelectedItem = ag.AgentType;
                this.Title.Text = ag.Title;
                this.Adress.Text = ag.Address;
                this.Inn.Text = ag.INN;
                this.Kpp.Text = ag.KPP;
                this.Director.Text = ag.DirectorName;
                this.Phone.Text = ag.Phone;
                this.Prioritet.Text = ag.Priority.ToString();
                historyGrid.ItemsSource = helper.GetContext().ProductSale.Where(ProductSale => ProductSale.AgentID == ag.ID).ToList();
            }
            else
            {
                agent = new Agent();
                btnDelAg.IsEnabled = false;
                btnWritHi.IsEnabled = false;
                btnDelHi.IsEnabled = false;
            }
            this.DataContext = agent;

        }


        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (curTypAg == 0)
            {
                MessageBox.Show("Пожалуйста, выберите тип агента.");
                return;
            }

            // Убираем проверки на вводимые значения
            agent.Title = this.Title.Text;
            agent.AgentTypeID = curTypAg;
            agent.Address = this.Adress.Text;
            agent.INN = this.Inn.Text;
            agent.KPP = this.Kpp.Text;
            agent.Phone = this.Phone.Text;
            agent.DirectorName = this.Director.Text;
            agent.Email = this.Emale.Text;
            agent.Logo = this.LogoPath.Text;

            try
            {
                agent.Priority = Convert.ToInt32(this.Prioritet.Text);
            }
            catch
            {
                return;
            }

            try
            {
                if (agent.ID > 0)
                {
                    helper.GetContext().Entry(agent).State = EntityState.Modified;
                    helper.GetContext().SaveChanges();
                    MessageBox.Show("Обновление информации об агенте завершено");
                }
                else
                {
                    helper.GetContext().Agent.Add(agent);
                    helper.GetContext().SaveChanges();
                    MessageBox.Show("Добавление информации об агенте завершено");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }

            btnDelAg.IsEnabled = true;
            btnWritHi.IsEnabled = true;
            btnDelHi.IsEnabled = true;
        }


        // Обработчик для выбора типа агента
        private void Type_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Type.SelectedItem != null)
            {
                curTypAg = ((AgentType)Type.SelectedItem).ID;
            }
        }




        // Обработчик для кнопки "Удалить"
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (agent.ProductSale.Count > 0)
            {
                MessageBox.Show("Удаление не возможно!");
                return;
            }
            foreach (Shop shop in agent.Shop)
            {
                helper.GetContext().Shop.Remove(shop);
            }
            foreach (AgentPriorityHistory apr in agent.AgentPriorityHistory)
            {
                helper.GetContext().AgentPriorityHistory.Remove(apr);
            }
            helper.GetContext().Agent.Remove(agent);
            helper.GetContext().SaveChanges();
            MessageBox.Show("Удаление информации об агенте завешено!");
            this.NavigationService.GoBack();
        }


        // Обработчик для добавления записи
        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            int cnt = 0;
            try
            {
                cnt = Convert.ToInt32(count.Text);
            }
            catch
            {
                return;
            }
            string dt = date.ToString();
            if (curSelPr > 0 && dt != "" && cnt > 0)
            {
                ProductSale pr = new ProductSale();
                pr.AgentID = agent.ID;
                pr.ProductID = curSelPr;
                pr.SaleDate = (DateTime)date.SelectedDate;
                pr.ProductCount = cnt;
                try
                {
                    helper.GetContext().ProductSale.Add(pr);
                    helper.GetContext().SaveChanges();
                    historyGrid.ItemsSource = helper.GetContext().ProductSale.Where(ProductSale => ProductSale.AgentID == agent.ID).ToList();
                }
                catch
                {
                    return;
                }
            }
        }





        // Обработчик для удаления записи
        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < historyGrid.SelectedItems.Count; i++)
            {
                ProductSale prs = historyGrid.SelectedItems[i] as ProductSale;
                if (prs != null)
                {
                    helper.GetContext().ProductSale.Remove(prs);
                }
            }
            try
            {
                helper.GetContext().SaveChanges();
                historyGrid.ItemsSource = helper.GetContext().ProductSale.Where(ProductSale => ProductSale.AgentID == agent.ID).ToList();
            }
            catch { return; };
        }

        private void SelectLogo_Click(object sender, RoutedEventArgs e)
        {
            // Создаем диалоговое окно выбора файла
            OpenFileDialog openFileDialog = new OpenFileDialog();

            // Устанавливаем начальную папку (укажите путь к вашей папке)
            string projectPath = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            string agentsPath = System.IO.Path.Combine(projectPath, "agents");
            openFileDialog.InitialDirectory = agentsPath;

            // Фильтруем типы файлов, если нужно
            openFileDialog.Filter = "Image Files (*.png;*.jpg;*.jpeg)|*.png;*.jpg;*.jpeg|All Files (*.*)|*.*";

            // Показываем диалоговое окно и проверяем результат
            if (openFileDialog.ShowDialog() == true)
            {
                // Отображаем путь к выбранному файлу в текстовом поле
                LogoPath.Text = openFileDialog.FileName;

                // Загружаем изображение и отображаем его в элементе Image
                LogoImage.Source = new BitmapImage(new Uri(openFileDialog.FileName));
            }
        }


        private void historyGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // Логика обработки изменения выбора в таблице истории
        }
        private void product_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            curSelPr = ((Product)product.SelectedItem).ID;
        }


        private void mask_TextChanged(object sender, TextChangedEventArgs e)
        {
            string fnd = ((TextBox)sender).Text;
            try
            {
                product.ItemsSource = helper.GetContext().Product.Where(Product => Product.Title.Contains(fnd)).ToList();
            }
            catch { };
        }

    }
}

