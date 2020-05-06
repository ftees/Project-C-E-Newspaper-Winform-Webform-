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
    public partial class Form3 : Form
    {
        string WriterID;
        public Form3()
        {
            InitializeComponent();
        }
        public Form3(string s)
        {
            WriterID = s;
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns.Add("PostID", "PostID");
            dataGridView1.Columns["PostID"].DataPropertyName = "PostID";
            dataGridView1.Columns.Add("Tittle", "Tittle");
            dataGridView1.Columns["Tittle"].DataPropertyName = "Tittle";
            dataGridView1.Columns.Add("shortDesc", "Short Description");
            dataGridView1.Columns["shortDesc"].DataPropertyName = "shortDesc";
            dataGridView1.Columns.Add("longDesc", "Long Description");
            dataGridView1.Columns["longDesc"].DataPropertyName = "longDesc";
            dataGridView1.Columns.Add("Topic", "Topic");
            dataGridView1.Columns["Topic"].DataPropertyName = "TopicName";
            dataGridView1.Columns.Add("imgLink", "Image");
            dataGridView1.Columns["imgLink"].DataPropertyName = "imgLink";
            dataGridView1.Columns.Add("date", "Date Created");
            dataGridView1.Columns["date"].DataPropertyName = "date";
            label4.Text = WriterID;
            DataGridViewButtonColumn edit = new DataGridViewButtonColumn();
            edit.Name = "editcol";
            edit.Text = "Update";
            edit.UseColumnTextForButtonValue = true;
            dataGridView1.Columns.Add(edit);

            DataGridViewButtonColumn delcol = new DataGridViewButtonColumn();
            delcol.Name = "delcol";
            delcol.Text = "Delete";
            delcol.UseColumnTextForButtonValue = true;
            dataGridView1.Columns.Add(delcol);
            dateTimePicker1.Value = new DateTime(1900, 1, 1);
            dateTimePicker2.Value = new DateTime(DateTime.Now.Year + 1, 1, 1);
            LoadData();

        }
        public void LoadData()
        {
            DateTime from = dateTimePicker1.Value;
            DateTime to = dateTimePicker2.Value;
            dataGridView1.DataSource = Logic.NewsList.GetAllNews(WriterID, from, to);
            //dataGridView1.DataSource = DataAccess.NewsDAO.getPost(WriterID, from, to);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            FormAddNews frm = new FormAddNews(WriterID);
            frm.Show();
        }

        private void dateTimePicker2_ValueChanged(object sender, EventArgs e)
        {
            LoadData();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Columns[e.ColumnIndex].Name == "delcol")
            {
                int id = Convert.ToInt32(((List<News>)dataGridView1.DataSource)[e.RowIndex].PostID);
                DataAccess.NewsDAO.DeletePost(id);
                Project.Files.WriteFile("Delete Post " + id + " ");
                LoadData();
            }
            if(dataGridView1.Columns[e.ColumnIndex].Name == "editcol")
            {
                int id = Convert.ToInt32(((List<News>)dataGridView1.DataSource)[e.RowIndex].PostID);
                FormAddNews f = new FormAddNews(((List<News>)dataGridView1.DataSource)[e.RowIndex], id,WriterID);
                f.visibleUpdate();
                f.Show();

                
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form1 form = new Form1();
            form.Show();
            this.Dispose();
        }

        private void Form3_DoubleClick(object sender, EventArgs e)
        {
            LoadData();
        }

        

        private void button5_Click(object sender, EventArgs e)
        {
            Account account = Logic.AccountList.GetAccountbyID(WriterID);
            FormAdd form = new FormAdd(account,WriterID);
            form.visibleUpdate();
            form.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            AreaForm ar = new AreaForm();
            ar.Show();
        }
    }
}
