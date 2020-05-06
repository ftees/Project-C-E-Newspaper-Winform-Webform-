using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Project.Logic
{
    class Topic
    {
        public int ID { get; set; }
        public string TopicName { get; set; }
        public Topic()
        {

        }
        public Topic(int i, string n)
        {
            ID = i;
            TopicName = n;
        }
        public static List<Topic> GetAllTopic()
        {
            List<Topic> EmpList = new List<Topic>();
            Topic t = new Topic(1, "All");
            EmpList.Add(t);
            DataTable dt = DataAccess.NewsDAO.getTopic();
            foreach (DataRow dr in dt.Rows)
            {
                Topic emp = new Topic(
                        Convert.ToInt32(dr["id"]),
                        dr["TopicName"].ToString()
                        
                    );
                EmpList.Add(emp);
            }
            return EmpList;
        }
    }
}
