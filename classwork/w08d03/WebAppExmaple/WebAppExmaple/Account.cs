using System;
using WebAppExmaple.Interfaces;
using System.Collections.Generic;

namespace WebAppExmaple
{
    public class Account : IAccount
    {
        public int ID { get; set; }
        public decimal dough{ get; set; }
        decimal overdraft;
        List<String> transactions;

        public Account()
        {
            this.overdraft = 100;
            transactions = new List<string>();
        }

        public void DepositeDough(decimal Dough)
        {
            if(this.overdraft < 100){
                decimal overdraft_pay = 100 - this.overdraft;
                if(overdraft_pay > Dough){
                    this.overdraft += Dough;
					Dough = 0;
                }
                else{
                    this.overdraft += overdraft_pay;
                    Dough -= overdraft_pay;
                }
            }
            this.dough += Dough;
        }

        public decimal GetDough()
        {
            return this.dough;
        }

        public void WithdrawDough(decimal Dough)
        {
            if(Dough > this.dough){
                decimal overdraft_amount = Dough - this.dough;
                this.dough = 0;
                this.overdraft -= overdraft_amount;
            }
            else{
                this.dough -= Dough;
            }
        }

        public Boolean limit(decimal amount)
        {
            if(amount > (this.overdraft + this.dough)){
                return true;
            }
            else{
                return false;
            }
        }
        public decimal GetOverdraft()
        {
            return overdraft;
        }

        public void AddTransaction(string transaction)
        {
            this.transactions.Add(transaction);
        }

        public List<string> GetTransactions()
        {
            return this.transactions;  
        }
    }
}
