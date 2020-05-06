using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Project.Logic
{
    class Team
    {
        public string TeamID { get; set; }
        public string Name { get; set; }
        public string imgLink { get; set; }
        public string AreaID { get; set; }

        public Team()
        {
        }

        public Team(string teamID, string name, string imgLink, string areaID)
        {
            TeamID = teamID;
            Name = name;
            this.imgLink = imgLink;
            AreaID = areaID;
        }
        public static List<Team> GetTeams(string id)
        {
            List<Team> EmpList = new List<Team>();
            DataTable dt = DataAccess.AreaDAO.getTeambyArea(id);
            foreach (DataRow dr in dt.Rows)
            {
                Team emp = new Team(
                        dr["TeamID"].ToString(),
                        dr["Name"].ToString(),
                        dr["imgLink"].ToString(),
                        dr["AreaID"].ToString()
                    );
                EmpList.Add(emp);
            }
            return EmpList;
        }
    }
}
