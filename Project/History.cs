using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Project
{
    public partial class History : Form
    {
        public History()
        {
            InitializeComponent();
        }

        private void History_Load(object sender, EventArgs e)
        {
            
            StreamReader sr = new StreamReader(@"E:\C#\Project\Project\History.txt");
            richTextBox1.Text = sr.ReadToEnd();
            
        }
    }
}
