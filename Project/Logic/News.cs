using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Project.Logic
{
    public class News
    {
        public int PostID { get; set; }
        public string Tittle { get; set; }
        public string ShortDesc { get; set; }
        public string LongDesc { get; set; }
        public string imgLink { get; set; }
        public string date { get; set; }
        public int Topic { get; set; }
        public string TopicName { get; set; }
        public string writer { get; set; }

        public News(int postID, string tittle, string shortDesc, string longDesc, string imgLink, string date, string writer)
        {
            PostID = postID;
            Tittle = tittle;
            ShortDesc = shortDesc;
            LongDesc = longDesc;
            this.imgLink = imgLink;
            this.date = date;
            this.writer = writer;
        }

        public News()
        {

        }
        public News(string t, string s, string l, string i, string d, int top, string w)
        {
            
            Tittle = t;
            ShortDesc = s;
            LongDesc = l;
            imgLink = i;
            date = d;
            Topic = top;
            writer = w;
           
        }
        public News(int id,string t, string s, string l, string i, string d, int top,string topname, string w)
        {
            PostID = id;
            Tittle = t;
            ShortDesc = s;
            LongDesc = l;
            imgLink = i;
            date = d;
            Topic = top;
            TopicName = topname;
            writer = w;

        }
        public int AddNews()
        {
            return DataAccess.NewsDAO.InsertPost(this, writer);
        }
        public int UpdateNews()
        {
            return DataAccess.NewsDAO.Updatepost(this, PostID, writer);
        }
    }
    public class NewsList
    {
        public static List<News> GetAllNews(string writer,DateTime from, DateTime to)
        {
            List<News> EmpList = new List<News>();
            DataTable dt = DataAccess.NewsDAO.getPost(writer,from,to);
            foreach (DataRow dr in dt.Rows)
            {
                News emp = new News(
                        Convert.ToInt32(dr["PostID"]),
                        dr["Title"].ToString(),
                        dr["shortDesc"].ToString(),
                        dr["longDesc"].ToString(),
                        
                        dr["imgLink"].ToString(),
                        dr["Date"].ToString(),
                        Convert.ToInt32(dr["ID"]),
                         dr["TopicName"].ToString(),
                        dr["Writer"].ToString()
                    );
                EmpList.Add(emp);
            }
            return EmpList;
        }
        public static News getTop1()
        {
            News news = null;
            DataTable dt = Project.DataAccess.NewsDAO.getTop1Post();
            foreach (DataRow dr in dt.Rows)
            {
                News emp = new News(
                        Convert.ToInt32(dr["PostID"]),
                        dr["Title"].ToString(),
                        dr["shortDesc"].ToString(),
                        dr["longDesc"].ToString(),
                        dr["imgLink"].ToString(),
                        dr["Date"].ToString(),
                        dr["Writer"].ToString()
                    );

            }
            return news;
        }
    }
}
