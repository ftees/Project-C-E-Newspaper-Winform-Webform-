using Project.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace Project
{
    public partial class FormAdd : Form
    {
        Account ac;
        private string id;
        public FormAdd()
        {
            InitializeComponent();
        }
        public FormAdd(Account a,string s)
        {
            ac = a;
            id = s;         
            InitializeComponent();
        }
        
        private void label1_Click(object sender, EventArgs e)
        {

        }
        public static bool CheckEmail(string email)
        {
            return Regex.Match(email,("^[a-z][a-z0-9_.]{5,32}@[a-z0-9]{2,}(.[a-z0-9]{2,4})$")).Success;
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                bool checkID = false, checkName = false, checkPass = false, checkEmail = false;
                string id = textBox1.Text;
                if(id == String.Empty)
                {
                    label6.Text = "Not Empty";
                    label6.ForeColor = Color.Red;
                    checkID = true;
                }
                else
                {
                    label6.Text = "";
                }

                string name = textBox2.Text;
                if (name == String.Empty)
                {
                    label7.Text = "Not Empty";
                    label7.ForeColor = Color.Red;
                    checkName = true;
                }
                else
                {
                    label7.Text = "";
                }
                string pass = textBox3.Text;
                if (pass == String.Empty)
                {
                    label8.Text = "Not Empty";
                    label8.ForeColor = Color.Red;
                    checkPass = true;
                }
                else
                {
                    label8.Text = "";
                }
                
                string email = textBox4.Text;
                if (CheckEmail(email) == false)
                {
                    label9.Text = "Invalid Email";
                    label9.ForeColor = Color.Red;
                    checkEmail = true;
                }
                if (!checkEmail)
                {
                    label9.Text = "";
                }
                if(!checkID && !checkName && !checkPass && !checkEmail)
                {
                    ac = new Account(id, name, pass, "writer", email);
                    ac.AddWriter();
                    MessageBox.Show("Add successfull");
                   
                    Project.Files.WriteFile("Add Writer "+id+" ");
                    this.Dispose();
                }
               
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
           
        }

        private void button2_Click(object sender, EventArgs e)
        {

            try
            {
              bool checkName = false, checkPass = false, checkEmail = false;
                
                string name = textBox2.Text;
                if (name == String.Empty)
                {
                    label7.Text = "Not Empty";
                    label7.ForeColor = Color.Red;
                    checkName = true;
                }
                else
                {
                    label7.Text = "";
                }
                string pass = textBox3.Text;
                if (pass == String.Empty)
                {
                    label8.Text = "Not Empty";
                    label8.ForeColor = Color.Red;
                    checkPass = true;
                }
                else
                {
                    label8.Text = "";
                }

                string email = textBox4.Text;
                if (CheckEmail(email) == false)
                {
                    label9.Text = "Invalid Email";
                    label9.ForeColor = Color.Red;
                    checkEmail = true;
                }
                if (!checkEmail)
                {
                    label9.Text = "";
                }
                if (!checkName && !checkPass && !checkEmail)
                {
                    ac = new Account(id, name, pass, "writer", email);
                    ac.UpdateWriter();
                    MessageBox.Show("Update successfull");
                    Project.Files.WriteFile("Update Writer "+id+" ");
                    this.Dispose();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

           

        }
        public void visibleUpdate()
        {
            button1.Visible = false;
            button2.Visible = true;
            textBox1.Enabled = false;
            label1.Text = "Update Profile";
            
        }
        private void FormAdd_Load(object sender, EventArgs e)
        {
            if(ac != null) 
            {
                textBox1.Text = id;
                textBox2.Text = ac.Name;
                textBox3.Text = ac.Password;
                textBox4.Text = ac.Email;
            }
            
        }
    }
}
