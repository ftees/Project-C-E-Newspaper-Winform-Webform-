using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWeb
{
    public partial class SearchPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData(1);
            }

        }
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] == null) { return 1; }
                return (Int32)ViewState["PageNumber"];
            }
            set => ViewState["PageNumber"] = value;
        }
        void LoadData(int index)
        {
            
            string s = Request.QueryString["title"];
            PageNumber = index;
            int countRow = Convert.ToInt32(Project.DataAccess.NewsDAO.getAllCountRow(s).Rows[0][0]);
            int pageSize = 5;
            int maxPage = countRow / pageSize;

            if (countRow % pageSize != 0)
            {
                maxPage++;
            }

            if (PageNumber > maxPage) { PageNumber = 1; }
            if (PageNumber < 1) { PageNumber = maxPage; }

            string[] paging = new string[maxPage];

            for (int i = 0; i < maxPage; i++)
            {
                paging[i] = (i + 1) + "";
            }
            repeater2.DataSource = paging;
            repeater2.DataBind();

            repeater1.DataSource = Project.DataAccess.NewsDAO.getPostbySearchPaging(s, index, pageSize);
            repeater1.DataBind();
            Label1.Text = PageNumber + "";


        }

        protected void btnPage_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                PageNumber = Convert.ToInt32(e.CommandName);
                LoadData(PageNumber);
            }
            catch (Exception ex)
            {
            }
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int PostID = Convert.ToInt32(e.CommandName);
            Response.Redirect("Details.aspx?PostID=" + PostID);
        }

        
    }
}