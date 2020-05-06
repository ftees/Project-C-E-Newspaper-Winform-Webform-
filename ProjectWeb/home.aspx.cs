using Project.Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWeb
{
    public partial class home : System.Web.UI.Page
    {
        News news;
        protected void Page_Load(object sender, EventArgs e)
        {
            news = Project.Logic.NewsList.getTop1();
            top1.DataSource = Project.DataAccess.NewsDAO.getTop1Post();
            top1.DataBind();
            rptEsport.DataSource = Project.DataAccess.NewsDAO.getTop3Post(1);
            rptEsport.DataBind();
            rptTrick.DataSource = Project.DataAccess.NewsDAO.getTop3Post(3);
            rptTrick.DataBind();
            rptGame.DataSource = Project.DataAccess.NewsDAO.getTop3Post(2);
            rptGame.DataBind();
            rptArea.DataSource = Project.DataAccess.AreaDAO.getArea();
            rptArea.DataBind();
            
           
        }

       
        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
           
            
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int PostID = Convert.ToInt32(e.CommandName);
            Response.Redirect("Details.aspx?PostID=" + PostID);

        }
        
        protected void areaBtn_Command(object sender, CommandEventArgs e)
        {
            
            string AreaID = e.CommandName;
            Response.Redirect("League.aspx?AreaID=" + AreaID);
        }
    }
}