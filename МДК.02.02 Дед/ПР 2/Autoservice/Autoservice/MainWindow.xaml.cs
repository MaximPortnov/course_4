using System;
using System.Collections.Generic;
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
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace Autoservice
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    /// 
    public class TagsToStringConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is List<Tag> tags)
            {
                return string.Join(", ", tags.Select(t => t.Title));
            }
            return string.Empty;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

    public partial class MainWindow : Window
    {
        private List<Client> allClients = new List<Client>();
        private int currentPage = 1;
        private int recordsPerPage = 10;
        private int totalRecords;
        private int clientId;

        public MainWindow()
        {
            InitializeComponent();
            LoadClientsFromDatabase();
            DisplayClients();
            GenderFilter.SelectedIndex = 0;
            this.clientId = clientId;
        }

        private void LoadClientsFromDatabase()
        {
            allClients.Clear();

            string connectionString = ConfigurationManager.ConnectionStrings["ClientDBConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Запрос для получения клиентов и их тегов
                string query = @"
            SELECT c.ID, c.FirstName, c.LastName, c.Patronymic, c.Birthday, c.RegistrationDate, c.Email, c.Phone, 
                   c.GenderCode, c.PhotoPath, 
                   COUNT(cs.ID) AS VisitCount, 
                   MAX(cs.StartTime) AS LastVisitDate,
                   STUFF((
                       SELECT ', ' + t.Title + ':' + t.Color
                       FROM TagOfClient toc
                       JOIN Tag t ON toc.TagID = t.ID
                       WHERE toc.ClientID = c.ID
                       FOR XML PATH('')), 1, 2, '') AS Tags
            FROM Client c
            LEFT JOIN ClientService cs ON c.ID = cs.ClientID
            GROUP BY c.ID, c.FirstName, c.LastName, c.Patronymic, c.Birthday, c.RegistrationDate, c.Email, c.Phone, 
                     c.GenderCode, c.PhotoPath";

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    allClients.Add(new Client
                    {
                        Id = (int)reader["ID"],
                        FirstName = reader["FirstName"].ToString(),
                        LastName = reader["LastName"].ToString(),
                        Patronymic = reader["Patronymic"] != DBNull.Value ? reader["Patronymic"].ToString() : null,
                        BirthDate = reader["Birthday"] != DBNull.Value ? (DateTime)reader["Birthday"] : default,
                        RegistrationDate = (DateTime)reader["RegistrationDate"],
                        Email = reader["Email"] != DBNull.Value ? reader["Email"].ToString() : null,
                        Phone = reader["Phone"].ToString(),
                        GenderCode = reader["GenderCode"].ToString(),
                        PhotoPath = reader["PhotoPath"] != DBNull.Value ? reader["PhotoPath"].ToString() : null,
                        VisitCount = reader["VisitCount"] != DBNull.Value ? (int)reader["VisitCount"] : 0,
                        LastVisitDate = reader["LastVisitDate"] != DBNull.Value ? (DateTime?)reader["LastVisitDate"] : null,
                        Tags = reader["Tags"] != DBNull.Value
                               ? reader["Tags"].ToString()
                                   .Split(new[] { ", " }, StringSplitOptions.RemoveEmptyEntries)
                                   .Select(tagColor =>
                                   {
                                       var parts = tagColor.Split(':'); // Разделяем название и цвет
                                       return new Tag
                                       {
                                           Title = parts[0],
                                           Color = parts.Length > 1 ? parts[1] : "#FFFFFF" // Если цвет не указан, устанавливаем белый
                                       };
                                   })
                                   .ToList()
                               : new List<Tag>()
                    });
                }
            }
            totalRecords = allClients.Count;
        }



        private void DisplayClients(string sortBy = null)
        {
            var filteredClients = FilterAndSearchClients();
            if (!string.IsNullOrEmpty(sortBy))
            {
                filteredClients = SortClients(filteredClients, sortBy);
            }
            var paginatedClients = filteredClients.Skip((currentPage - 1) * recordsPerPage).Take(recordsPerPage).ToList();
            ClientsDataGrid.ItemsSource = paginatedClients;
            RecordCountTextBlock.Text = $"{paginatedClients.Count} из {totalRecords}";
        }


        private List<Client> FilterAndSearchClients()
        {
            string searchText = SearchTextBox.Text.ToLower();
            var selectedGender = (GenderFilter.SelectedItem as ComboBoxItem)?.Content.ToString();
            bool showBirthdaysThisMonth = BirthdayThisMonthCheckBox.IsChecked == true;

            var filteredClients = allClients
                .Where(c =>
                    (selectedGender == "All") ||
                    (selectedGender == "Male" && c.GenderCode == "м") ||
                    (selectedGender == "Female" && c.GenderCode == "ж"))
                .Where(c =>
                    c.FirstName.ToLower().Contains(searchText) ||
                    c.LastName.ToLower().Contains(searchText) ||
                    c.Email.ToLower().Contains(searchText) ||
                    c.Phone.Contains(searchText))
                .ToList();

            // Фильтр по дню рождения
            if (showBirthdaysThisMonth)
            {
                var currentMonth = DateTime.Now.Month;
                filteredClients = filteredClients
                    .Where(c => c.BirthDate.Month == currentMonth)
                    .ToList();
            }

            totalRecords = filteredClients.Count;
            return filteredClients;
        }

        private void BirthdayThisMonthCheckBox_Checked(object sender, RoutedEventArgs e)
        {
            DisplayClients();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            DisplayClients();
        }

        private void GenderFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DisplayClients();
        }

        private void PreviousPage_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage > 1)
            {
                currentPage--;
                DisplayClients();
            }
        }

        private void NextPage_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage * recordsPerPage < totalRecords)
            {
                currentPage++;
                DisplayClients();
            }
        }

        private void RecordsPerPageComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (RecordsPerPageComboBox.SelectedItem is ComboBoxItem selectedItem)
            {
                if (selectedItem.Content.ToString() == "All")
                {
                    recordsPerPage = totalRecords; // Показываем все записи
                }
                else
                {
                    int selectedValue;
                    if (int.TryParse(selectedItem.Content.ToString(), out selectedValue))
                    {
                        recordsPerPage = selectedValue;
                    }
                }
                DisplayClients();
            }
        }

        private List<Client> SortClients(List<Client> clients, string sortBy)
        {
            switch (sortBy)
            {
                case "Surname":
                    return clients.OrderBy(c => c.LastName).ToList(); // Сортировка по фамилии
                case "Last Visit":
                    //var temp = new List<Client>();
                    //clients.Sort((x, y) => x.LastVisitDate.GetValueOrDefault().CompareTo(y.LastVisitDate.GetValueOrDefault()));
                    return clients
                        .OrderByDescending(c => c.LastVisitDate.HasValue)  // Сначала клиенты с датой визита
                        //.ThenByDescending(c => c.LastVisitDate.Value.Day)            // Затем по самой дате
                        //.ThenByDescending(c => c.LastVisitDate.Value.Month)            // Затем по самой дате
                        //.ThenByDescending(c => c.LastVisitDate.Value.Year)            // Затем по самой дате
                        .ThenByDescending(c => c.LastVisitDate.GetValueOrDefault())            // Затем по самой дате
                        .ToList();
                case "Visits Count":
                    return clients.OrderByDescending(c => c.VisitCount).ToList(); // Сортировка по количеству посещений
                default:
                    return clients; // Без сортировки
            }
        }

        private void SortByComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string selectedSortBy = (SortByComboBox.SelectedItem as ComboBoxItem)?.Content.ToString();
            DisplayClients(selectedSortBy);
        }


        private void AddEditClientButton_Click(object sender, RoutedEventArgs e)
        {
            if (Application.Current.Windows.OfType<ClientForm>().Any())
            {
                MessageBox.Show("You cannot open multiple client edit windows.");
                return;
            }

            Client selectedClient = ClientsDataGrid.SelectedItem as Client;

            ClientForm clientForm = new ClientForm(this, selectedClient); // Передаем ссылку на главное окно
            if (clientForm.ShowDialog() == true)
            {
                LoadClientsFromDatabase(); // Обновляем список клиентов
                DisplayClients();
            }
        }


        private void DeleteClientButton_Click(object sender, RoutedEventArgs e)
        {
            // Проверяем, выбран ли клиент
            Client selectedClient = ClientsDataGrid.SelectedItem as Client;
            if (selectedClient == null)
            {
                MessageBox.Show("Please select a client to delete.");
                return;
            }

            // Проверяем, есть ли у клиента посещения
            if (selectedClient.VisitCount > 0)
            {
                MessageBox.Show("Cannot delete a client with visits.");
                return;
            }

            // Подтверждение удаления
            MessageBoxResult result = MessageBox.Show($"Are you sure you want to delete {selectedClient.FirstName} {selectedClient.LastName}?", "Delete Confirmation", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                // Удаляем клиента из базы данных
                DeleteClientFromDatabase(selectedClient.Id);

                // Обновляем список клиентов
                LoadClientsFromDatabase();
                DisplayClients();
            }
        }


        private void DeleteClientFromDatabase(int clientId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ClientDBConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string deleteQuery = "DELETE FROM Client WHERE ID = @ClientId";
                SqlCommand command = new SqlCommand(deleteQuery, connection);
                command.Parameters.AddWithValue("@ClientId", clientId);

                try
                {
                    command.ExecuteNonQuery();
                    MessageBox.Show("Client deleted successfully.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error deleting client: {ex.Message}");
                }
            }
        }

        public void RefreshClientList()
        {
            allClients.Clear(); // Очищаем текущий список
            LoadClientsFromDatabase(); // Загружаем данные из базы
            DisplayClients(); // Обновляем отображение
        }

        private List<ClientVisit> LoadClientVisits(int clientId)
        {
            var clientVisits = new List<ClientVisit>();
            string connectionString = ConfigurationManager.ConnectionStrings["ClientDBConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
            SELECT cs.StartTime, s.Title
            FROM ClientService cs
            JOIN Service s ON cs.ServiceID = s.ID
            WHERE cs.ClientID = @ClientId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ClientId", clientId);

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    clientVisits.Add(new ClientVisit
                    {
                        VisitDate = (DateTime)reader["StartTime"],
                        ServiceName = reader["Title"].ToString(),
                    });
                }
            }
            return clientVisits;
        }

        private void ViewClientVisitsButton_Click(object sender, RoutedEventArgs e)
        {
            Client selectedClient = ClientsDataGrid.SelectedItem as Client;
            if (selectedClient == null)
            {
                MessageBox.Show("Please select a client to view their visits.");
                return;
            }

            // Предположим, у вас есть метод для получения посещений клиента
            var visits = LoadClientVisits(selectedClient.Id); // Получаем посещения клиента

            if (visits == null || visits.Count == 0) // Проверяем, есть ли посещения
            {
                MessageBox.Show("У клиента нет посещений."); // Сообщение если посещений нет
                return;
            }

            ClientVisitsWindow visitsWindow = new ClientVisitsWindow(selectedClient.Id); // Передаем clientId
            visitsWindow.ShowDialog(); // Открываем окно как диалог
        }

        private List<Tag> GetTagsForClient(int clientId)
        {
            List<Tag> tags = new List<Tag>();

            using (SqlConnection connection = new SqlConnection("ClientDBConnectionString"))
            {
                connection.Open();
                string query = @"
            SELECT t.ID, t.Title, t.Color 
            FROM Tags t
            JOIN ClientTags ct ON ct.TagID = t.ID 
            WHERE ct.ClientID = @ClientID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ClientID", clientId);
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Tag tag = new Tag
                        {
                            Id = reader.GetInt32(0),
                            Title = reader.GetString(1),
                            Color = reader.GetString(2)
                        };
                        tags.Add(tag);
                    }
                }
            }

            return tags;
        }


    }

    public class Client
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Patronymic { get; set; }
        public DateTime BirthDate { get; set; }
        public DateTime RegistrationDate { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string GenderCode { get; set; }
        public string PhotoPath { get; set; }
        public DateTime? LastVisitDate { get; set; }
        public int VisitCount { get; set; }
        public List<Tag> Tags { get; set; } = new List<Tag>();

    }

    public class ClientVisit
    {
        public DateTime VisitDate { get; set; }
        public string ServiceName { get; set; }
    }

    public class Tag
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Color { get; set; }
    }

    

}
