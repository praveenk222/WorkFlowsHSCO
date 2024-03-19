using Enviri.SharedLibrary.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;

namespace Enviri.PO.WebUI;

public partial class POContext : DbContext
{
    public POContext()
    {
    }

    public POContext(DbContextOptions<POContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Approval> Approvals { get; set; }

    public virtual DbSet<ApprovalStatus> ApprovalStatuses { get; set; }

    public virtual DbSet<Attachment> Attachments { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    public virtual DbSet<CommunicationsLog> CommunicationsLogs { get; set; }

    public virtual DbSet<DepartmentsView> DepartmentsViews { get; set; }

    public virtual DbSet<ErrorLog> ErrorLogs { get; set; }

    public virtual DbSet<GeneralLedgerView> GeneralLedgerViews { get; set; }

    public virtual DbSet<Item> Items { get; set; }

    public virtual DbSet<PurchaseOrder> PurchaseOrders { get; set; }

    public virtual DbSet<RequestingDepartment> RequestingDepartments { get; set; }

    public virtual DbSet<Status> Statuses { get; set; }

    public virtual DbSet<TblDepartment> TblDepartments { get; set; }

    public virtual DbSet<TblGeneralLedger> TblGeneralLedgers { get; set; }

    public virtual DbSet<TblHritmasterDatum> TblHritmasterData { get; set; }

    public virtual DbSet<TblPaymentTerm> TblPaymentTerms { get; set; }

    public virtual DbSet<TblUserGroupAccess> TblUserGroupAccesses { get; set; }

    public virtual DbSet<TblVendor> TblVendors { get; set; }

    public virtual DbSet<TblWorkFlow> TblWorkFlows { get; set; }

    public virtual DbSet<TblWorkFlowMember> TblWorkFlowMembers { get; set; }

    public virtual DbSet<VendorReason> VendorReasons { get; set; }

    public virtual DbSet<VendorSelection> VendorSelections { get; set; }

    public virtual DbSet<VendorsView> VendorsViews { get; set; }

    public virtual DbSet<WorkFlowMembersView> WorkFlowMembersViews { get; set; }

    public virtual DbSet<WorkFlowsView> WorkFlowsViews { get; set; }
    public virtual DbSet<PostResult> PostResults { get; set; }


    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=SQL9001.site4now.net;Initial Catalog=db_aa693a_po;User ID=db_aa693a_po_admin;Password=Narendra@123;Trusted_Connection=false;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Approval>(entity =>
        {
            entity.Property(e => e.ApprovalId)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ApprovalName).HasMaxLength(255);
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Sequence).HasColumnType("decimal(5, 3)");

            entity.HasOne(d => d.ApprovalStatus).WithMany(p => p.Approvals)
                .HasForeignKey(d => d.ApprovalStatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Approvals_ApprovalStatus");

            entity.HasOne(d => d.Comment).WithMany(p => p.Approvals)
                .HasForeignKey(d => d.CommentId)
                .HasConstraintName("FK_Approvals_Comments");

            entity.HasOne(d => d.PurchaseOrder).WithMany(p => p.Approvals)
                .HasForeignKey(d => d.PurchaseOrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Approvals_PurchaseOrder");
        });

        modelBuilder.Entity<ApprovalStatus>(entity =>
        {
            entity.ToTable("ApprovalStatus");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<Attachment>(entity =>
        {
            entity.Property(e => e.AttachDocument).HasColumnType("image");
            entity.Property(e => e.CreatedBy).HasMaxLength(50);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.FileName).HasMaxLength(255);
            entity.Property(e => e.FileType)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedBy).HasMaxLength(50);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");

            entity.HasOne(d => d.PurchaseOrder).WithMany(p => p.Attachments)
                .HasForeignKey(d => d.PurchaseOrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Attachments_PurchaseOrder");
        });

        modelBuilder.Entity<Comment>(entity =>
        {
            entity.Property(e => e.Comment1)
                .HasColumnType("ntext")
                .HasColumnName("Comment");
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<CommunicationsLog>(entity =>
        {
            entity.ToTable("CommunicationsLog");

            entity.Property(e => e.Body).HasColumnType("ntext");
            entity.Property(e => e.CreatedBy).HasMaxLength(50);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.DateSent).HasColumnType("datetime");
            entity.Property(e => e.Recipients).HasMaxLength(500);
            entity.Property(e => e.Subject).HasMaxLength(200);

            entity.HasOne(d => d.PurchaseOrder).WithMany(p => p.CommunicationsLogs)
                .HasForeignKey(d => d.PurchaseOrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CommunicationsLog_PurchaseOrder");
        });

        modelBuilder.Entity<DepartmentsView>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("DepartmentsView");

            entity.Property(e => e.Code).HasMaxLength(50);
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<ErrorLog>(entity =>
        {
            entity.ToTable("ErrorLog");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.ErrorSource)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.InnerException)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Message)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.StackTrace)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.TargetSite)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<GeneralLedgerView>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("GeneralLedgerView");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Number)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Item>(entity =>
        {
            entity.HasIndex(e => e.PurchaseOrderId, "IX_Items_PO");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Glcode)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("GLCode");
            entity.Property(e => e.GldescriptionId).HasColumnName("GLDescriptionId");
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Quantity).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.UnitPrice).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.PurchaseOrder).WithMany(p => p.Items)
                .HasForeignKey(d => d.PurchaseOrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Items_PurchaseOrder");
        });

        modelBuilder.Entity<PurchaseOrder>(entity =>
        {
            entity.ToTable("PurchaseOrder");

            entity.Property(e => e.Afinumber)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("AFINumber");
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.DeliveryDate).HasColumnType("datetime");
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.RequestedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VendorEmail)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.VendorFax)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.VendorNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VendorPhone)
                .HasMaxLength(25)
                .IsUnicode(false);

            entity.HasOne(d => d.Remarks).WithMany(p => p.PurchaseOrderRemarks)
                .HasForeignKey(d => d.RemarksId)
                .HasConstraintName("FK_PurchaseOrder_Comments");

            entity.HasOne(d => d.RequestingDepartment).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.RequestingDepartmentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PurchaseOrder_RequestingDepartments");

            entity.HasOne(d => d.Status).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.StatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PurchaseOrder_Status");

            entity.HasOne(d => d.VendorReason).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.VendorReasonId)
                .HasConstraintName("FK_PurchaseOrder_VendorReason");

            entity.HasOne(d => d.VendorRemarks).WithMany(p => p.PurchaseOrderVendorRemarks)
                .HasForeignKey(d => d.VendorRemarksId)
                .HasConstraintName("FK_PurchaseOrder_VendRemarks");

            entity.HasOne(d => d.VendorSelection).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.VendorSelectionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PurchaseOrder_VendorSelection");
        });

        modelBuilder.Entity<RequestingDepartment>(entity =>
        {
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<Status>(entity =>
        {
            entity.ToTable("Status");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<TblDepartment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Departments");

            entity.ToTable("tbl_Departments");

            entity.Property(e => e.AdaccessName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ADAccessName");
            entity.Property(e => e.Code).HasMaxLength(50);
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<TblGeneralLedger>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_GeneralLedger");

            entity.ToTable("tbl_GeneralLedger");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Department)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasDefaultValue("All");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Number)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.StartWith)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("US600-1001-");
        });

        modelBuilder.Entity<TblHritmasterDatum>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("tbl_HRITMasterData");

            entity.Property(e => e.AdUsername)
                .HasMaxLength(50)
                .HasColumnName("AD_USERNAME");
            entity.Property(e => e.AssignmentCategory)
                .HasMaxLength(100)
                .HasColumnName("ASSIGNMENT_CATEGORY");
            entity.Property(e => e.AssignmentStatus)
                .HasMaxLength(100)
                .HasColumnName("ASSIGNMENT_STATUS");
            entity.Property(e => e.CountryCode)
                .HasMaxLength(100)
                .HasColumnName("COUNTRY_CODE");
            entity.Property(e => e.CountryName)
                .HasMaxLength(100)
                .HasColumnName("COUNTRY_NAME");
            entity.Property(e => e.DirectIndirect)
                .HasMaxLength(100)
                .HasColumnName("DIRECT_INDIRECT");
            entity.Property(e => e.DivisionCode)
                .HasMaxLength(100)
                .HasColumnName("DIVISION_CODE");
            entity.Property(e => e.DivisionName)
                .HasMaxLength(200)
                .HasColumnName("DIVISION_NAME");
            entity.Property(e => e.EmailAddress)
                .HasMaxLength(200)
                .HasColumnName("EMAIL_ADDRESS");
            entity.Property(e => e.EmployeeNumber)
                .HasMaxLength(50)
                .HasColumnName("EMPLOYEE_NUMBER");
            entity.Property(e => e.FirstName)
                .HasMaxLength(100)
                .HasColumnName("FIRST_NAME");
            entity.Property(e => e.JobFamily)
                .HasMaxLength(100)
                .HasColumnName("JOB_FAMILY");
            entity.Property(e => e.JobTitleDaily)
                .HasMaxLength(100)
                .HasColumnName("JOB_TITLE_DAILY");
            entity.Property(e => e.LastName)
                .HasMaxLength(100)
                .HasColumnName("LAST_NAME");
            entity.Property(e => e.LocationCode)
                .HasMaxLength(100)
                .HasColumnName("LOCATION_CODE");
            entity.Property(e => e.LocationName)
                .HasMaxLength(200)
                .HasColumnName("LOCATION_NAME");
            entity.Property(e => e.OrganizationName)
                .HasMaxLength(200)
                .HasColumnName("ORGANIZATION_NAME");
            entity.Property(e => e.SalaryBasis)
                .HasMaxLength(30)
                .HasColumnName("SALARY_BASIS");
            entity.Property(e => e.Sno).ValueGeneratedOnAdd();
            entity.Property(e => e.StartDate)
                .HasColumnType("datetime")
                .HasColumnName("START_DATE");
            entity.Property(e => e.SupervisorName)
                .HasMaxLength(200)
                .HasColumnName("SUPERVISOR_NAME");
            entity.Property(e => e.SupervisorNumber)
                .HasMaxLength(100)
                .HasColumnName("SUPERVISOR_NUMBER");
            entity.Property(e => e.Terminationdate)
                .HasColumnType("datetime")
                .HasColumnName("TERMINATIONDATE");
            entity.Property(e => e.UpdatedBy).HasMaxLength(100);
            entity.Property(e => e.UpdatedDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TblPaymentTerm>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_PaymentTerms");

            entity.ToTable("tbl_PaymentTerms");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(50);
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<TblUserGroupAccess>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tbl_User__3214EC27D7FF6D1D");

            entity.ToTable("tbl_UserGroupAccess");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ApproverUsers).HasDefaultValue(false);
            entity.Property(e => e.CorporateUsers).HasDefaultValue(false);
            entity.Property(e => e.InitiatorUsers).HasDefaultValue(false);
            entity.Property(e => e.IsActive).HasDefaultValue(true);
            entity.Property(e => e.LoginId)
                .HasMaxLength(100)
                .HasColumnName("LoginID");
            entity.Property(e => e.UpdatedBy).HasMaxLength(150);
            entity.Property(e => e.UpdatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TblVendor>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Vendors");

            entity.ToTable("tbl_Vendors");

            entity.Property(e => e.Address1).HasMaxLength(50);
            entity.Property(e => e.Address2).HasMaxLength(50);
            entity.Property(e => e.Address3).HasMaxLength(50);
            entity.Property(e => e.Address4).HasMaxLength(50);
            entity.Property(e => e.City)
                .HasMaxLength(50)
                .HasColumnName("city");
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Name).HasMaxLength(255);
            entity.Property(e => e.Number).HasMaxLength(50);
            entity.Property(e => e.State).HasMaxLength(50);
            entity.Property(e => e.Zip).HasMaxLength(50);
        });

        modelBuilder.Entity<TblWorkFlow>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_WorkFlows");

            entity.ToTable("tbl_WorkFlows");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.GoesTo)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasDefaultValue("AP")
                .IsFixedLength();
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.WorkFlowName)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TblWorkFlowMember>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_WorkFlowMembers");

            entity.ToTable("tbl_WorkFlowMembers");

            entity.Property(e => e.Adname)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ADName");
            entity.Property(e => e.ApprovalAmount).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.ApproverSequence).HasColumnType("decimal(5, 3)");
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.DisplayName).HasMaxLength(255);
            entity.Property(e => e.Email).HasMaxLength(255);
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<VendorReason>(entity =>
        {
            entity.ToTable("VendorReason");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<VendorSelection>(entity =>
        {
            entity.ToTable("VendorSelection");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<VendorsView>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("VendorsView");

            entity.Property(e => e.Address1).HasMaxLength(50);
            entity.Property(e => e.Address2).HasMaxLength(50);
            entity.Property(e => e.Address3).HasMaxLength(50);
            entity.Property(e => e.Address4).HasMaxLength(50);
            entity.Property(e => e.City).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(255);
            entity.Property(e => e.Number).HasMaxLength(50);
            entity.Property(e => e.PaymentType).HasMaxLength(50);
            entity.Property(e => e.State).HasMaxLength(50);
            entity.Property(e => e.Zip).HasMaxLength(50);
        });

        modelBuilder.Entity<WorkFlowMembersView>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("WorkFlowMembersView");

            entity.Property(e => e.Adname)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ADName");
            entity.Property(e => e.ApprovalAmount).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.ApproverSequence).HasColumnType("decimal(5, 3)");
            entity.Property(e => e.DisplayName).HasMaxLength(255);
            entity.Property(e => e.Email).HasMaxLength(255);
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
        });

        modelBuilder.Entity<WorkFlowsView>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("WorkFlowsView");

            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.WorkFlowName)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
