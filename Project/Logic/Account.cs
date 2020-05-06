using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Project.Logic
{
    public class Account
    {
        public string UserID { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public string Email { get; set; }
        public Account()
        {

        }
        public Account(string u, string p, string r)
        {
            UserID = u;
            Password = p;
            Role = r;

        }
        
        public Account(string u,string n, string p, string r,string e)
        {
            UserID = u;
            Name = n;
            Password = p;
            Role = r;
            Email = e;
        }
        public Account(string n, string p, string r, string e)
        {
           
            Name = n;
            Password = p;
            Role = r;
            Email = e;
        }
        public int AddWriter()
        {
            return DataAccess.AccountDAO.AddAccount(this,Role);
        }
        public int UpdateWriter()
        {
            return DataAccess.AccountDAO.UpdateAcc(this,UserID);
        }

    }
    class AccountList
    {
        public static List<Account> GetAllAccount()
        {
            List<Account> AccList = new List<Account>();
            DataTable dt = Project.DataAccess.AccountDAO.GetAllAccount();
 
            foreach (DataRow dr in dt.Rows)
            {
                Account emp = new Account(   //cho nay day Exception
                        (dr["id"]).ToString(),
                        dr["username"].ToString(),
                        dr["password"].ToString(),
                        dr["role"].ToString(),
                        dr["email"].ToString()
                    );
                AccList.Add(emp);
            }
            return AccList;
        }
        public static Account GetAccountbyID(string id)
        {
            Account acc = null;
            DataTable dt = Project.DataAccess.AccountDAO.GetAccountByID(id);

            foreach (DataRow dr in dt.Rows)
            {
                 acc = new Account  //cho nay day Exception
                        (dr["username"].ToString(),
                        dr["password"].ToString(),
                        dr["role"].ToString(),
                        dr["email"].ToString()); 
            }
            return acc;
        }
    }
}
