using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebAppExmaple.Models;
using WebAppExmaple.Interfaces;
using System.ComponentModel.DataAnnotations;
using WebAppExmaple.Data;

namespace WebAppExmaple.Controllers
{
    public class HomeController : Controller
    {
        BankContext db;

        public HomeController(BankContext context){
            db = context;
        }
        public IActionResult Index([FromServices] IAccount account)
        {
            Account acc1 = new Account();
            db.Accounts.Add(acc1);
            var count = db.SaveChanges();
            Console.WriteLine($"{count} records saved to database");

            ViewData["Balance"] = account.GetDough();
            ViewData["Overdraft"] = account.GetOverdraft();
            ViewData["Transactions"] = account.GetTransactions();

            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

		public IActionResult Balance([FromServices] IAccount account)
		{
			ViewData["Message"] = "Your Balance page.";
            ViewData["Balance"] = account.GetDough();
            ViewData["Overdraft"] = account.GetOverdraft();

			return View();
		}

        public IActionResult ATM([FromServices] IAccount account)
        {
            ViewData["Message"] = "Your edit page";
            return View();
        }

		public IActionResult Result([FromServices] IAccount account)
		{
			ViewData["Message"] = "Your outcome page";

            decimal amount = Convert.ToDecimal(HttpContext.Request.Form["amount"]);
            string action = HttpContext.Request.Form["action"];
            string result = $"Successfully {action}ed {amount} Dough";
            string transaction = $"{DateTime.Now} {action}ed {amount} dough";

			switch (action)
			{
				case "Withdraw":
                    if (account.limit(amount))
                    {
                        result = $"Not enough funds on account to withdraw {amount} dough";
                    }
                    else
                    {
                        account.WithdrawDough(amount);
                        account.AddTransaction(transaction);
                    }
					break;
				case "Deposit":
					account.DepositeDough(amount);
                    account.AddTransaction(transaction);
					break;
				default:
					result = "No selected action please try again";
					break;
			}

            ViewData["result"] = result;


			return View();
		}


		public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
