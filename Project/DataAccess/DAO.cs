using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Project.Logic;

namespace Project.DataAccess
{
    
    public class DAO
    {
        public static SqlConnection GetConnection()
        {
            //doc thong tin tu file config.
            string ConnectString = @"server=FTEES;database=DBLOL;user=phamtien; password=1";
            SqlConnection Connection = new SqlConnection(ConnectString);
            return Connection;
        }

        public static DataTable GetDataBySQL(string sql)
        {
            SqlCommand Command = new SqlCommand(sql, GetConnection());
            DataTable dt = new DataTable();
            Command.Connection.Open();

            SqlDataReader Reader = Command.ExecuteReader();

            dt.Load(Reader);
            Command.Connection.Close();
            return dt;
        }

        public static DataTable GetDataBySQLWithParameters(string sql, params SqlParameter[] parameters)
        {
            SqlCommand Command = new SqlCommand(sql, GetConnection());
            DataTable dt = new DataTable();
            Command.Parameters.AddRange(parameters);
            Command.Connection.Open();

            SqlDataReader Reader = Command.ExecuteReader();

            dt.Load(Reader);
            Command.Connection.Close();
            return dt;
        }

        public static int ExecuteSQL(string sql)
        {
            SqlCommand Command = new SqlCommand(sql, GetConnection());
            Command.Connection.Open();
            int k = Command.ExecuteNonQuery();
            Command.Connection.Close();
            return k;
        }

        public static int ExecuteSQLWithParameters(string sql, params SqlParameter[] parameters)
        {
            SqlCommand Command = new SqlCommand(sql, GetConnection());
            Command.Connection.Open();
            Command.Parameters.AddRange(parameters);
            int k = Command.ExecuteNonQuery();
            Command.Connection.Close();
            return k;
        }
    }
    
    public class AccountDAO
    {
        public static int AddAccount(Account a,string role)
        {
            string sql = @"INSERT INTO [dbo].[Account]
                       ([id]
                       ,[username]
                       ,[password]
                       ,[email]
                       ,[role])
                 VALUES
                       (@id,
                       @username,
                       @password,
                       @email,
                       @role)";
            SqlParameter param1 = new SqlParameter("@id", SqlDbType.NVarChar);
            param1.Value = a.UserID;
            SqlParameter param2 = new SqlParameter("@username", SqlDbType.NVarChar);
            param2.Value = a.Name;
            SqlParameter param3 = new SqlParameter("@password", SqlDbType.NVarChar);
            param3.Value = a.Password;
            SqlParameter param4 = new SqlParameter("@email", SqlDbType.NVarChar);
            param4.Value = a.Email;
            SqlParameter param5 = new SqlParameter("@role", SqlDbType.NChar);
            param5.Value = role;
            return DAO.ExecuteSQLWithParameters(sql,param1,param2,param3,param4,param5);


        }
        public static int UpdateAcc(Account a, string id)
        {
            string sql = @"Update dbo.Account set username = @username, password=@password,email=@email,role=@role where id =@uid ";
            SqlParameter param1 = new SqlParameter("@uid", SqlDbType.NVarChar);
            param1.Value = id;
            SqlParameter param2 = new SqlParameter("@username", SqlDbType.NVarChar);
            param2.Value = a.Name;
            SqlParameter param3 = new SqlParameter("@password", SqlDbType.NVarChar);
            param3.Value = a.Password;
            SqlParameter param4 = new SqlParameter("@email", SqlDbType.NVarChar);
            param4.Value = a.Email;
            SqlParameter param5 = new SqlParameter("@role", SqlDbType.NChar);
            param5.Value = a.Role;
            return DAO.ExecuteSQLWithParameters(sql,param1, param2, param3, param4, param5);

        }
        public static DataTable GetAccountByID(string s)
        {
            string sql = @"select username, password,email, role from Account where id = @id";
            SqlParameter param1 = new SqlParameter("@id", SqlDbType.NVarChar);
            param1.Value = s;
            return DAO.GetDataBySQLWithParameters(sql, param1);
        }
        public static int DeleteAcc(string id)
        {
            string sql = @"DELETE FROM [dbo].[Account]
                                WHERE id =@id";
            SqlParameter param1 = new SqlParameter("@id", SqlDbType.NVarChar);
            param1.Value = id;
            return DAO.ExecuteSQLWithParameters(sql,param1);
        }
        public static DataTable GetAllAccount()
        {
            string sql = @"select id,username, password,email, role from Account";
            return DAO.GetDataBySQL(sql);
        }
        public static DataTable GetAccountByRole(string s)
        {
            string sql = @"select id,username, password,email, role from Account where role = @role";
            SqlParameter param1 = new SqlParameter("@role", SqlDbType.NChar);
            param1.Value = s;
            return DAO.GetDataBySQLWithParameters(sql,param1);
        }
        public static DataTable Login(string id, string password, string role) 
        {
            string sql = @"select * from Account where id = @id and password =@password and role = @role";
            SqlParameter param1 = new SqlParameter("@id", SqlDbType.NVarChar);
            param1.Value = id;
            SqlParameter param2 = new SqlParameter("@password", SqlDbType.NVarChar);
            param2.Value = password;
            SqlParameter param3 = new SqlParameter("@role", SqlDbType.NChar);
            param3.Value = role;
            return DAO.GetDataBySQLWithParameters(sql,param1, param2, param3);
        }
    }
    public class NewsDAO
    {
        public static DataTable getPost(string s,DateTime from, DateTime to)
        {
            string sql = @"select postID, title, shortDesc,longDesc,imgLink,date,Topic.ID ,Topic.TopicName,writer from Post,Account,Topic 
where Post.writer = Account.id and Post.TopicID = Topic.ID and writer = @name and date between @from and @to";
            SqlParameter param1 = new SqlParameter("@name", SqlDbType.NChar);
            param1.Value = s;
            SqlParameter param2 = new SqlParameter("@from", SqlDbType.Date);
            param2.Value = from;
            SqlParameter param3 = new SqlParameter("@to", SqlDbType.Date);
            param3.Value = to;
            return DAO.GetDataBySQLWithParameters(sql, param1,param2,param3);
        }
        public static DataTable getTopic()
        {
            string sql = @"select * from Topic";
            return DAO.GetDataBySQL(sql);
        }
        public static int InsertTopic(string topic)
        {
            string sql = @"INSERT INTO [dbo].[Topic](TopicName) VALUES(@topic)";
            SqlParameter param1 = new SqlParameter("@topic", SqlDbType.NVarChar);
            param1.Value = topic;
            return DAO.ExecuteSQLWithParameters(sql,param1);
        }
        public static DataTable getAllPost()
        {
            string sql = @"select * from Post";
            return DAO.GetDataBySQL(sql);
        }
        public static int InsertPost(News ne, string writer)
        {
            string sql = @"INSERT INTO [dbo].[Post]
                   ([title]
                   ,[shortDesc]
                   ,[longDesc]
                   ,[imgLink]
                   ,[date]
                   ,[TopicID]
                   ,[writer])
             VALUES
                   (@tittle
                   ,@shortDesc
                   ,@longDesc
                   ,@imgLink
                   ,@date
                   ,@topic
                   ,@writer)";
            SqlParameter param1 = new SqlParameter("@tittle", SqlDbType.NVarChar);
            param1.Value = ne.Tittle;
            SqlParameter param2 = new SqlParameter("@shortDesc", SqlDbType.NVarChar);
            param2.Value = ne.ShortDesc;
            SqlParameter param3 = new SqlParameter("@longDesc", SqlDbType.NVarChar);
            param3.Value = ne.LongDesc;
            SqlParameter param4 = new SqlParameter("@imgLink", SqlDbType.NVarChar);
            param4.Value = ne.imgLink;
            SqlParameter param5 = new SqlParameter("@date", SqlDbType.NVarChar);
            param5.Value = ne.date;
            SqlParameter param6 = new SqlParameter("@topic", SqlDbType.Int);
            param6.Value = ne.Topic;
            SqlParameter param7 = new SqlParameter("@writer", SqlDbType.NVarChar);
            param7.Value = writer;
            return DAO.ExecuteSQLWithParameters(sql, param1, param2, param3, param4, param5,param6,param7);
        }
        public static int DeletePost(int id)
        {
            string sql = @"DELETE FROM [dbo].[Post]
                                WHERE postID =@id";
            SqlParameter param1 = new SqlParameter("@id", SqlDbType.Int);
            param1.Value = id;
            return DAO.ExecuteSQLWithParameters(sql, param1);
        }
        public static DataTable getPostbyID(int s)
        {
            string sql = @"select postID, title, shortDesc,longDesc,imgLink,date, Topic.TopicName,writer from Post,Account,Topic 
where Post.writer = Account.id and Post.TopicID = Topic.ID and postID = @id";
            SqlParameter param1 = new SqlParameter("@id", SqlDbType.Int);
            param1.Value = s;
            return DAO.GetDataBySQLWithParameters(sql, param1);
        }
        public static int Updatepost(News ne,int id,string writer)
        {
            string sql = @"UPDATE [dbo].[Post] SET [title] = @tittle, [shortDesc] = @shortDesc, [longDesc] = @longDesc, [imgLink]=@imgLink, [date]=@date, [TopicID]=@topic, [writer]= @writer where PostID =" + id;
            
            SqlParameter param1 = new SqlParameter("@tittle", SqlDbType.NVarChar);
            param1.Value = ne.Tittle;
            SqlParameter param2 = new SqlParameter("@shortDesc", SqlDbType.NVarChar);
            param2.Value = ne.ShortDesc;
            SqlParameter param3 = new SqlParameter("@longDesc", SqlDbType.NVarChar);
            param3.Value = ne.LongDesc;
            SqlParameter param4 = new SqlParameter("@imgLink", SqlDbType.NVarChar);
            param4.Value = ne.imgLink;
            SqlParameter param5 = new SqlParameter("@date", SqlDbType.Date);
            param5.Value = ne.date;
            SqlParameter param6 = new SqlParameter("@topic", SqlDbType.Int);
            param6.Value = ne.Topic;
            SqlParameter param7 = new SqlParameter("@writer", SqlDbType.NVarChar);
            param7.Value = writer;
            return DAO.ExecuteSQLWithParameters(sql, param1, param2, param3, param4, param5, param6, param7);
        }
        public static DataTable getTop1Post()
        {
            string sql = @" select top 1 * from Post order by date desc";
            return DAO.GetDataBySQL(sql);
        }
        public static DataTable getTopic(string s)
        {
            string sql = @"Select * from Topic";
            return DAO.GetDataBySQL(sql);
        }
        public static DataTable getPostbyTopic(int s)
        {
            string sql = @"select postID, title, shortDesc,longDesc,imgLink,date, Topic.TopicName,writer from Post,Account,Topic 
where Post.writer = Account.id and Post.TopicID = Topic.ID and topicID=@topic";
            SqlParameter param1 = new SqlParameter("@topic", SqlDbType.Int);
            param1.Value = s;
            return DAO.GetDataBySQLWithParameters(sql, param1);
        }
        public static DataTable getTop3Post(int topic)
        {
            string sql = @"SELECT TOP 3 * from Post where TopicID= @topic order by date desc";
            SqlParameter param1 = new SqlParameter("@topic", SqlDbType.Int);
            param1.Value = topic;
            return DAO.GetDataBySQLWithParameters(sql, param1);
        }
        public static DataTable getPostbyTopicPaging(int s,int index,int pageSize)
        {
            string sql = @"select * from (select ROW_NUMBER() over(order by postID desc) as rn,
                postID, title, shortDesc,longDesc,imgLink,date, Topic.TopicName,writer from Post,Account,Topic 
                where Post.writer = Account.id and Post.TopicID = Topic.ID and topicID= @topic)as x where rn between 
                @pageIndex*@pageSize-(@pageSize-1) and @pageIndex*@pageSize";
            SqlParameter param1 = new SqlParameter("@topic", SqlDbType.Int);
            param1.Value = s;
            SqlParameter param2 = new SqlParameter("@pageIndex", SqlDbType.Int);
            param2.Value = index;
            SqlParameter param3 = new SqlParameter("@pageSize", SqlDbType.Int);
            param3.Value = pageSize;
            return DAO.GetDataBySQLWithParameters(sql, param1,param2,param3);
        }
        public static DataTable getCountRow(int topic)
        {
            string query = "Select count(postID) from Post where topicID = @topic";
            SqlParameter param1 = new SqlParameter("@topic", SqlDbType.Int);
            param1.Value = topic;
            return DAO.GetDataBySQLWithParameters(query, param1);
        }
        public static DataTable getAllCountRow(string s)
        {
            string query = "Select count(postID) from Post where title like  '%' + @title + '%' ";
            SqlParameter param1 = new SqlParameter("@title", SqlDbType.NVarChar);
            param1.Value = s;
            return DAO.GetDataBySQLWithParameters(query, param1);

        }
        public static DataTable getPostbySearchPaging(string s, int index, int pageSize)
        {
            string sql = @"select * from (select ROW_NUMBER() over(order by postID desc) as rn,
                postID, title, shortDesc,longDesc,imgLink,date, Topic.TopicName,writer from Post,Account,Topic 
                where Post.writer = Account.id and Post.TopicID = Topic.ID and title like  '%' + @title + '%')as x where rn between 
                @pageIndex*@pageSize-(@pageSize-1) and @pageIndex*@pageSize";
            SqlParameter param1 = new SqlParameter("@title", SqlDbType.NVarChar);
            param1.Value = s;
            SqlParameter param2 = new SqlParameter("@pageIndex", SqlDbType.Int);
            param2.Value = index;
            SqlParameter param3 = new SqlParameter("@pageSize", SqlDbType.Int);
            param3.Value = pageSize;
            return DAO.GetDataBySQLWithParameters(sql, param1, param2, param3);
        }
        public static DataTable getComment(int postID)
        {
            string query = "Select * from Comment where postID = @postID";
            SqlParameter param1 = new SqlParameter("@postID", SqlDbType.Int);
            param1.Value = postID;
            return DAO.GetDataBySQLWithParameters(query, param1);
        }
        public static int DeleteCmt(int id)
        {
            string sql = @"DELETE FROM [dbo].[Comment]
                                WHERE commentID =@id";
            SqlParameter param1 = new SqlParameter("@id", SqlDbType.Int);
            param1.Value = id;
            return DAO.ExecuteSQLWithParameters(sql, param1);
        }
        public static int AddComment(int postID,string content,string accID)
        {
            string sql = @"INSERT INTO [dbo].[comment]
                       ([postID]
                       ,[content]
                       ,[account ID])
                 VALUES
                       (@postID
                       ,@content
                       ,@accID)";
            SqlParameter param1 = new SqlParameter("@postID", SqlDbType.Int);
            param1.Value = postID;
            SqlParameter param2 = new SqlParameter("@content", SqlDbType.NVarChar);
            param2.Value = content;
            SqlParameter param3 = new SqlParameter("@accID", SqlDbType.NVarChar);
            param3.Value = accID;
            return DAO.ExecuteSQLWithParameters(sql, param1, param2, param3);


        }
    }
   public class AreaDAO
    {
        public static DataTable getArea()
        {
            string sql = @"Select * from Area";
            return DAO.GetDataBySQL(sql);
        }
        public static DataTable getAreabyID(string id)
        {
            string sql = @"Select * from Area where id = @id";
            SqlParameter param1 = new SqlParameter("@id", SqlDbType.NVarChar);
            param1.Value = id;
            return DAO.GetDataBySQLWithParameters(sql,param1);
        }
        
        public static DataTable getTeambyArea(string id)
        {
            string sql = @"Select * from Team where AreaID = @id order by score desc";
            SqlParameter param1 = new SqlParameter("@id", SqlDbType.NVarChar);
            param1.Value = id;
            return DAO.GetDataBySQLWithParameters(sql,param1);
        }
       
    }
   

    


   
}

