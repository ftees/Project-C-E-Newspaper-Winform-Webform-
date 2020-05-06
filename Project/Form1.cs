using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Project
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
        private void LoadData()
        {

           
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            comboBox1.SelectedIndex = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string id = textBox1.Text.Trim();
            string pass = textBox2.Text.Trim();
            string role = comboBox1.Text.Trim();
            DataTable dt = DataAccess.AccountDAO.Login(id,pass,role);
            if (dt.Rows.Count == 1)
            {
                if (role == "admin")
                {
                    Form2 form2 = new Form2();
                    this.Hide();
                    form2.Show();
                }else if(role == "writer")
                {
                    Form3 form3 = new Form3(id);
                    this.Hide();
                    form3.Show();
                }
                
            }
            else
            {
                MessageBox.Show("Username or password are incorrect !");
            }

        }
    }
}
