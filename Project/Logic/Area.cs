using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Project.Logic
{
   public class Area
    {
        public string ID { get; set; }
        public string Name { get; set; }

        public Area()
        {
        }

        public Area(string iD, string name)
        {
            ID = iD;
            Name = name;
        }
        public static List<Area> GetAreas()
        {
            List<Area> EmpList = new List<Area>();
            DataTable dt = DataAccess.AreaDAO.getArea();
            foreach (DataRow dr in dt.Rows)
            {
                Area emp = new Area(
                        dr["id"].ToString(),
                        dr["name"].ToString()
                    );
                EmpList.Add(emp);
            }
            return EmpList;
        }
    }
}
