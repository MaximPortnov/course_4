﻿using System;
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

namespace Poprizhonok
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    /// 
    public class helper
    {
        public static poprizhonokEntities ent;
        public static bool flag = false;
        public static int prioritet = 0;

        public static poprizhonokEntities  GetContext()
        {
            if (ent == null)
            {
                ent = new poprizhonokEntities ();
            }
            return ent;
        }
    }
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            frame.Content = new Page1(frame);

        }

        private void frame_LoadCompleted(object sender, NavigationEventArgs e)
        {
            try
            {
                Page1 pg = (Page1)e.Content;
                pg.Load();
            }
            catch { };

        }

    }
}
