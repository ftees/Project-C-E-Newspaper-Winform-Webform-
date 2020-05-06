using Project.Logic;
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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns.Add("UserID", "UserID");          
            dataGridView1.Columns["UserID"].DataPropertyName = "id";
            dataGridView1.Columns["UserID"].ReadOnly = true;
            dataGridView1.Columns.Add("Name", "Name");
            dataGridView1.Columns["Name"].DataPropertyName = "username";
            dataGridView1.Columns["Name"].ReadOnly = true;
            dataGridView1.Columns.Add("Password", "Password");
            dataGridView1.Columns["Password"].DataPropertyName = "Password";
            dataGridView1.Columns["Password"].ReadOnly = true;
            dataGridView1.Columns.Add("Email", "Email");
            dataGridView1.Columns["Email"].DataPropertyName = "Email";
            dataGridView1.Columns["Email"].ReadOnly = true;
            dataGridView1.Columns.Add("Role", "Role");
            dataGridView1.Columns["Role"].DataPropertyName = "Role";
            dataGridView1.Columns["Role"].ReadOnly = true;

            dataGridView2.AutoGenerateColumns = false;
            dataGridView2.Columns.Add("PostID", "PostID");
            dataGridView2.Columns["PostID"].DataPropertyName = "postID";
            dataGridView2.Columns["PostID"].ReadOnly = true;
            dataGridView2.Columns.Add("Tittle", "Tittle");
            dataGridView2.Columns["Tittle"].DataPropertyName = "title";
            dataGridView2.Columns["Tittle"].ReadOnly = true;
            dataGridView2.Columns.Add("shortDesc", "Short Description");
            dataGridView2.Columns["shortDesc"].DataPropertyName = "shortDesc";
            dataGridView2.Columns["shortDesc"].ReadOnly = true;
            dataGridView2.Columns.Add("longDesc", "Long Description");
            dataGridView2.Columns["longDesc"].DataPropertyName = "longDesc";
            dataGridView2.Columns["longDesc"].ReadOnly = true;
            dataGridView2.Columns.Add("imgLink", "imgLink");
            dataGridView2.Columns["imgLink"].DataPropertyName = "imgLink";
            dataGridView2.Columns["imgLink"].ReadOnly = true;
            dataGridView2.Columns.Add("date", "date");
            dataGridView2.Columns["date"].DataPropertyName = "date";
            dataGridView2.Columns["date"].ReadOnly = true;
            dataGridView2.Columns.Add("writer", "writer");
            dataGridView2.Columns["writer"].DataPropertyName = "writer";
            dataGridView2.Columns["writer"].ReadOnly = true;
            
            DataGridViewButtonColumn delcol = new DataGridViewButtonColumn();
            delcol.Name = "delcol";
            delcol.Text = "Delete";
            delcol.UseColumnTextForButtonValue = true;
            dataGridView1.Columns.Add(delcol);
            comboBox1.SelectedIndex = 0;
            comboBox2.DisplayMember = "TopicName";
            comboBox2.ValueMember = "ID";
            comboBox2.DataSource = Topic.GetAllTopic();
            comboBox2.SelectedIndex = 0;
            LoadData();
            
        }
        
        private void LoadData()
        {
            if(comboBox1.Text == "All")
            {
                dataGridView1.DataSource = DataAccess.AccountDAO.GetAllAccount();
            }
            else
            {
                string s = comboBox1.Text;
                dataGridView1.DataSource = DataAccess.AccountDAO.GetAccountByRole(s);
            }
            if(comboBox2.Text == "All")
            {
                dataGridView2.DataSource = DataAccess.NewsDAO.getAllPost();
            }
            else
            {
                int s = Convert.ToInt32(comboBox2.SelectedValue);
                dataGridView2.DataSource = DataAccess.NewsDAO.getPostbyTopic(s);
            }
            
            
        }
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadData();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FormAdd fr = new FormAdd();
            fr.Visible = true;

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Columns[e.ColumnIndex].Name == "delcol")
            {
                string id = dataGridView1.Rows[e.RowIndex].Cells["UserID"].Value.ToString();
                DataAccess.AccountDAO.DeleteAcc(id);
                Project.Files.WriteFile("Delete User " + id + " ");
               
                LoadData();
            }
            

        }

        private void button1_Click(object sender, EventArgs e)
        {
             
            
        }
       
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
            DataView DV = new DataView(DataAccess.AccountDAO.GetAllAccount());
            DV.RowFilter = string.Format("id LIKE '%{0}%'", textBox1.Text);
            dataGridView1.DataSource = DV;

            DataView DV2 = new DataView(DataAccess.NewsDAO.getAllPost());
            DV2.RowFilter= string.Format("title LIKE '%{0}%'", textBox1.Text);
            dataGridView2.DataSource = DV2;
        }

        

        private void button1_Click_1(object sender, EventArgs e)
        {
            Form1 form = new Form1();
            form.Show();
            this.Dispose();
        }

        private void Form2_DoubleClick(object sender, EventArgs e)
        {
            LoadData();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView2.Visible = true;
            dataGridView1.Visible = false;
            label1.Text = "List Post";
            comboBox1.Visible = false;
            comboBox2.Visible = true;
            button5.BackColor = Color.DarkOrange;
            button6.BackColor = Color.LightGray;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            dataGridView2.Visible = false;
            label1.Text = "List Account";
            comboBox1.Visible = true;
            comboBox2.Visible = false;
            button5.BackColor = Color.LightGray;
            button6.BackColor = Color.DarkOrange;
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadData();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            History hs = new History();
            hs.Show();
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }
    }
}
