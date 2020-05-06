using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["form2"] == null && Session["form1"] == null) //show login hide signup
            {
                form1.Visible = true;
                form2.Visible = false;

            }


            if (Session["form2"] != null && Session["form1"] == null) //show signup hide login
            {
                form1.Visible = false;
                form2.Visible = true;
                Session["form2"] = null;
            }
            if (Session["form1"] != null && Session["form2"] == null)     //show login hide signup
            {
                form1.Visible = true;
                form2.Visible = false;
                Session["form1"] = null;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = TextBoxName.Text.Trim();
            string pass = TextBoxPass.Text.Trim();
            string role = DropDownList1.Text;
            DataTable dt = Project.DataAccess.AccountDAO.Login(id, pass, role);
            if (dt.Rows.Count == 1)
            {
                Session["userID"] = TextBoxName.Text.Trim();
                Session.Timeout = 50;
                Response.Redirect("home.aspx");
            }
            else
            {
                Label1.Text = "Incorrect ID or password";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string id = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();
            string name = TextBox3.Text.Trim();
            string email = TextBox4.Text.Trim();
            Project.Logic.Account account = new Project.Logic.Account(id, name, password, "viewer", email);
            account.AddWriter();
            Session["userID"] = TextBoxName.Text.Trim();
            Session.Timeout = 50;
            Response.Redirect("home.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            form2.Visible = true;
            form1.Visible = false;
        }
    }
}