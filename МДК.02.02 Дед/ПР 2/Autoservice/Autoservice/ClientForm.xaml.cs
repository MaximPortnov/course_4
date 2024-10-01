using Microsoft.Win32;
using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Media.Imaging;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;

namespace Autoservice
{
    public partial class ClientForm : Window
    {
        private Client _client;
        private MainWindow _mainWindow; // Ссылка на главное окно
        private List<Tag> _tags; // Список тегов (изменено на List<Tag>)
        private List<Tag> _tags_all; // Список тегов (изменено на List<Tag>)

        public ClientForm(MainWindow mainWindow, Client client = null)
        {
            InitializeComponent();
            _mainWindow = mainWindow;
            _client = client;
            _tags = new List<Tag>(); // Инициализация списка тегов
            _tags_all = new List<Tag>(); // Инициализация списка тегов

            if (_client != null)
            {
                LoadClientData();
            }
        }

        private void LoadClientData()
        {
            FirstNameTextBox.Text = _client.FirstName;
            LastNameTextBox.Text = _client.LastName;
            PatronymicTextBox.Text = _client.Patronymic;
            EmailTextBox.Text = _client.Email;
            PhoneTextBox.Text = _client.Phone;
            BirthDatePicker.SelectedDate = _client.BirthDate;
            RegistrationDatePicker.SelectedDate = _client.RegistrationDate; // Загружаем дату регистрации

            if (_client.GenderCode == "м")
                MaleRadioButton.IsChecked = true;
            else
                FemaleRadioButton.IsChecked = true;

            // Загрузка фотографии из папки images
            if (!string.IsNullOrEmpty(_client.PhotoPath))
            {
                try
                {
                    string imagePath = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "images", _client.PhotoPath);

                    PhotoPreview.Source = new BitmapImage(new Uri(imagePath, UriKind.Absolute));
                }
                catch (UriFormatException ex)
                {
                    MessageBox.Show("Ошибка в пути к изображению: " + ex.Message);
                }
            }

            // Загрузка тегов
            _tags = LoadTagsFromDatabase(_client.Id); // Загрузка тегов из базы данных
            _tags_all = LoadTagsFromDatabase(); // Загрузка тегов из базы данных
            UpdateTagsListBox(); // Обновляем ListBox с тегами
        }

        private void UpdateTagsListBox()
        {
            TagsListBox.ItemsSource = null; // Обнуляем источник данных
            TagsListBox.ItemsSource = _tags.Select(tag => tag.Title).ToList(); // Устанавливаем новый источник данных
        }

        private List<Tag> LoadTagsFromDatabase(int clientId)
        {
            List<Tag> tags = new List<Tag>();

            // Замените на вашу строку подключения
            string connectionString = "Server=DESKTOP-8E51PTA\\SQLEXPRESS;Database=Autoservice;Trusted_Connection=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
        SELECT t.ID, t.Title, t.Color 
        FROM Tag t
        JOIN TagOfClient toc ON toc.TagID = t.ID 
        WHERE toc.ClientID = @ClientID";

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

            return tags; // Возвращаем List<Tag>
        }
        private List<Tag> LoadTagsFromDatabase()
        {
            List<Tag> tags = new List<Tag>();

            // Замените на вашу строку подключения
            string connectionString = "Server=DESKTOP-8E51PTA\\SQLEXPRESS;Database=Autoservice;Trusted_Connection=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
        SELECT t.ID, t.Title, t.Color 
        FROM Tag t";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
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

            return tags; // Возвращаем List<Tag>
        }


        private void AddTagButton_Click(object sender, RoutedEventArgs e)
        {
            string newTagTitle = TagTextBox.Text.Trim(); // Получаем название тега

            if (!string.IsNullOrEmpty(newTagTitle) && !_tags.Any(t => t.Title.Equals(newTagTitle, StringComparison.OrdinalIgnoreCase)))
            {
                var newTag = new Tag { Title = newTagTitle, Color = "defaultColor" }; // Установите цвет по умолчанию или выберите цвет
                _tags.Add(newTag); // Добавляем новый тег
                UpdateTagsListBox(); // Обновляем отображение тегов
                TagTextBox.Clear(); // Очищаем текстовое поле
            }
            else
            {
                MessageBox.Show("Тег не может быть пустым и не должен повторяться.");
            }
        }

        private void RemoveTagButton_Click(object sender, RoutedEventArgs e)
        {
            if (TagsListBox.SelectedItem != null)
            {
                string selectedTagTitle = TagsListBox.SelectedItem.ToString();
                var tagToRemove = _tags.FirstOrDefault(t => t.Title.Equals(selectedTagTitle, StringComparison.OrdinalIgnoreCase));

                if (tagToRemove != null)
                {
                    _tags.Remove(tagToRemove); // Удаляем выбранный тег
                    UpdateTagsListBox(); // Обновляем отображение тегов
                }
            }
            else
            {
                MessageBox.Show("Выберите тег для удаления.");
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (ValidateInput())
            {
                if (_client == null)
                {
                    _client = new Client();
                    _client.RegistrationDate = DateTime.Now; // Устанавливаем дату регистрации для нового клиента
                }

                _client.FirstName = FirstNameTextBox.Text;
                _client.LastName = LastNameTextBox.Text;
                _client.Patronymic = PatronymicTextBox.Text;
                _client.Email = EmailTextBox.Text;
                _client.Phone = PhoneTextBox.Text;
                _client.BirthDate = BirthDatePicker.SelectedDate.Value;
                _client.GenderCode = MaleRadioButton.IsChecked == true ? "м" : "ж";

                // Сохранение пути к фотографии, если изображение выбрано
                if (PhotoPreview.Source is BitmapImage image)
                {
                    _client.PhotoPath = SavePhotoToDisk(image);
                }

                // Логика сохранения клиента в базу данных
                if (_client.Id == 0) // Если это новый клиент
                {
                    AddClient(_client);
                }
                else // Если редактируем существующего клиента
                {
                    UpdateClient(_client);
                }

                // Сохранение тегов в базу данных
                SaveTagsToDatabase(_client.Id);

                _mainWindow.RefreshClientList(); // Обновляем список в главном окне
                DialogResult = true;
                Close();
            }
        }

        private void SaveTagsToDatabase(int clientId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ClientDBConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Удаление старых тегов
                string deleteQuery = "DELETE FROM TagOfClient WHERE ClientID = @ClientId";
                using (SqlCommand deleteCommand = new SqlCommand(deleteQuery, connection))
                {
                    deleteCommand.Parameters.AddWithValue("@ClientId", clientId);
                    deleteCommand.ExecuteNonQuery();
                }

                // Добавление новых тегов
                foreach (var tag in _tags)
                {
                    string insertQuery = "INSERT INTO TagOfClient (ClientID, TagID) VALUES (@ClientId, @TagId)";
                    //INSERT INTO TagOfClient (ClientID, TagID) VALUES (1, 3)
                    using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                    {
                        insertCommand.Parameters.AddWithValue("@ClientId", clientId);
                        insertCommand.Parameters.AddWithValue("@TagId", _tags_all.Find(x => x.Title == tag.Title).Id); // Используем ID тега
                        insertCommand.ExecuteNonQuery();
                    }
                }
            }
        }

        private void SelectPhotoButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image Files|*.jpg;*.jpeg;*.png|All Files|*.*"
            };

            if (openFileDialog.ShowDialog() == true)
            {
                var fileInfo = new FileInfo(openFileDialog.FileName);
                if (fileInfo.Length > 2 * 1024 * 1024) // 2 MB limit
                {
                    MessageBox.Show("Размер файла не должен превышать 2 МБ.");
                    return;
                }
                PhotoPreview.Source = new BitmapImage(new Uri(openFileDialog.FileName));
            }
        }

        private bool ValidateInput()
        {
            if (string.IsNullOrWhiteSpace(FirstNameTextBox.Text) ||
                string.IsNullOrWhiteSpace(LastNameTextBox.Text) ||
                string.IsNullOrWhiteSpace(EmailTextBox.Text) ||
                string.IsNullOrWhiteSpace(PhoneTextBox.Text))
            {
                MessageBox.Show("Все поля должны быть заполнены.");
                return false;
            }

            // Проверка email
            if (!Regex.IsMatch(EmailTextBox.Text, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                MessageBox.Show("Неверный формат email.");
                return false;
            }

            // Проверка телефона
            if (!Regex.IsMatch(PhoneTextBox.Text, @"^[\d\s\+\-\(\)]+$"))
            {
                MessageBox.Show("Телефон может содержать только цифры и символы: +, -, (, ), пробел.");
                return false;
            }

            if (FirstNameTextBox.Text.Length > 50 || LastNameTextBox.Text.Length > 50 || PatronymicTextBox.Text.Length > 50)
            {
                MessageBox.Show("Поле ФИО не может превышать 50 символов.");
                return false;
            }

            return true;
        }

        private string SavePhotoToDisk(BitmapImage image)
        {
            string directoryPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "images");

            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            string fileName = $"{Guid.NewGuid()}.jpg"; // Генерация уникального имени файла
            string filePath = Path.Combine(directoryPath, fileName);

            using (FileStream stream = new FileStream(filePath, FileMode.Create))
            {
                BitmapEncoder encoder = new JpegBitmapEncoder();
                encoder.Frames.Add(BitmapFrame.Create(image));
                encoder.Save(stream);
            }

            return fileName; // Возвращаем имя файла для сохранения в базе данных
        }

        private void AddClient(Client client)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ClientDBConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = @"
        INSERT INTO Client (FirstName, LastName, Patronymic, Email, Phone, BirthDate, GenderCode, PhotoPath, RegistrationDate)
        OUTPUT INSERTED.ID
        VALUES (@FirstName, @LastName, @Patronymic, @Email, @Phone, @BirthDate, @GenderCode, @PhotoPath, @RegistrationDate)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FirstName", client.FirstName);
                    command.Parameters.AddWithValue("@LastName", client.LastName);
                    command.Parameters.AddWithValue("@Patronymic", client.Patronymic);
                    command.Parameters.AddWithValue("@Email", client.Email);
                    command.Parameters.AddWithValue("@Phone", client.Phone);
                    command.Parameters.AddWithValue("@BirthDate", client.BirthDate);
                    command.Parameters.AddWithValue("@GenderCode", client.GenderCode);
                    command.Parameters.AddWithValue("@PhotoPath", client.PhotoPath);
                    command.Parameters.AddWithValue("@RegistrationDate", client.RegistrationDate);

                    client.Id = (int)command.ExecuteScalar(); // Получаем ID нового клиента
                }
            }
        }

        private void UpdateClient(Client client)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ClientDBConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = @"
        UPDATE Client
        SET FirstName = @FirstName,
            LastName = @LastName,
            Patronymic = @Patronymic,
            Email = @Email,
            Phone = @Phone,
            Birthday = @BirthDate,
            GenderCode = @GenderCode,
            PhotoPath = @PhotoPath
        WHERE Id = @Id";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", client.Id);
                    command.Parameters.AddWithValue("@FirstName", client.FirstName);
                    command.Parameters.AddWithValue("@LastName", client.LastName);
                    command.Parameters.AddWithValue("@Patronymic", client.Patronymic);
                    command.Parameters.AddWithValue("@Email", client.Email);
                    command.Parameters.AddWithValue("@Phone", client.Phone);
                    command.Parameters.AddWithValue("@BirthDate", client.BirthDate);
                    command.Parameters.AddWithValue("@GenderCode", client.GenderCode);
                    command.Parameters.AddWithValue("@PhotoPath", client.PhotoPath);

                    command.ExecuteNonQuery(); // Выполняем обновление
                }
            }
        }

    }
}
