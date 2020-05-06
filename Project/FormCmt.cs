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
    public partial class FormCmt : Form
    {
        int PostID;
        public FormCmt()
        {
            InitializeComponent();
        }
        public FormCmt(int postID)
        {
            PostID = postID;
            InitializeComponent();
            
        }

        private void FormCmt_Load(object sender, EventArgs e)
        {

            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns.Add("commentID", "commentID");
            dataGridView1.Columns["commentID"].DataPropertyName = "commentID";
            dataGridView1.Columns.Add("content", "Content");
            dataGridView1.Columns["content"].DataPropertyName = "content";
            dataGridView1.Columns.Add("[account ID]", "Account ID");
            dataGridView1.Columns["[account ID]"].DataPropertyName = "account ID";
            
            DataGridViewButtonColumn delcol = new DataGridViewButtonColumn();
            delcol.Name = "delcol";
            delcol.Text = "Delete";
            delcol.UseColumnTextForButtonValue = true;
            dataGridView1.Columns.Add(delcol);
            LoadData();
        }
        public void LoadData()
        {
            dataGridView1.DataSource = DataAccess.NewsDAO.getComment(PostID);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Columns[e.ColumnIndex].Name == "delcol")
            {
                int id = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells["commentID"].Value);
                DataAccess.NewsDAO.DeleteCmt(id);
                Project.Files.WriteFile("Delete Comment " + id + " ");
                LoadData();
            }
        }
    }
}
