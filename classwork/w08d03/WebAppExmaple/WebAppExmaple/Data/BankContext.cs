using System;
using Microsoft.EntityFrameworkCore;

namespace WebAppExmaple.Data
{
    public class BankContext : DbContext
    {
        public DbSet<Account> Accounts { get; set; }

        public BankContext(DbContextOptions<BankContext> options): base(options)
        {
            
        }
    }
}
