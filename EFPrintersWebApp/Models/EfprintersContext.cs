using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace EFPrintersWebApp.Models;

public partial class EfprintersContext : DbContext
{
    public EfprintersContext()
    {
    }

    public EfprintersContext(DbContextOptions<EfprintersContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Functiontype> Functiontypes { get; set; }

    public virtual DbSet<Manufacturer> Manufacturers { get; set; }

    public virtual DbSet<Material> Materials { get; set; }

    public virtual DbSet<MaterialChange> MaterialChanges { get; set; }

    public virtual DbSet<MaterialCompatibility> MaterialCompatibilities { get; set; }

    public virtual DbSet<Materialtype> Materialtypes { get; set; }

    public virtual DbSet<Office> Offices { get; set; }

    public virtual DbSet<Printer> Printers { get; set; }

    public virtual DbSet<PrinterFile> PrinterFiles { get; set; }

    public virtual DbSet<Printertype> Printertypes { get; set; }

    public virtual DbSet<Status> Statuses { get; set; }

    public virtual DbSet<Stock> Stocks { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=S-KAA-DB\\ENTERPRISE,1433;Initial Catalog=EFPrinters;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("Czech_100_CI_AS");

        modelBuilder.Entity<Functiontype>(entity =>
        {
            entity.ToTable("Functiontype");

            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Manufacturer>(entity =>
        {
            entity.ToTable("Manufacturer");

            entity.Property(e => e.Contact).HasMaxLength(100);
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Material>(entity =>
        {
            entity.ToTable("Material");

            entity.Property(e => e.Color)
                .HasMaxLength(40)
                .IsUnicode(false);
            entity.Property(e => e.Name).HasMaxLength(150);
            entity.Property(e => e.PartNumber)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Price).HasColumnType("money");
            entity.Property(e => e.PriceDph).HasColumnType("money");

            entity.HasOne(d => d.Materialtype).WithMany(p => p.Materials)
                .HasForeignKey(d => d.MaterialtypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Material_MaterialtypeId");
        });

        modelBuilder.Entity<MaterialChange>(entity =>
        {
            entity.ToTable("MaterialChange");

            entity.HasOne(d => d.Material).WithMany(p => p.MaterialChanges)
                .HasForeignKey(d => d.MaterialId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MaterialChange_MaterialId");

            entity.HasOne(d => d.Printer).WithMany(p => p.MaterialChanges)
                .HasForeignKey(d => d.PrinterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MaterialChange_PrinterId");

            entity.HasOne(d => d.User).WithMany(p => p.MaterialChanges)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MaterialChange_UserId");
        });

        modelBuilder.Entity<MaterialCompatibility>(entity =>
        {
            entity.ToTable("MaterialCompatibility");

            entity.HasOne(d => d.Material).WithMany(p => p.MaterialCompatibilities)
                .HasForeignKey(d => d.MaterialId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MaterialCompatibility_MaterialId");

            entity.HasOne(d => d.Printertype).WithMany(p => p.MaterialCompatibilities)
                .HasForeignKey(d => d.PrintertypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MaterialCompatibility_PrintertypeId");
        });

        modelBuilder.Entity<Materialtype>(entity =>
        {
            entity.ToTable("Materialtype");

            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Office>(entity =>
        {
            entity.ToTable("Office");

            entity.Property(e => e.City).HasMaxLength(50);
            entity.Property(e => e.Code).HasMaxLength(10);
            entity.Property(e => e.Municipality).HasMaxLength(50);
            entity.Property(e => e.Street).HasMaxLength(100);
            entity.Property(e => e.ZipCode)
                .HasMaxLength(6)
                .IsUnicode(false)
                .IsFixedLength();
        });

        modelBuilder.Entity<Printer>(entity =>
        {
            entity.ToTable("Printer");

            entity.Property(e => e.InventaryNumber)
                .HasMaxLength(9)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Price).HasColumnType("money");
            entity.Property(e => e.PropertyType).HasMaxLength(10);
            entity.Property(e => e.Room).HasMaxLength(50);
            entity.Property(e => e.SerialNumber).HasMaxLength(50);

            entity.HasOne(d => d.Office).WithMany(p => p.Printers)
                .HasForeignKey(d => d.OfficeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Printer_OfficeId");

            entity.HasOne(d => d.Printertype).WithMany(p => p.Printers)
                .HasForeignKey(d => d.PrintertypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Printer_PrintertypeId");

            entity.HasOne(d => d.Status).WithMany(p => p.Printers)
                .HasForeignKey(d => d.StatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Printer_StatusId");
        });

        modelBuilder.Entity<PrinterFile>(entity =>
        {
            entity.ToTable("PrinterFile");

            entity.Property(e => e.Comment).HasMaxLength(150);
            entity.Property(e => e.FileName).HasMaxLength(100);

            entity.HasOne(d => d.Printer).WithMany(p => p.PrinterFiles)
                .HasForeignKey(d => d.PrinterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PrinterFile_PrinterId");
        });

        modelBuilder.Entity<Printertype>(entity =>
        {
            entity.ToTable("Printertype");

            entity.Property(e => e.IsA3capable).HasColumnName("IsA3Capable");
            entity.Property(e => e.Model)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Functiontype).WithMany(p => p.Printertypes)
                .HasForeignKey(d => d.FunctiontypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Printertype_FunctiontypeId");

            entity.HasOne(d => d.Manufacturer).WithMany(p => p.Printertypes)
                .HasForeignKey(d => d.ManufacturerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Printertype_ManufacturerId");
        });

        modelBuilder.Entity<Status>(entity =>
        {
            entity.ToTable("Status");

            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Stock>(entity =>
        {
            entity.ToTable("Stock");

            entity.HasOne(d => d.Material).WithMany(p => p.Stocks)
                .HasForeignKey(d => d.MaterialId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stock_MaterialId");

            entity.HasOne(d => d.Office).WithMany(p => p.Stocks)
                .HasForeignKey(d => d.OfficeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stock_OfficeId");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(100);
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Office).WithMany(p => p.Users)
                .HasForeignKey(d => d.OfficeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_User_OfficeId");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
