using System;
using System.Collections.Generic;
namespace WebAppExmaple.Interfaces
{
    public interface IAccount
    {
        decimal GetDough();
        void WithdrawDough(decimal Dough);
        void DepositeDough(decimal Dough);
        decimal GetOverdraft();
        bool limit(decimal amount);
        void AddTransaction(string transaction);
        List<string> GetTransactions();


    }
}
