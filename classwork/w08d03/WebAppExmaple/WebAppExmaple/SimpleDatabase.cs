using System;
using System.Collections.Generic;
using WebAppExmaple.Interfaces;

namespace WebAppExmaple
{
    public class SimpleDatabase : ISimpleDatabase
    {
        public SimpleDatabase()
        {
        }

        public List<string> GetAll()
        {
            List<String> data = new List<string>();

            data.Add("Hello");
            data.Add("Everyone");
            data.Add("It's me Boris");

            return data;
        }
    }
}
