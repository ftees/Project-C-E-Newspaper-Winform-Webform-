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
    public partial class AreaForm : Form
    {
        public AreaForm()
        {
            InitializeComponent();
        }
       
     
        private void AreaForm_Load(object sender, EventArgs e)
        {
            List<Area> areas = Logic.Area.GetAreas();
            foreach (var i in areas)
            {
                Button btnew = new Button();
                btnew.Text = i.ID + "    |    " + i.Name;
                btnew.Name = i.ID;
                btnew.Size = new System.Drawing.Size(300, 50);
                btnew.Click += newButton_Click;
                flowLayoutPanel1.Controls.Add(btnew);
            }

           
        }
        private void newButton_Click(object sender, EventArgs e)
        {
            this.Controls.RemoveByKey("btAdd"); //remove control 
        }

    }
}
