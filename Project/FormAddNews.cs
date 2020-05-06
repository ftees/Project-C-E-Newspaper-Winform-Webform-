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
    public partial class FormAddNews : Form
    {
        News n;
        string writer;
        string imgLink;
        int Postid;
        public FormAddNews()
        {
            InitializeComponent();
        }
        public FormAddNews(string s)
        {
            writer = s;
            InitializeComponent();
        }
        public FormAddNews(News s)
        {
            n = s;
            InitializeComponent();
        }
        public FormAddNews(News s,int id, string wr)
        {
            n = s;
            Postid = id;
            writer = wr;
            InitializeComponent();
        }
       
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string title = textBox1.Text;
                int topicID = Convert.ToInt32(comboBox1.SelectedValue);
                string shortDesc = textBox2.Text;
                string longDesc = richTextBox1.Text;
                string img = imgLink;
                //E:\C#\Project\ProjectWeb\Images
                string imgfix = imgLink.Substring(24);
                DateTime dateTime = DateTime.Now;
                string datetime = dateTime.ToString();
                n = new News(title, shortDesc, longDesc, imgfix, datetime, topicID, writer);
                n.AddNews();
                MessageBox.Show("Add Succesfully");
                Project.Files.WriteFile("Add New Post by " + writer + " ");
                this.Dispose();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
            
        }

        private void FormAddNews_Load(object sender, EventArgs e)
        {
            LoadData();
            if(n != null)
            {
                textBox1.Text = n.Tittle;
                textBox2.Text = n.ShortDesc;
                richTextBox1.Text = n.LongDesc;
                string img = n.imgLink;
                String newimg = @"E:\C#\Project\ProjectWeb" + img;
                pictureBox1.ImageLocation = newimg;               
                pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;

            }
        }
        public void visibleUpdate()
        {
            button1.Visible = false;
            button2.Visible = true;
            label7.Visible = true;

        }
       
        public void LoadData()
        {
            comboBox1.DisplayMember = "TopicName";
            comboBox1.ValueMember = "ID";
            comboBox1.DataSource = DataAccess.NewsDAO.getTopic();
            comboBox1.SelectedIndex = 0;
        }
        private void pictureBox1_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            openFileDialog1.ShowDialog();
            imgLink = openFileDialog1.FileName;
            pictureBox1.ImageLocation = openFileDialog1.FileName;
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {

                string title = textBox1.Text;
                int topicID = Convert.ToInt32(comboBox1.SelectedValue);
                string shortDesc = textBox2.Text;
                string longDesc = richTextBox1.Text;
                string img = imgLink;
                string imgfix = imgLink.Substring(24);
                DateTime dateTime = DateTime.Now;
                string datetime = dateTime.ToString();
                n = new News(title, shortDesc, longDesc, imgfix, datetime, topicID, writer);
                DataAccess.NewsDAO.Updatepost(n, Postid, writer);
                MessageBox.Show("Update Succesfully");
                Project.Files.WriteFile("Update Post by " + writer + " ");
                this.Dispose();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void FormAddNews_FormClosed(object sender, FormClosedEventArgs e)
        {
            
        }

        private void FormAddNews_FormClosing(object sender, FormClosingEventArgs e)
        {
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string topicName = textBox3.Text;
            if (textBox3.Text == String.Empty)
            {
                MessageBox.Show("Can't Empty");
            }
            else
            {
                DataAccess.NewsDAO.InsertTopic(topicName);
                button3.Visible = false;
                textBox3.Visible = false;
                LoadData();
                MessageBox.Show("Add topic successful");
                Project.Files.WriteFile("Add New Topic by " + writer + " ");
            }
        }

        private void label6_Click(object sender, EventArgs e)
        {
            button3.Visible = true;
            textBox3.Visible = true;
            
        }

        private void label7_Click(object sender, EventArgs e)
        {
            FormCmt fm = new FormCmt(Postid);
            fm.Show();
        }
    }
}
