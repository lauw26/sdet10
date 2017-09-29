using System;
namespace WebAppExmaple.Interfaces
{
    public interface IOverdraft
    {
        void OverDraftCalc(Account account, decimal amount);
    }
}
