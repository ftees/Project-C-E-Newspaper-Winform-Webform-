using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWeb
{
    public partial class League : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["AreaID"];
            rptArea.DataSource = Project.DataAccess.AreaDAO.getAreabyID(id);
            rptArea.DataBind();
            rptBxh.DataSource = Project.DataAccess.AreaDAO.getTeambyArea(id);
            rptBxh.DataBind();
        }
    }
}