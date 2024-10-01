using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
using System.Windows.Shapes;

namespace Autoservice
{
    /// <summary>
    /// Логика взаимодействия для ClientVisitsWindow.xaml
    /// </summary>
    public partial class ClientVisitsWindow : Window
    {
        public ClientVisitsWindow(int clientId)
        {
            InitializeComponent();
            LoadClientVisitsData(clientId);
        }

        private void LoadClientVisitsData(int clientId)
        {
            var visits = LoadClientVisits(clientId);
            VisitsDataGrid.ItemsSource = visits;
        }

        private List<ClientVisit> LoadClientVisits(int clientId)
        {
            // Реализация метода загрузки посещений из базы данных
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
    }
}
