using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Project
{
    class Files
    {
        public static void WriteFile(string s)
        {
            StreamReader sr = new StreamReader(@"E:\C#\Project\Project\History.txt");
            string text = sr.ReadToEnd();
            sr.Close();
            StreamWriter sw = new StreamWriter(@"E:\C#\Project\Project\History.txt");
            DateTime dt = DateTime.Now;
            string time = dt.ToString();
            
            sw.WriteLine(text+"\n"+s+"at "+time,true);
            sw.Close();
            
        }
        
    }
}
