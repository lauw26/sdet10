﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using WebAppExmaple.Data;

namespace WebAppExmaple.Migrations
{
    [DbContext(typeof(BankContext))]
    [Migration("20170928155017_InitialCreate2")]
    partial class InitialCreate2
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.0.0-rtm-26452");

            modelBuilder.Entity("WebAppExmaple.Account", b =>
                {
                    b.Property<int>("ID")
                        .ValueGeneratedOnAdd();

                    b.Property<decimal>("dough");

                    b.HasKey("ID");

                    b.ToTable("Accounts");
                });
#pragma warning restore 612, 618
        }
    }
}
