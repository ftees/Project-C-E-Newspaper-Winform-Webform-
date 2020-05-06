using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWeb
{
    public partial class Frame : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                user.Text = Session["userID"].ToString();
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = TextBox1.Text;
            Response.Redirect("SearchPage.aspx?title="+s);
            
        }
    }
}