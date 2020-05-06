using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWeb
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id =Convert.ToInt32(Request.QueryString["PostID"]);
            detail.DataSource = Project.DataAccess.NewsDAO.getPostbyID(id);
            detail.DataBind();
            
            if (Session["userID"] != null)
            {
                Label1.Text = Session["userID"].ToString();
            }
            LoadData(id);
        }
        public void LoadData(int id)
        {

            rptComment.DataSource = Project.DataAccess.NewsDAO.getComment(id);
            rptComment.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                int postID = Convert.ToInt32(Request.QueryString["PostID"]);
                string accID = Session["userID"].ToString();
                string content = TextArea1.InnerText;
                Project.DataAccess.NewsDAO.AddComment(postID, content, accID);
                LoadData(postID);
                TextArea1.InnerText = "";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}