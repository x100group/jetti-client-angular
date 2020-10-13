RAISERROR('Catalog.Sample start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Sample ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Sample.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."SampleField"')), '') [SampleField]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Sample'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Sample.v] ON [Catalog.Sample.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Sample.v.code.f] ON [Catalog.Sample.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Sample.v.description.f] ON [Catalog.Sample.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Sample.v.description] ON [Catalog.Sample.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Sample.v.code] ON [Catalog.Sample.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Sample.v.user] ON [Catalog.Sample.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Sample.v.company] ON [Catalog.Sample.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Sample.v] TO jetti;
GO

      
------------------------------ END Catalog.Sample ------------------------------

GO
RAISERROR('Catalog.Sample complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.ResponsibilityCenter start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.ResponsibilityCenter ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.ResponsibilityCenter.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."kind"')), '') [kind]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ResponsiblePerson"')) [ResponsiblePerson]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Currency"')) [Currency]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.ResponsibilityCenter'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.ResponsibilityCenter.v] ON [Catalog.ResponsibilityCenter.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ResponsibilityCenter.v.code.f] ON [Catalog.ResponsibilityCenter.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ResponsibilityCenter.v.description.f] ON [Catalog.ResponsibilityCenter.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ResponsibilityCenter.v.description] ON [Catalog.ResponsibilityCenter.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ResponsibilityCenter.v.code] ON [Catalog.ResponsibilityCenter.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ResponsibilityCenter.v.user] ON [Catalog.ResponsibilityCenter.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ResponsibilityCenter.v.company] ON [Catalog.ResponsibilityCenter.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.ResponsibilityCenter.v] TO jetti;
GO

      
------------------------------ END Catalog.ResponsibilityCenter ------------------------------

GO
RAISERROR('Catalog.ResponsibilityCenter complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Dynamic start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Dynamic ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Dynamic.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Dynamic'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Dynamic.v] ON [Catalog.Dynamic.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Dynamic.v.code.f] ON [Catalog.Dynamic.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Dynamic.v.description.f] ON [Catalog.Dynamic.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Dynamic.v.description] ON [Catalog.Dynamic.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Dynamic.v.code] ON [Catalog.Dynamic.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Dynamic.v.user] ON [Catalog.Dynamic.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Dynamic.v.company] ON [Catalog.Dynamic.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Dynamic.v] TO jetti;
GO

      
------------------------------ END Catalog.Dynamic ------------------------------

GO
RAISERROR('Catalog.Dynamic complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Attachment start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Attachment ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Attachment.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."owner"')) [owner]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."AttachmentType"')) [AttachmentType]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Storage"')), '') [Storage]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Tags"')), '') [Tags]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."FileSize"')), 0) [FileSize]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FileName"')), '') [FileName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."MIMEType"')), '') [MIMEType]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Attachment'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Attachment.v] ON [Catalog.Attachment.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.v.code.f] ON [Catalog.Attachment.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.v.description.f] ON [Catalog.Attachment.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.v.description] ON [Catalog.Attachment.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.v.code] ON [Catalog.Attachment.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.v.user] ON [Catalog.Attachment.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.v.company] ON [Catalog.Attachment.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Attachment.v] TO jetti;
GO

      
------------------------------ END Catalog.Attachment ------------------------------

GO
RAISERROR('Catalog.Attachment complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Attachment.Type start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Attachment.Type ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Attachment.Type.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."AllDocuments"')), 0) [AllDocuments]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."AllCatalogs"')), 0) [AllCatalogs]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."MaxFileSize"')), 0) [MaxFileSize]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FileFilter"')), '') [FileFilter]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."StorageType"')), '') [StorageType]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."IconURL"')), '') [IconURL]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Tags"')), '') [Tags]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."LoadDataOnInit"')), 0) [LoadDataOnInit]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Attachment.Type'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Attachment.Type.v] ON [Catalog.Attachment.Type.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.Type.v.code.f] ON [Catalog.Attachment.Type.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.Type.v.description.f] ON [Catalog.Attachment.Type.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.Type.v.description] ON [Catalog.Attachment.Type.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.Type.v.code] ON [Catalog.Attachment.Type.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.Type.v.user] ON [Catalog.Attachment.Type.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Attachment.Type.v.company] ON [Catalog.Attachment.Type.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Attachment.Type.v] TO jetti;
GO

      
------------------------------ END Catalog.Attachment.Type ------------------------------

GO
RAISERROR('Catalog.Attachment.Type complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.AllUnic.Lot start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.AllUnic.Lot ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.AllUnic.Lot.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.SalesStartDate'),127) [SalesStartDate]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Cost"')), 0) [Cost]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Currency"')) [Currency]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Product"')) [Product]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.AllUnic.Lot'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.AllUnic.Lot.v] ON [Catalog.AllUnic.Lot.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AllUnic.Lot.v.code.f] ON [Catalog.AllUnic.Lot.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AllUnic.Lot.v.description.f] ON [Catalog.AllUnic.Lot.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AllUnic.Lot.v.description] ON [Catalog.AllUnic.Lot.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AllUnic.Lot.v.code] ON [Catalog.AllUnic.Lot.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AllUnic.Lot.v.user] ON [Catalog.AllUnic.Lot.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AllUnic.Lot.v.company] ON [Catalog.AllUnic.Lot.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.AllUnic.Lot.v] TO jetti;
GO

      
------------------------------ END Catalog.AllUnic.Lot ------------------------------

GO
RAISERROR('Catalog.AllUnic.Lot complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Account start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Account ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Account.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isForex"')), 0) [isForex]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isActive"')), 0) [isActive]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isPassive"')), 0) [isPassive]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Account'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Account.v] ON [Catalog.Account.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Account.v.code.f] ON [Catalog.Account.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Account.v.description.f] ON [Catalog.Account.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Account.v.description] ON [Catalog.Account.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Account.v.code] ON [Catalog.Account.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Account.v.user] ON [Catalog.Account.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Account.v.company] ON [Catalog.Account.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Account.v] TO jetti;
GO

      
------------------------------ END Catalog.Account ------------------------------

GO
RAISERROR('Catalog.Account complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Balance start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Balance ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Balance.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isActive"')), 0) [isActive]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isPassive"')), 0) [isPassive]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DescriptionENG"')), '') [DescriptionENG]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Balance'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Balance.v] ON [Catalog.Balance.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.v.code.f] ON [Catalog.Balance.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.v.description.f] ON [Catalog.Balance.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.v.description] ON [Catalog.Balance.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.v.code] ON [Catalog.Balance.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.v.user] ON [Catalog.Balance.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.v.company] ON [Catalog.Balance.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Balance.v] TO jetti;
GO

      
------------------------------ END Catalog.Balance ------------------------------

GO
RAISERROR('Catalog.Balance complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Balance.Analytics start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Balance.Analytics ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Balance.Analytics.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DescriptionENG"')), '') [DescriptionENG]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Balance.Analytics'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Balance.Analytics.v] ON [Catalog.Balance.Analytics.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.Analytics.v.code.f] ON [Catalog.Balance.Analytics.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.Analytics.v.description.f] ON [Catalog.Balance.Analytics.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.Analytics.v.description] ON [Catalog.Balance.Analytics.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.Analytics.v.code] ON [Catalog.Balance.Analytics.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.Analytics.v.user] ON [Catalog.Balance.Analytics.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Balance.Analytics.v.company] ON [Catalog.Balance.Analytics.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Balance.Analytics.v] TO jetti;
GO

      
------------------------------ END Catalog.Balance.Analytics ------------------------------

GO
RAISERROR('Catalog.Balance.Analytics complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.BankAccount start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.BankAccount ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.BankAccount.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Bank"')) [Bank]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isDefault"')), 0) [isDefault]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.BankAccount'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.BankAccount.v] ON [Catalog.BankAccount.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BankAccount.v.code.f] ON [Catalog.BankAccount.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BankAccount.v.description.f] ON [Catalog.BankAccount.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BankAccount.v.description] ON [Catalog.BankAccount.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BankAccount.v.code] ON [Catalog.BankAccount.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BankAccount.v.user] ON [Catalog.BankAccount.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BankAccount.v.company] ON [Catalog.BankAccount.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.BankAccount.v] TO jetti;
GO

      
------------------------------ END Catalog.BankAccount ------------------------------

GO
RAISERROR('Catalog.BankAccount complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.CashFlow start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.CashFlow ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.CashFlow.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DescriptionENG"')), '') [DescriptionENG]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.CashFlow'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.CashFlow.v] ON [Catalog.CashFlow.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashFlow.v.code.f] ON [Catalog.CashFlow.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashFlow.v.description.f] ON [Catalog.CashFlow.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashFlow.v.description] ON [Catalog.CashFlow.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashFlow.v.code] ON [Catalog.CashFlow.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashFlow.v.user] ON [Catalog.CashFlow.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashFlow.v.company] ON [Catalog.CashFlow.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.CashFlow.v] TO jetti;
GO

      
------------------------------ END Catalog.CashFlow ------------------------------

GO
RAISERROR('Catalog.CashFlow complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.CashRegister start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.CashRegister ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.CashRegister.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isAccounting"')), 0) [isAccounting]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.CashRegister'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.CashRegister.v] ON [Catalog.CashRegister.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashRegister.v.code.f] ON [Catalog.CashRegister.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashRegister.v.description.f] ON [Catalog.CashRegister.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashRegister.v.description] ON [Catalog.CashRegister.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashRegister.v.code] ON [Catalog.CashRegister.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashRegister.v.user] ON [Catalog.CashRegister.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.CashRegister.v.company] ON [Catalog.CashRegister.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.CashRegister.v] TO jetti;
GO

      
------------------------------ END Catalog.CashRegister ------------------------------

GO
RAISERROR('Catalog.CashRegister complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Currency start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Currency ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Currency.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."ShortName"')), '') [ShortName]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Currency'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Currency.v] ON [Catalog.Currency.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Currency.v.code.f] ON [Catalog.Currency.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Currency.v.description.f] ON [Catalog.Currency.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Currency.v.description] ON [Catalog.Currency.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Currency.v.code] ON [Catalog.Currency.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Currency.v.user] ON [Catalog.Currency.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Currency.v.company] ON [Catalog.Currency.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Currency.v] TO jetti;
GO

      
------------------------------ END Catalog.Currency ------------------------------

GO
RAISERROR('Catalog.Currency complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Company start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Company ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Company.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."kind"')), '') [kind]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FullName"')), '') [FullName]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."prefix"')), '') [prefix]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Group"')) [Group]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Intercompany"')) [Intercompany]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Country"')) [Country]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ResponsibilityCenter"')) [ResponsibilityCenter]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."AddressShipping"')), '') [AddressShipping]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."AddressBilling"')), '') [AddressBilling]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Phone"')), '') [Phone]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code1"')), '') [Code1]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code2"')), '') [Code2]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code3"')), '') [Code3]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."BC"')), '') [BC]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."timeZone"')), '') [timeZone]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."TaxOffice"')) [TaxOffice]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."GLN"')), '') [GLN]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Company'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Company.v] ON [Catalog.Company.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.v.code.f] ON [Catalog.Company.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.v.description.f] ON [Catalog.Company.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.v.description] ON [Catalog.Company.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.v.code] ON [Catalog.Company.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.v.user] ON [Catalog.Company.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.v.company] ON [Catalog.Company.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Company.v] TO jetti;
GO

      
------------------------------ END Catalog.Company ------------------------------

GO
RAISERROR('Catalog.Company complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Company.Group start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Company.Group ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Company.Group.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FullName"')), '') [FullName]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Company.Group'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Company.Group.v] ON [Catalog.Company.Group.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.Group.v.code.f] ON [Catalog.Company.Group.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.Group.v.description.f] ON [Catalog.Company.Group.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.Group.v.description] ON [Catalog.Company.Group.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.Group.v.code] ON [Catalog.Company.Group.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.Group.v.user] ON [Catalog.Company.Group.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Company.Group.v.company] ON [Catalog.Company.Group.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Company.Group.v] TO jetti;
GO

      
------------------------------ END Catalog.Company.Group ------------------------------

GO
RAISERROR('Catalog.Company.Group complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Country start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Country ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Country.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Currency"')) [Currency]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Country'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Country.v] ON [Catalog.Country.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Country.v.code.f] ON [Catalog.Country.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Country.v.description.f] ON [Catalog.Country.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Country.v.description] ON [Catalog.Country.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Country.v.code] ON [Catalog.Country.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Country.v.user] ON [Catalog.Country.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Country.v.company] ON [Catalog.Country.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Country.v] TO jetti;
GO

      
------------------------------ END Catalog.Country ------------------------------

GO
RAISERROR('Catalog.Country complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Counterpartie start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Counterpartie ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Counterpartie.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."kind"')), '') [kind]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FullName"')), '') [FullName]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."Client"')), 0) [Client]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."Supplier"')), 0) [Supplier]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isInternal"')), 0) [isInternal]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."AddressShipping"')), '') [AddressShipping]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."AddressBilling"')), '') [AddressBilling]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Phone"')), '') [Phone]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code1"')), '') [Code1]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code2"')), '') [Code2]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code3"')), '') [Code3]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."BC"')), '') [BC]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."GLN"')), '') [GLN]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Counterpartie'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Counterpartie.v] ON [Catalog.Counterpartie.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.v.code.f] ON [Catalog.Counterpartie.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.v.description.f] ON [Catalog.Counterpartie.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.v.description] ON [Catalog.Counterpartie.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.v.code] ON [Catalog.Counterpartie.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.v.user] ON [Catalog.Counterpartie.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.v.company] ON [Catalog.Counterpartie.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Counterpartie.v] TO jetti;
GO

      
------------------------------ END Catalog.Counterpartie ------------------------------

GO
RAISERROR('Catalog.Counterpartie complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Counterpartie.BankAccount start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Counterpartie.BankAccount ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Counterpartie.BankAccount.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Bank"')) [Bank]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isDefault"')), 0) [isDefault]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."owner"')) [owner]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Counterpartie.BankAccount'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Counterpartie.BankAccount.v] ON [Catalog.Counterpartie.BankAccount.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.BankAccount.v.code.f] ON [Catalog.Counterpartie.BankAccount.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.BankAccount.v.description.f] ON [Catalog.Counterpartie.BankAccount.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.BankAccount.v.description] ON [Catalog.Counterpartie.BankAccount.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.BankAccount.v.code] ON [Catalog.Counterpartie.BankAccount.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.BankAccount.v.user] ON [Catalog.Counterpartie.BankAccount.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Counterpartie.BankAccount.v.company] ON [Catalog.Counterpartie.BankAccount.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Counterpartie.BankAccount.v] TO jetti;
GO

      
------------------------------ END Catalog.Counterpartie.BankAccount ------------------------------

GO
RAISERROR('Catalog.Counterpartie.BankAccount complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Contract start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Contract ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Contract.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."owner"')) [owner]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Status"')), '') [Status]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."kind"')), '') [kind]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.StartDate'),127) [StartDate]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.EndDate'),127) [EndDate]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Indulgence"')), 0) [Indulgence]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Amount"')), 0) [Amount]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BusinessDirection"')) [BusinessDirection]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."CashFlow"')) [CashFlow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BankAccount"')) [BankAccount]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Manager"')) [Manager]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isDefault"')), 0) [isDefault]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."notAccounting"')), 0) [notAccounting]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."RoyaltyArrangements"')), '') [RoyaltyArrangements]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.RoyaltyDelayTo'),127) [RoyaltyDelayTo]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."PaymentKC"')), '') [PaymentKC]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."RoyaltyPercent"')), 0) [RoyaltyPercent]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."PaymentOVM"')), '') [PaymentOVM]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."PaymentOKK"')), '') [PaymentOKK]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."PaymentKRO"')), '') [PaymentKRO]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."OtherServices"')), '') [OtherServices]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Contract'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Contract.v] ON [Catalog.Contract.v](id);
      CREATE NONCLUSTERED INDEX[Catalog.Contract.v.owner] ON [Catalog.Contract.v]([owner]) INCLUDE([company]);
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.v.code.f] ON [Catalog.Contract.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.v.description.f] ON [Catalog.Contract.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.v.description] ON [Catalog.Contract.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.v.code] ON [Catalog.Contract.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.v.user] ON [Catalog.Contract.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.v.company] ON [Catalog.Contract.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Contract.v] TO jetti;
GO

      
------------------------------ END Catalog.Contract ------------------------------

GO
RAISERROR('Catalog.Contract complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Contract.Intercompany start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Contract.Intercompany ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Contract.Intercompany.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."KorrCompany"')) [KorrCompany]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Status"')), '') [Status]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.StartDate'),127) [StartDate]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.EndDate'),127) [EndDate]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Amount"')), 0) [Amount]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."CashFlow"')) [CashFlow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isDefault"')), 0) [isDefault]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."notAccounting"')), 0) [notAccounting]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Contract.Intercompany'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Contract.Intercompany.v] ON [Catalog.Contract.Intercompany.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.Intercompany.v.code.f] ON [Catalog.Contract.Intercompany.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.Intercompany.v.description.f] ON [Catalog.Contract.Intercompany.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.Intercompany.v.description] ON [Catalog.Contract.Intercompany.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.Intercompany.v.code] ON [Catalog.Contract.Intercompany.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.Intercompany.v.user] ON [Catalog.Contract.Intercompany.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Contract.Intercompany.v.company] ON [Catalog.Contract.Intercompany.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Contract.Intercompany.v] TO jetti;
GO

      
------------------------------ END Catalog.Contract.Intercompany ------------------------------

GO
RAISERROR('Catalog.Contract.Intercompany complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.BusinessDirection start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.BusinessDirection ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.BusinessDirection.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.BusinessDirection'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.BusinessDirection.v] ON [Catalog.BusinessDirection.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessDirection.v.code.f] ON [Catalog.BusinessDirection.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessDirection.v.description.f] ON [Catalog.BusinessDirection.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessDirection.v.description] ON [Catalog.BusinessDirection.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessDirection.v.code] ON [Catalog.BusinessDirection.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessDirection.v.user] ON [Catalog.BusinessDirection.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessDirection.v.company] ON [Catalog.BusinessDirection.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.BusinessDirection.v] TO jetti;
GO

      
------------------------------ END Catalog.BusinessDirection ------------------------------

GO
RAISERROR('Catalog.BusinessDirection complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Salary.Analytics start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Salary.Analytics ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Salary.Analytics.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."SalaryKind"')), '') [SalaryKind]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Unit"')) [Unit]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Salary.Analytics'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Salary.Analytics.v] ON [Catalog.Salary.Analytics.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Salary.Analytics.v.code.f] ON [Catalog.Salary.Analytics.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Salary.Analytics.v.description.f] ON [Catalog.Salary.Analytics.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Salary.Analytics.v.description] ON [Catalog.Salary.Analytics.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Salary.Analytics.v.code] ON [Catalog.Salary.Analytics.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Salary.Analytics.v.user] ON [Catalog.Salary.Analytics.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Salary.Analytics.v.company] ON [Catalog.Salary.Analytics.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Salary.Analytics.v] TO jetti;
GO

      
------------------------------ END Catalog.Salary.Analytics ------------------------------

GO
RAISERROR('Catalog.Salary.Analytics complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Department start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Department ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Department.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."ShortName"')), '') [ShortName]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BusinessRegion"')) [BusinessRegion]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ResponsibilityCenter"')) [ResponsibilityCenter]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.OpeningDate'),127) [OpeningDate]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.ClosingDate'),127) [ClosingDate]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."TaxOffice"')) [TaxOffice]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Manager"')) [Manager]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Brand"')) [Brand]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."PriceType"')) [PriceType]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."kind"')) [kind]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Mail"')), '') [Mail]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Phone"')), '') [Phone]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Address"')), '') [Address]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."AddressLegal"')), '') [AddressLegal]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Longitude"')), '') [Longitude]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Latitude"')), '') [Latitude]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."IntegrationType"')), '') [IntegrationType]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Department'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Department.v] ON [Catalog.Department.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.v.code.f] ON [Catalog.Department.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.v.description.f] ON [Catalog.Department.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.v.description] ON [Catalog.Department.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.v.code] ON [Catalog.Department.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.v.user] ON [Catalog.Department.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.v.company] ON [Catalog.Department.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Department.v] TO jetti;
GO

      
------------------------------ END Catalog.Department ------------------------------

GO
RAISERROR('Catalog.Department complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Department.Kind start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Department.Kind ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Department.Kind.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Department.Kind'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Department.Kind.v] ON [Catalog.Department.Kind.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Kind.v.code.f] ON [Catalog.Department.Kind.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Kind.v.description.f] ON [Catalog.Department.Kind.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Kind.v.description] ON [Catalog.Department.Kind.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Kind.v.code] ON [Catalog.Department.Kind.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Kind.v.user] ON [Catalog.Department.Kind.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Kind.v.company] ON [Catalog.Department.Kind.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Department.Kind.v] TO jetti;
GO

      
------------------------------ END Catalog.Department.Kind ------------------------------

GO
RAISERROR('Catalog.Department.Kind complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Department.Company start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Department.Company ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Department.Company.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."kind"')), '') [kind]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."ShortName"')), '') [ShortName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."SecurityGroup"')), '') [SecurityGroup]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."StaffingPositionManager"')) [StaffingPositionManager]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Department.Company'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Department.Company.v] ON [Catalog.Department.Company.v](id);
      CREATE NONCLUSTERED INDEX[Catalog.Department.Company.v.isfolder] ON [Catalog.Department.Company.v]([isfolder]) INCLUDE([company]);
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Company.v.code.f] ON [Catalog.Department.Company.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Company.v.description.f] ON [Catalog.Department.Company.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Company.v.description] ON [Catalog.Department.Company.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Company.v.code] ON [Catalog.Department.Company.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Company.v.user] ON [Catalog.Department.Company.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.Company.v.company] ON [Catalog.Department.Company.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Department.Company.v] TO jetti;
GO

      
------------------------------ END Catalog.Department.Company ------------------------------

GO
RAISERROR('Catalog.Department.Company complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Department.StatusReason start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Department.StatusReason ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Department.StatusReason.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Department.StatusReason'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Department.StatusReason.v] ON [Catalog.Department.StatusReason.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.StatusReason.v.code.f] ON [Catalog.Department.StatusReason.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.StatusReason.v.description.f] ON [Catalog.Department.StatusReason.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.StatusReason.v.description] ON [Catalog.Department.StatusReason.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.StatusReason.v.code] ON [Catalog.Department.StatusReason.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.StatusReason.v.user] ON [Catalog.Department.StatusReason.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Department.StatusReason.v.company] ON [Catalog.Department.StatusReason.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Department.StatusReason.v] TO jetti;
GO

      
------------------------------ END Catalog.Department.StatusReason ------------------------------

GO
RAISERROR('Catalog.Department.StatusReason complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Expense start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Expense ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Expense.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Account"')) [Account]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BudgetItem"')) [BudgetItem]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Assign"')), '') [Assign]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DescriptionENG"')), '') [DescriptionENG]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Expense'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Expense.v] ON [Catalog.Expense.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.v.code.f] ON [Catalog.Expense.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.v.description.f] ON [Catalog.Expense.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.v.description] ON [Catalog.Expense.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.v.code] ON [Catalog.Expense.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.v.user] ON [Catalog.Expense.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.v.company] ON [Catalog.Expense.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Expense.v] TO jetti;
GO

      
------------------------------ END Catalog.Expense ------------------------------

GO
RAISERROR('Catalog.Expense complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Expense.Analytics start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Expense.Analytics ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Expense.Analytics.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BudgetItem"')) [BudgetItem]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DescriptionENG"')), '') [DescriptionENG]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Expense.Analytics'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Expense.Analytics.v] ON [Catalog.Expense.Analytics.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.Analytics.v.code.f] ON [Catalog.Expense.Analytics.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.Analytics.v.description.f] ON [Catalog.Expense.Analytics.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.Analytics.v.description] ON [Catalog.Expense.Analytics.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.Analytics.v.code] ON [Catalog.Expense.Analytics.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.Analytics.v.user] ON [Catalog.Expense.Analytics.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Expense.Analytics.v.company] ON [Catalog.Expense.Analytics.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Expense.Analytics.v] TO jetti;
GO

      
------------------------------ END Catalog.Expense.Analytics ------------------------------

GO
RAISERROR('Catalog.Expense.Analytics complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Income start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Income ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Income.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Account"')) [Account]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BudgetItem"')) [BudgetItem]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Assign"')), '') [Assign]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DescriptionENG"')), '') [DescriptionENG]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Income'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Income.v] ON [Catalog.Income.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Income.v.code.f] ON [Catalog.Income.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Income.v.description.f] ON [Catalog.Income.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Income.v.description] ON [Catalog.Income.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Income.v.code] ON [Catalog.Income.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Income.v.user] ON [Catalog.Income.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Income.v.company] ON [Catalog.Income.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Income.v] TO jetti;
GO

      
------------------------------ END Catalog.Income ------------------------------

GO
RAISERROR('Catalog.Income complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Loan start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Loan ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Loan.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.PayDay'),127) [PayDay]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.CloseDay'),127) [CloseDay]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."owner"')) [owner]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."OwnerBankAccount"')) [OwnerBankAccount]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."CashKind"')), '') [CashKind]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."kind"')), '') [kind]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Status"')), '') [Status]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."InvestorGroup"')) [InvestorGroup]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."InterestRate"')), 0) [InterestRate]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.InterestDeadline'),127) [InterestDeadline]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."loanType"')) [loanType]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."AmountLoan"')), 0) [AmountLoan]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Country"')) [Country]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Lot"')) [Lot]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."LotQty"')), 0) [LotQty]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."LoanRepaymentProcedure"')) [LoanRepaymentProcedure]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.PayDeadline'),127) [PayDeadline]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Loan'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Loan.v] ON [Catalog.Loan.v](id);
      CREATE NONCLUSTERED INDEX[Catalog.Loan.v.owner] ON [Catalog.Loan.v]([owner]) INCLUDE([company]);
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Loan.v.code.f] ON [Catalog.Loan.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Loan.v.description.f] ON [Catalog.Loan.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Loan.v.description] ON [Catalog.Loan.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Loan.v.code] ON [Catalog.Loan.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Loan.v.user] ON [Catalog.Loan.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Loan.v.company] ON [Catalog.Loan.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Loan.v] TO jetti;
GO

      
------------------------------ END Catalog.Loan ------------------------------

GO
RAISERROR('Catalog.Loan complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.LoanRepaymentProcedure start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.LoanRepaymentProcedure ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.LoanRepaymentProcedure.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.LoanRepaymentProcedure'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.LoanRepaymentProcedure.v] ON [Catalog.LoanRepaymentProcedure.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanRepaymentProcedure.v.code.f] ON [Catalog.LoanRepaymentProcedure.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanRepaymentProcedure.v.description.f] ON [Catalog.LoanRepaymentProcedure.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanRepaymentProcedure.v.description] ON [Catalog.LoanRepaymentProcedure.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanRepaymentProcedure.v.code] ON [Catalog.LoanRepaymentProcedure.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanRepaymentProcedure.v.user] ON [Catalog.LoanRepaymentProcedure.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanRepaymentProcedure.v.company] ON [Catalog.LoanRepaymentProcedure.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.LoanRepaymentProcedure.v] TO jetti;
GO

      
------------------------------ END Catalog.LoanRepaymentProcedure ------------------------------

GO
RAISERROR('Catalog.LoanRepaymentProcedure complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.LoanTypes start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.LoanTypes ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.LoanTypes.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Balance"')) [Balance]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.LoanTypes'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.LoanTypes.v] ON [Catalog.LoanTypes.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanTypes.v.code.f] ON [Catalog.LoanTypes.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanTypes.v.description.f] ON [Catalog.LoanTypes.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanTypes.v.description] ON [Catalog.LoanTypes.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanTypes.v.code] ON [Catalog.LoanTypes.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanTypes.v.user] ON [Catalog.LoanTypes.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.LoanTypes.v.company] ON [Catalog.LoanTypes.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.LoanTypes.v] TO jetti;
GO

      
------------------------------ END Catalog.LoanTypes ------------------------------

GO
RAISERROR('Catalog.LoanTypes complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Manager start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Manager ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Manager.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FullName"')), '') [FullName]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."Gender"')), 0) [Gender]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.Birthday'),127) [Birthday]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Manager'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Manager.v] ON [Catalog.Manager.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Manager.v.code.f] ON [Catalog.Manager.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Manager.v.description.f] ON [Catalog.Manager.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Manager.v.description] ON [Catalog.Manager.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Manager.v.code] ON [Catalog.Manager.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Manager.v.user] ON [Catalog.Manager.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Manager.v.company] ON [Catalog.Manager.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Manager.v] TO jetti;
GO

      
------------------------------ END Catalog.Manager ------------------------------

GO
RAISERROR('Catalog.Manager complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Person start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Person ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Person.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Gender"')), '') [Gender]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FirstName"')), '') [FirstName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."LastName"')), '') [LastName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."MiddleName"')), '') [MiddleName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code1"')), '') [Code1]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code2"')), '') [Code2]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Address"')), '') [Address]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."AddressResidence"')), '') [AddressResidence]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."City"')), '') [City]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Phone"')), '') [Phone]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Email"')), '') [Email]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.EmploymentDate'),127) [EmploymentDate]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."JobTitle"')) [JobTitle]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Country"')) [Country]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Profile"')), '') [Profile]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."DocumentType"')) [DocumentType]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DocumentCode"')), '') [DocumentCode]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DocumentNumber"')), '') [DocumentNumber]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.DocumentDate'),127) [DocumentDate]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DocumentAuthority"')), '') [DocumentAuthority]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."AccountAD"')), '') [AccountAD]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Pincode"')), '') [Pincode]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."Fired"')), 0) [Fired]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Person'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Person.v] ON [Catalog.Person.v](id);
      CREATE NONCLUSTERED INDEX[Catalog.Person.v.Code1] ON [Catalog.Person.v]([Code1]) INCLUDE([company]);
CREATE NONCLUSTERED INDEX[Catalog.Person.v.Profile] ON [Catalog.Person.v]([Profile]) INCLUDE([company]);
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.v.code.f] ON [Catalog.Person.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.v.description.f] ON [Catalog.Person.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.v.description] ON [Catalog.Person.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.v.code] ON [Catalog.Person.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.v.user] ON [Catalog.Person.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.v.company] ON [Catalog.Person.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Person.v] TO jetti;
GO

      
------------------------------ END Catalog.Person ------------------------------

GO
RAISERROR('Catalog.Person complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.PriceType start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.PriceType ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.PriceType.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."TaxInclude"')), 0) [TaxInclude]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Brand"')) [Brand]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.PriceType'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.PriceType.v] ON [Catalog.PriceType.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PriceType.v.code.f] ON [Catalog.PriceType.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PriceType.v.description.f] ON [Catalog.PriceType.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PriceType.v.description] ON [Catalog.PriceType.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PriceType.v.code] ON [Catalog.PriceType.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PriceType.v.user] ON [Catalog.PriceType.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PriceType.v.company] ON [Catalog.PriceType.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.PriceType.v] TO jetti;
GO

      
------------------------------ END Catalog.PriceType ------------------------------

GO
RAISERROR('Catalog.PriceType complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Product start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Product ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Product.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ProductKind"')) [ProductKind]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ProductCategory"')) [ProductCategory]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Specification"')) [Specification]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Brand"')) [Brand]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Unit"')) [Unit]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Expense"')) [Expense]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Analytics"')) [Analytics]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ProductReport"')) [ProductReport]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Settings"')) [Settings]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."Purchased"')), 0) [Purchased]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."ShortCode"')), '') [ShortCode]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."ShortName"')), '') [ShortName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Tags"')), '') [Tags]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Weight"')), 0) [Weight]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Volume"')), 0) [Volume]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."CookingPlace"')), '') [CookingPlace]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Product'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Product.v] ON [Catalog.Product.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.v.code.f] ON [Catalog.Product.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.v.description.f] ON [Catalog.Product.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.v.description] ON [Catalog.Product.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.v.code] ON [Catalog.Product.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.v.user] ON [Catalog.Product.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.v.company] ON [Catalog.Product.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Product.v] TO jetti;
GO

      
------------------------------ END Catalog.Product ------------------------------

GO
RAISERROR('Catalog.Product complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.PlanningScenario start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.PlanningScenario ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.PlanningScenario.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.PlanningScenario'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.PlanningScenario.v] ON [Catalog.PlanningScenario.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PlanningScenario.v.code.f] ON [Catalog.PlanningScenario.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PlanningScenario.v.description.f] ON [Catalog.PlanningScenario.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PlanningScenario.v.description] ON [Catalog.PlanningScenario.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PlanningScenario.v.code] ON [Catalog.PlanningScenario.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PlanningScenario.v.user] ON [Catalog.PlanningScenario.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PlanningScenario.v.company] ON [Catalog.PlanningScenario.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.PlanningScenario.v] TO jetti;
GO

      
------------------------------ END Catalog.PlanningScenario ------------------------------

GO
RAISERROR('Catalog.PlanningScenario complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.ProductCategory start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.ProductCategory ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.ProductCategory.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.ProductCategory'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.ProductCategory.v] ON [Catalog.ProductCategory.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductCategory.v.code.f] ON [Catalog.ProductCategory.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductCategory.v.description.f] ON [Catalog.ProductCategory.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductCategory.v.description] ON [Catalog.ProductCategory.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductCategory.v.code] ON [Catalog.ProductCategory.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductCategory.v.user] ON [Catalog.ProductCategory.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductCategory.v.company] ON [Catalog.ProductCategory.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.ProductCategory.v] TO jetti;
GO

      
------------------------------ END Catalog.ProductCategory ------------------------------

GO
RAISERROR('Catalog.ProductCategory complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.ProductKind start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.ProductKind ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.ProductKind.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."ProductType"')), '') [ProductType]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.ProductKind'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.ProductKind.v] ON [Catalog.ProductKind.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductKind.v.code.f] ON [Catalog.ProductKind.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductKind.v.description.f] ON [Catalog.ProductKind.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductKind.v.description] ON [Catalog.ProductKind.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductKind.v.code] ON [Catalog.ProductKind.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductKind.v.user] ON [Catalog.ProductKind.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ProductKind.v.company] ON [Catalog.ProductKind.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.ProductKind.v] TO jetti;
GO

      
------------------------------ END Catalog.ProductKind ------------------------------

GO
RAISERROR('Catalog.ProductKind complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Product.Report start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Product.Report ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Product.Report.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Brand"')) [Brand]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Unit"')) [Unit]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Product.Report'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Product.Report.v] ON [Catalog.Product.Report.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Report.v.code.f] ON [Catalog.Product.Report.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Report.v.description.f] ON [Catalog.Product.Report.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Report.v.description] ON [Catalog.Product.Report.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Report.v.code] ON [Catalog.Product.Report.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Report.v.user] ON [Catalog.Product.Report.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Report.v.company] ON [Catalog.Product.Report.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Product.Report.v] TO jetti;
GO

      
------------------------------ END Catalog.Product.Report ------------------------------

GO
RAISERROR('Catalog.Product.Report complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.PromotionChannel start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.PromotionChannel ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.PromotionChannel.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.PromotionChannel'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.PromotionChannel.v] ON [Catalog.PromotionChannel.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PromotionChannel.v.code.f] ON [Catalog.PromotionChannel.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PromotionChannel.v.description.f] ON [Catalog.PromotionChannel.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PromotionChannel.v.description] ON [Catalog.PromotionChannel.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PromotionChannel.v.code] ON [Catalog.PromotionChannel.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PromotionChannel.v.user] ON [Catalog.PromotionChannel.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PromotionChannel.v.company] ON [Catalog.PromotionChannel.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.PromotionChannel.v] TO jetti;
GO

      
------------------------------ END Catalog.PromotionChannel ------------------------------

GO
RAISERROR('Catalog.PromotionChannel complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Storehouse start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Storehouse ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Storehouse.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Storehouse'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Storehouse.v] ON [Catalog.Storehouse.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Storehouse.v.code.f] ON [Catalog.Storehouse.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Storehouse.v.description.f] ON [Catalog.Storehouse.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Storehouse.v.description] ON [Catalog.Storehouse.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Storehouse.v.code] ON [Catalog.Storehouse.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Storehouse.v.user] ON [Catalog.Storehouse.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Storehouse.v.company] ON [Catalog.Storehouse.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Storehouse.v] TO jetti;
GO

      
------------------------------ END Catalog.Storehouse ------------------------------

GO
RAISERROR('Catalog.Storehouse complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Operation start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Operation ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Operation.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Group"')) [Group]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."shortName"')), '') [shortName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."script"')), '') [script]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."module"')), '') [module]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Operation'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Operation.v] ON [Catalog.Operation.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.v.code.f] ON [Catalog.Operation.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.v.description.f] ON [Catalog.Operation.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.v.description] ON [Catalog.Operation.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.v.code] ON [Catalog.Operation.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.v.user] ON [Catalog.Operation.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.v.company] ON [Catalog.Operation.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Operation.v] TO jetti;
GO

      
------------------------------ END Catalog.Operation ------------------------------

GO
RAISERROR('Catalog.Operation complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Operation.Group start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Operation.Group ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Operation.Group.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Prefix"')), '') [Prefix]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."menu"')), '') [menu]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."icon"')), '') [icon]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Operation.Group'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Operation.Group.v] ON [Catalog.Operation.Group.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Group.v.code.f] ON [Catalog.Operation.Group.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Group.v.description.f] ON [Catalog.Operation.Group.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Group.v.description] ON [Catalog.Operation.Group.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Group.v.code] ON [Catalog.Operation.Group.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Group.v.user] ON [Catalog.Operation.Group.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Group.v.company] ON [Catalog.Operation.Group.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Operation.Group.v] TO jetti;
GO

      
------------------------------ END Catalog.Operation.Group ------------------------------

GO
RAISERROR('Catalog.Operation.Group complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Operation.Type start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Operation.Type ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Operation.Type.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Operation.Type'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Operation.Type.v] ON [Catalog.Operation.Type.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Type.v.code.f] ON [Catalog.Operation.Type.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Type.v.description.f] ON [Catalog.Operation.Type.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Type.v.description] ON [Catalog.Operation.Type.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Type.v.code] ON [Catalog.Operation.Type.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Type.v.user] ON [Catalog.Operation.Type.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Operation.Type.v.company] ON [Catalog.Operation.Type.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Operation.Type.v] TO jetti;
GO

      
------------------------------ END Catalog.Operation.Type ------------------------------

GO
RAISERROR('Catalog.Operation.Type complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.OrderSource start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.OrderSource ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.OrderSource.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Kind"')), '') [Kind]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.OrderSource'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.OrderSource.v] ON [Catalog.OrderSource.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.OrderSource.v.code.f] ON [Catalog.OrderSource.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.OrderSource.v.description.f] ON [Catalog.OrderSource.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.OrderSource.v.description] ON [Catalog.OrderSource.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.OrderSource.v.code] ON [Catalog.OrderSource.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.OrderSource.v.user] ON [Catalog.OrderSource.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.OrderSource.v.company] ON [Catalog.OrderSource.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.OrderSource.v] TO jetti;
GO

      
------------------------------ END Catalog.OrderSource ------------------------------

GO
RAISERROR('Catalog.OrderSource complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Unit start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Unit ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Unit.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BaseUnit"')) [BaseUnit]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Rate"')), 0) [Rate]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."kind"')), '') [kind]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Unit'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Unit.v] ON [Catalog.Unit.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Unit.v.code.f] ON [Catalog.Unit.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Unit.v.description.f] ON [Catalog.Unit.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Unit.v.description] ON [Catalog.Unit.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Unit.v.code] ON [Catalog.Unit.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Unit.v.user] ON [Catalog.Unit.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Unit.v.company] ON [Catalog.Unit.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Unit.v] TO jetti;
GO

      
------------------------------ END Catalog.Unit ------------------------------

GO
RAISERROR('Catalog.Unit complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.User start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.User ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.User.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isAdmin"')), 0) [isAdmin]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isDisabled"')), 0) [isDisabled]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Person"')) [Person]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.User'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.User.v] ON [Catalog.User.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.User.v.code.f] ON [Catalog.User.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.User.v.description.f] ON [Catalog.User.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.User.v.description] ON [Catalog.User.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.User.v.code] ON [Catalog.User.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.User.v.user] ON [Catalog.User.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.User.v.company] ON [Catalog.User.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.User.v] TO jetti;
GO

      
------------------------------ END Catalog.User ------------------------------

GO
RAISERROR('Catalog.User complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.UsersGroup start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.UsersGroup ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.UsersGroup.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.UsersGroup'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.UsersGroup.v] ON [Catalog.UsersGroup.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.UsersGroup.v.code.f] ON [Catalog.UsersGroup.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.UsersGroup.v.description.f] ON [Catalog.UsersGroup.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.UsersGroup.v.description] ON [Catalog.UsersGroup.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.UsersGroup.v.code] ON [Catalog.UsersGroup.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.UsersGroup.v.user] ON [Catalog.UsersGroup.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.UsersGroup.v.company] ON [Catalog.UsersGroup.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.UsersGroup.v] TO jetti;
GO

      
------------------------------ END Catalog.UsersGroup ------------------------------

GO
RAISERROR('Catalog.UsersGroup complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Role start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Role ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Role.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Role'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Role.v] ON [Catalog.Role.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Role.v.code.f] ON [Catalog.Role.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Role.v.description.f] ON [Catalog.Role.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Role.v.description] ON [Catalog.Role.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Role.v.code] ON [Catalog.Role.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Role.v.user] ON [Catalog.Role.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Role.v.company] ON [Catalog.Role.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Role.v] TO jetti;
GO

      
------------------------------ END Catalog.Role ------------------------------

GO
RAISERROR('Catalog.Role complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.SubSystem start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.SubSystem ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.SubSystem.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."icon"')), '') [icon]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.SubSystem'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.SubSystem.v] ON [Catalog.SubSystem.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SubSystem.v.code.f] ON [Catalog.SubSystem.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SubSystem.v.description.f] ON [Catalog.SubSystem.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SubSystem.v.description] ON [Catalog.SubSystem.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SubSystem.v.code] ON [Catalog.SubSystem.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SubSystem.v.user] ON [Catalog.SubSystem.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SubSystem.v.company] ON [Catalog.SubSystem.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.SubSystem.v] TO jetti;
GO

      
------------------------------ END Catalog.SubSystem ------------------------------

GO
RAISERROR('Catalog.SubSystem complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.JobTitle start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.JobTitle ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.JobTitle.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Category"')) [Category]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."TO"')), 0) [TO]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."CO"')), 0) [CO]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.JobTitle'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.JobTitle.v] ON [Catalog.JobTitle.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.v.code.f] ON [Catalog.JobTitle.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.v.description.f] ON [Catalog.JobTitle.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.v.description] ON [Catalog.JobTitle.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.v.code] ON [Catalog.JobTitle.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.v.user] ON [Catalog.JobTitle.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.v.company] ON [Catalog.JobTitle.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.JobTitle.v] TO jetti;
GO

      
------------------------------ END Catalog.JobTitle ------------------------------

GO
RAISERROR('Catalog.JobTitle complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.JobTitle.Category start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.JobTitle.Category ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.JobTitle.Category.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.JobTitle.Category'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.JobTitle.Category.v] ON [Catalog.JobTitle.Category.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.Category.v.code.f] ON [Catalog.JobTitle.Category.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.Category.v.description.f] ON [Catalog.JobTitle.Category.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.Category.v.description] ON [Catalog.JobTitle.Category.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.Category.v.code] ON [Catalog.JobTitle.Category.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.Category.v.user] ON [Catalog.JobTitle.Category.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.JobTitle.Category.v.company] ON [Catalog.JobTitle.Category.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.JobTitle.Category.v] TO jetti;
GO

      
------------------------------ END Catalog.JobTitle.Category ------------------------------

GO
RAISERROR('Catalog.JobTitle.Category complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.PersonIdentity start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.PersonIdentity ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.PersonIdentity.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.PersonIdentity'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.PersonIdentity.v] ON [Catalog.PersonIdentity.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PersonIdentity.v.code.f] ON [Catalog.PersonIdentity.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PersonIdentity.v.description.f] ON [Catalog.PersonIdentity.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PersonIdentity.v.description] ON [Catalog.PersonIdentity.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PersonIdentity.v.code] ON [Catalog.PersonIdentity.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PersonIdentity.v.user] ON [Catalog.PersonIdentity.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.PersonIdentity.v.company] ON [Catalog.PersonIdentity.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.PersonIdentity.v] TO jetti;
GO

      
------------------------------ END Catalog.PersonIdentity ------------------------------

GO
RAISERROR('Catalog.PersonIdentity complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.ReasonTypes start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.ReasonTypes ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.ReasonTypes.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.ReasonTypes'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.ReasonTypes.v] ON [Catalog.ReasonTypes.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ReasonTypes.v.code.f] ON [Catalog.ReasonTypes.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ReasonTypes.v.description.f] ON [Catalog.ReasonTypes.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ReasonTypes.v.description] ON [Catalog.ReasonTypes.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ReasonTypes.v.code] ON [Catalog.ReasonTypes.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ReasonTypes.v.user] ON [Catalog.ReasonTypes.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ReasonTypes.v.company] ON [Catalog.ReasonTypes.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.ReasonTypes.v] TO jetti;
GO

      
------------------------------ END Catalog.ReasonTypes ------------------------------

GO
RAISERROR('Catalog.ReasonTypes complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Product.Package start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Product.Package ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Product.Package.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Product"')) [Product]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Qty"')), 0) [Qty]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isActive"')), 0) [isActive]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Label"')), '') [Label]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Product.Package'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Product.Package.v] ON [Catalog.Product.Package.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Package.v.code.f] ON [Catalog.Product.Package.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Package.v.description.f] ON [Catalog.Product.Package.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Package.v.description] ON [Catalog.Product.Package.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Package.v.code] ON [Catalog.Product.Package.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Package.v.user] ON [Catalog.Product.Package.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Package.v.company] ON [Catalog.Product.Package.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Product.Package.v] TO jetti;
GO

      
------------------------------ END Catalog.Product.Package ------------------------------

GO
RAISERROR('Catalog.Product.Package complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Product.Analytic start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Product.Analytic ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Product.Analytic.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Note"')), '') [Note]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isActive"')), 0) [isActive]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."SortOrder"')), 0) [SortOrder]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Product.Analytic'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Product.Analytic.v] ON [Catalog.Product.Analytic.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Analytic.v.code.f] ON [Catalog.Product.Analytic.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Analytic.v.description.f] ON [Catalog.Product.Analytic.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Analytic.v.description] ON [Catalog.Product.Analytic.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Analytic.v.code] ON [Catalog.Product.Analytic.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Analytic.v.user] ON [Catalog.Product.Analytic.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Product.Analytic.v.company] ON [Catalog.Product.Analytic.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Product.Analytic.v] TO jetti;
GO

      
------------------------------ END Catalog.Product.Analytic ------------------------------

GO
RAISERROR('Catalog.Product.Analytic complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.StaffingTable start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.StaffingTable ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.StaffingTable.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."JobTitle"')) [JobTitle]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."DepartmentCompany"')) [DepartmentCompany]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Currency"')) [Currency]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.ActivationDate'),127) [ActivationDate]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.CloseDate'),127) [CloseDate]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Qty"')), 0) [Qty]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Cost"')), 0) [Cost]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.StaffingTable'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.StaffingTable.v] ON [Catalog.StaffingTable.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.StaffingTable.v.code.f] ON [Catalog.StaffingTable.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.StaffingTable.v.description.f] ON [Catalog.StaffingTable.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.StaffingTable.v.description] ON [Catalog.StaffingTable.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.StaffingTable.v.code] ON [Catalog.StaffingTable.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.StaffingTable.v.user] ON [Catalog.StaffingTable.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.StaffingTable.v.company] ON [Catalog.StaffingTable.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.StaffingTable.v] TO jetti;
GO

      
------------------------------ END Catalog.StaffingTable ------------------------------

GO
RAISERROR('Catalog.StaffingTable complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Brand start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Brand ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Brand.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Brand'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Brand.v] ON [Catalog.Brand.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Brand.v.code.f] ON [Catalog.Brand.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Brand.v.description.f] ON [Catalog.Brand.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Brand.v.description] ON [Catalog.Brand.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Brand.v.code] ON [Catalog.Brand.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Brand.v.user] ON [Catalog.Brand.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Brand.v.company] ON [Catalog.Brand.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Brand.v] TO jetti;
GO

      
------------------------------ END Catalog.Brand ------------------------------

GO
RAISERROR('Catalog.Brand complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.GroupObjectsExploitation start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.GroupObjectsExploitation ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.GroupObjectsExploitation.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Method"')), '') [Method]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.GroupObjectsExploitation'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.GroupObjectsExploitation.v] ON [Catalog.GroupObjectsExploitation.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.GroupObjectsExploitation.v.code.f] ON [Catalog.GroupObjectsExploitation.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.GroupObjectsExploitation.v.description.f] ON [Catalog.GroupObjectsExploitation.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.GroupObjectsExploitation.v.description] ON [Catalog.GroupObjectsExploitation.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.GroupObjectsExploitation.v.code] ON [Catalog.GroupObjectsExploitation.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.GroupObjectsExploitation.v.user] ON [Catalog.GroupObjectsExploitation.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.GroupObjectsExploitation.v.company] ON [Catalog.GroupObjectsExploitation.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.GroupObjectsExploitation.v] TO jetti;
GO

      
------------------------------ END Catalog.GroupObjectsExploitation ------------------------------

GO
RAISERROR('Catalog.GroupObjectsExploitation complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.ObjectsExploitation start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.ObjectsExploitation ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.ObjectsExploitation.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Group"')) [Group]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."InventoryNumber"')), '') [InventoryNumber]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.ObjectsExploitation'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.ObjectsExploitation.v] ON [Catalog.ObjectsExploitation.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ObjectsExploitation.v.code.f] ON [Catalog.ObjectsExploitation.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ObjectsExploitation.v.description.f] ON [Catalog.ObjectsExploitation.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ObjectsExploitation.v.description] ON [Catalog.ObjectsExploitation.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ObjectsExploitation.v.code] ON [Catalog.ObjectsExploitation.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ObjectsExploitation.v.user] ON [Catalog.ObjectsExploitation.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ObjectsExploitation.v.company] ON [Catalog.ObjectsExploitation.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.ObjectsExploitation.v] TO jetti;
GO

      
------------------------------ END Catalog.ObjectsExploitation ------------------------------

GO
RAISERROR('Catalog.ObjectsExploitation complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Catalog start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Catalog ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Catalog.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."typeString"')), '') [typeString]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."prefix"')), '') [prefix]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."icon"')), '') [icon]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."menu"')), '') [menu]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."presentation"')), '') [presentation]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."hierarchy"')), '') [hierarchy]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."module"')), '') [module]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Catalog'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Catalog.v] ON [Catalog.Catalog.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Catalog.v.code.f] ON [Catalog.Catalog.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Catalog.v.description.f] ON [Catalog.Catalog.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Catalog.v.description] ON [Catalog.Catalog.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Catalog.v.code] ON [Catalog.Catalog.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Catalog.v.user] ON [Catalog.Catalog.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Catalog.v.company] ON [Catalog.Catalog.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Catalog.v] TO jetti;
GO

      
------------------------------ END Catalog.Catalog ------------------------------

GO
RAISERROR('Catalog.Catalog complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.BudgetItem start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.BudgetItem ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.BudgetItem.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."parent2"')) [parent2]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."UnaryOperator"')), '') [UnaryOperator]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."DescriptionENG"')), '') [DescriptionENG]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.BudgetItem'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.BudgetItem.v] ON [Catalog.BudgetItem.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BudgetItem.v.code.f] ON [Catalog.BudgetItem.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BudgetItem.v.description.f] ON [Catalog.BudgetItem.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BudgetItem.v.description] ON [Catalog.BudgetItem.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BudgetItem.v.code] ON [Catalog.BudgetItem.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BudgetItem.v.user] ON [Catalog.BudgetItem.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BudgetItem.v.company] ON [Catalog.BudgetItem.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.BudgetItem.v] TO jetti;
GO

      
------------------------------ END Catalog.BudgetItem ------------------------------

GO
RAISERROR('Catalog.BudgetItem complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Scenario start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Scenario ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Scenario.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Scenario'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Scenario.v] ON [Catalog.Scenario.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Scenario.v.code.f] ON [Catalog.Scenario.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Scenario.v.description.f] ON [Catalog.Scenario.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Scenario.v.description] ON [Catalog.Scenario.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Scenario.v.code] ON [Catalog.Scenario.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Scenario.v.user] ON [Catalog.Scenario.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Scenario.v.company] ON [Catalog.Scenario.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Scenario.v] TO jetti;
GO

      
------------------------------ END Catalog.Scenario ------------------------------

GO
RAISERROR('Catalog.Scenario complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.ManufactureLocation start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.ManufactureLocation ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.ManufactureLocation.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.ManufactureLocation'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.ManufactureLocation.v] ON [Catalog.ManufactureLocation.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ManufactureLocation.v.code.f] ON [Catalog.ManufactureLocation.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ManufactureLocation.v.description.f] ON [Catalog.ManufactureLocation.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ManufactureLocation.v.description] ON [Catalog.ManufactureLocation.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ManufactureLocation.v.code] ON [Catalog.ManufactureLocation.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ManufactureLocation.v.user] ON [Catalog.ManufactureLocation.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.ManufactureLocation.v.company] ON [Catalog.ManufactureLocation.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.ManufactureLocation.v] TO jetti;
GO

      
------------------------------ END Catalog.ManufactureLocation ------------------------------

GO
RAISERROR('Catalog.ManufactureLocation complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.AcquiringTerminal start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.AcquiringTerminal ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.AcquiringTerminal.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BankAccount"')) [BankAccount]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Counterpartie"')) [Counterpartie]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isDefault"')), 0) [isDefault]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code1"')), '') [Code1]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.AcquiringTerminal'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.AcquiringTerminal.v] ON [Catalog.AcquiringTerminal.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AcquiringTerminal.v.code.f] ON [Catalog.AcquiringTerminal.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AcquiringTerminal.v.description.f] ON [Catalog.AcquiringTerminal.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AcquiringTerminal.v.description] ON [Catalog.AcquiringTerminal.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AcquiringTerminal.v.code] ON [Catalog.AcquiringTerminal.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AcquiringTerminal.v.user] ON [Catalog.AcquiringTerminal.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.AcquiringTerminal.v.company] ON [Catalog.AcquiringTerminal.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.AcquiringTerminal.v] TO jetti;
GO

      
------------------------------ END Catalog.AcquiringTerminal ------------------------------

GO
RAISERROR('Catalog.AcquiringTerminal complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Bank start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Bank ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Bank.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code1"')), '') [Code1]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code2"')), '') [Code2]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Address"')), '') [Address]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."KorrAccount"')), '') [KorrAccount]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ExportRule"')) [ExportRule]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isActive"')), 0) [isActive]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Bank'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Bank.v] ON [Catalog.Bank.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Bank.v.code.f] ON [Catalog.Bank.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Bank.v.description.f] ON [Catalog.Bank.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Bank.v.description] ON [Catalog.Bank.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Bank.v.code] ON [Catalog.Bank.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Bank.v.user] ON [Catalog.Bank.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Bank.v.company] ON [Catalog.Bank.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Bank.v] TO jetti;
GO

      
------------------------------ END Catalog.Bank ------------------------------

GO
RAISERROR('Catalog.Bank complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Person.BankAccount start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Person.BankAccount ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Person.BankAccount.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."owner"')) [owner]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Bank"')) [Bank]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."SalaryProject"')) [SalaryProject]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.OpenDate'),127) [OpenDate]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Person.BankAccount'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Person.BankAccount.v] ON [Catalog.Person.BankAccount.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.BankAccount.v.code.f] ON [Catalog.Person.BankAccount.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.BankAccount.v.description.f] ON [Catalog.Person.BankAccount.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.BankAccount.v.description] ON [Catalog.Person.BankAccount.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.BankAccount.v.code] ON [Catalog.Person.BankAccount.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.BankAccount.v.user] ON [Catalog.Person.BankAccount.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.BankAccount.v.company] ON [Catalog.Person.BankAccount.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Person.BankAccount.v] TO jetti;
GO

      
------------------------------ END Catalog.Person.BankAccount ------------------------------

GO
RAISERROR('Catalog.Person.BankAccount complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Person.Contract start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Person.Contract ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Person.Contract.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."owner"')) [owner]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Status"')), '') [Status]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.StartDate'),127) [StartDate]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.EndDate'),127) [EndDate]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BankAccount"')) [BankAccount]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Person.Contract'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Person.Contract.v] ON [Catalog.Person.Contract.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.Contract.v.code.f] ON [Catalog.Person.Contract.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.Contract.v.description.f] ON [Catalog.Person.Contract.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.Contract.v.description] ON [Catalog.Person.Contract.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.Contract.v.code] ON [Catalog.Person.Contract.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.Contract.v.user] ON [Catalog.Person.Contract.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Person.Contract.v.company] ON [Catalog.Person.Contract.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Person.Contract.v] TO jetti;
GO

      
------------------------------ END Catalog.Person.Contract ------------------------------

GO
RAISERROR('Catalog.Person.Contract complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.BusinessRegion start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.BusinessRegion ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.BusinessRegion.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.BusinessRegion'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.BusinessRegion.v] ON [Catalog.BusinessRegion.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessRegion.v.code.f] ON [Catalog.BusinessRegion.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessRegion.v.description.f] ON [Catalog.BusinessRegion.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessRegion.v.description] ON [Catalog.BusinessRegion.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessRegion.v.code] ON [Catalog.BusinessRegion.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessRegion.v.user] ON [Catalog.BusinessRegion.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.BusinessRegion.v.company] ON [Catalog.BusinessRegion.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.BusinessRegion.v] TO jetti;
GO

      
------------------------------ END Catalog.BusinessRegion ------------------------------

GO
RAISERROR('Catalog.BusinessRegion complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.TaxRate start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.TaxRate ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.TaxRate.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Rate"')), 0) [Rate]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.TaxRate'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.TaxRate.v] ON [Catalog.TaxRate.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxRate.v.code.f] ON [Catalog.TaxRate.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxRate.v.description.f] ON [Catalog.TaxRate.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxRate.v.description] ON [Catalog.TaxRate.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxRate.v.code] ON [Catalog.TaxRate.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxRate.v.user] ON [Catalog.TaxRate.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxRate.v.company] ON [Catalog.TaxRate.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.TaxRate.v] TO jetti;
GO

      
------------------------------ END Catalog.TaxRate ------------------------------

GO
RAISERROR('Catalog.TaxRate complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.TaxAssignmentCode start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.TaxAssignmentCode ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.TaxAssignmentCode.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FullDescription"')), '') [FullDescription]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.TaxAssignmentCode'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.TaxAssignmentCode.v] ON [Catalog.TaxAssignmentCode.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxAssignmentCode.v.code.f] ON [Catalog.TaxAssignmentCode.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxAssignmentCode.v.description.f] ON [Catalog.TaxAssignmentCode.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxAssignmentCode.v.description] ON [Catalog.TaxAssignmentCode.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxAssignmentCode.v.code] ON [Catalog.TaxAssignmentCode.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxAssignmentCode.v.user] ON [Catalog.TaxAssignmentCode.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxAssignmentCode.v.company] ON [Catalog.TaxAssignmentCode.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.TaxAssignmentCode.v] TO jetti;
GO

      
------------------------------ END Catalog.TaxAssignmentCode ------------------------------

GO
RAISERROR('Catalog.TaxAssignmentCode complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.TaxPaymentCode start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.TaxPaymentCode ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.TaxPaymentCode.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FullDescription"')), '') [FullDescription]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BalanceAnalytics"')) [BalanceAnalytics]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.TaxPaymentCode'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.TaxPaymentCode.v] ON [Catalog.TaxPaymentCode.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentCode.v.code.f] ON [Catalog.TaxPaymentCode.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentCode.v.description.f] ON [Catalog.TaxPaymentCode.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentCode.v.description] ON [Catalog.TaxPaymentCode.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentCode.v.code] ON [Catalog.TaxPaymentCode.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentCode.v.user] ON [Catalog.TaxPaymentCode.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentCode.v.company] ON [Catalog.TaxPaymentCode.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.TaxPaymentCode.v] TO jetti;
GO

      
------------------------------ END Catalog.TaxPaymentCode ------------------------------

GO
RAISERROR('Catalog.TaxPaymentCode complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.TaxBasisPayment start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.TaxBasisPayment ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.TaxBasisPayment.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.TaxBasisPayment'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.TaxBasisPayment.v] ON [Catalog.TaxBasisPayment.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxBasisPayment.v.code.f] ON [Catalog.TaxBasisPayment.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxBasisPayment.v.description.f] ON [Catalog.TaxBasisPayment.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxBasisPayment.v.description] ON [Catalog.TaxBasisPayment.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxBasisPayment.v.code] ON [Catalog.TaxBasisPayment.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxBasisPayment.v.user] ON [Catalog.TaxBasisPayment.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxBasisPayment.v.company] ON [Catalog.TaxBasisPayment.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.TaxBasisPayment.v] TO jetti;
GO

      
------------------------------ END Catalog.TaxBasisPayment ------------------------------

GO
RAISERROR('Catalog.TaxBasisPayment complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.TaxPaymentPeriod start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.TaxPaymentPeriod ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.TaxPaymentPeriod.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.TaxPaymentPeriod'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.TaxPaymentPeriod.v] ON [Catalog.TaxPaymentPeriod.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentPeriod.v.code.f] ON [Catalog.TaxPaymentPeriod.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentPeriod.v.description.f] ON [Catalog.TaxPaymentPeriod.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentPeriod.v.description] ON [Catalog.TaxPaymentPeriod.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentPeriod.v.code] ON [Catalog.TaxPaymentPeriod.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentPeriod.v.user] ON [Catalog.TaxPaymentPeriod.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPaymentPeriod.v.company] ON [Catalog.TaxPaymentPeriod.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.TaxPaymentPeriod.v] TO jetti;
GO

      
------------------------------ END Catalog.TaxPaymentPeriod ------------------------------

GO
RAISERROR('Catalog.TaxPaymentPeriod complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.TaxPayerStatus start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.TaxPayerStatus ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.TaxPayerStatus.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FullDescription"')), '') [FullDescription]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.TaxPayerStatus'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.TaxPayerStatus.v] ON [Catalog.TaxPayerStatus.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPayerStatus.v.code.f] ON [Catalog.TaxPayerStatus.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPayerStatus.v.description.f] ON [Catalog.TaxPayerStatus.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPayerStatus.v.description] ON [Catalog.TaxPayerStatus.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPayerStatus.v.code] ON [Catalog.TaxPayerStatus.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPayerStatus.v.user] ON [Catalog.TaxPayerStatus.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxPayerStatus.v.company] ON [Catalog.TaxPayerStatus.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.TaxPayerStatus.v] TO jetti;
GO

      
------------------------------ END Catalog.TaxPayerStatus ------------------------------

GO
RAISERROR('Catalog.TaxPayerStatus complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.TaxOffice start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.TaxOffice ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.TaxOffice.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FullName"')), '') [FullName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code1"')), '') [Code1]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code2"')), '') [Code2]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Code3"')), '') [Code3]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.TaxOffice'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.TaxOffice.v] ON [Catalog.TaxOffice.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxOffice.v.code.f] ON [Catalog.TaxOffice.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxOffice.v.description.f] ON [Catalog.TaxOffice.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxOffice.v.description] ON [Catalog.TaxOffice.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxOffice.v.code] ON [Catalog.TaxOffice.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxOffice.v.user] ON [Catalog.TaxOffice.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.TaxOffice.v.company] ON [Catalog.TaxOffice.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.TaxOffice.v] TO jetti;
GO

      
------------------------------ END Catalog.TaxOffice ------------------------------

GO
RAISERROR('Catalog.TaxOffice complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.RetailClient start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.RetailClient ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.RetailClient.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Gender"')), '') [Gender]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."isActive"')), 0) [isActive]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.CreateDate'),127) [CreateDate]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.Birthday'),127) [Birthday]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FirstName"')), '') [FirstName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."LastName"')), '') [LastName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."MiddleName"')), '') [MiddleName]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Phone"')), '') [Phone]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Address"')), '') [Address]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Email"')), '') [Email]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.RetailClient'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.RetailClient.v] ON [Catalog.RetailClient.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.RetailClient.v.code.f] ON [Catalog.RetailClient.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.RetailClient.v.description.f] ON [Catalog.RetailClient.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.RetailClient.v.description] ON [Catalog.RetailClient.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.RetailClient.v.code] ON [Catalog.RetailClient.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.RetailClient.v.user] ON [Catalog.RetailClient.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.RetailClient.v.company] ON [Catalog.RetailClient.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.RetailClient.v] TO jetti;
GO

      
------------------------------ END Catalog.RetailClient ------------------------------

GO
RAISERROR('Catalog.RetailClient complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.SalaryProject start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.SalaryProject ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.SalaryProject.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."bank"')) [bank]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.OpenDate'),127) [OpenDate]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."BankBranch"')), '') [BankBranch]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."BankBranchOffice"')), '') [BankBranchOffice]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."BankAccount"')), '') [BankAccount]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.SalaryProject'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.SalaryProject.v] ON [Catalog.SalaryProject.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SalaryProject.v.code.f] ON [Catalog.SalaryProject.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SalaryProject.v.description.f] ON [Catalog.SalaryProject.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SalaryProject.v.description] ON [Catalog.SalaryProject.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SalaryProject.v.code] ON [Catalog.SalaryProject.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SalaryProject.v.user] ON [Catalog.SalaryProject.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.SalaryProject.v.company] ON [Catalog.SalaryProject.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.SalaryProject.v] TO jetti;
GO

      
------------------------------ END Catalog.SalaryProject ------------------------------

GO
RAISERROR('Catalog.SalaryProject complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Specification start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Specification ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Specification.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Brand"')) [Brand]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Status"')), '') [Status]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."FullDescription"')), '') [FullDescription]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.StartDate'),127) [StartDate]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.EndDate'),127) [EndDate]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ResponsiblePerson"')) [ResponsiblePerson]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Specification'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Specification.v] ON [Catalog.Specification.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Specification.v.code.f] ON [Catalog.Specification.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Specification.v.description.f] ON [Catalog.Specification.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Specification.v.description] ON [Catalog.Specification.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Specification.v.code] ON [Catalog.Specification.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Specification.v.user] ON [Catalog.Specification.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Specification.v.company] ON [Catalog.Specification.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Specification.v] TO jetti;
GO

      
------------------------------ END Catalog.Specification ------------------------------

GO
RAISERROR('Catalog.Specification complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.InvestorGroup start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.InvestorGroup ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.InvestorGroup.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.InvestorGroup'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.InvestorGroup.v] ON [Catalog.InvestorGroup.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.InvestorGroup.v.code.f] ON [Catalog.InvestorGroup.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.InvestorGroup.v.description.f] ON [Catalog.InvestorGroup.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.InvestorGroup.v.description] ON [Catalog.InvestorGroup.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.InvestorGroup.v.code] ON [Catalog.InvestorGroup.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.InvestorGroup.v.user] ON [Catalog.InvestorGroup.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.InvestorGroup.v.company] ON [Catalog.InvestorGroup.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.InvestorGroup.v] TO jetti;
GO

      
------------------------------ END Catalog.InvestorGroup ------------------------------

GO
RAISERROR('Catalog.InvestorGroup complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Catalog.Employee start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Catalog.Employee ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Catalog.Employee.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Person"')) [Person]
      FROM dbo.[Documents]
      WHERE [type] = N'Catalog.Employee'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Catalog.Employee.v] ON [Catalog.Employee.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Employee.v.code.f] ON [Catalog.Employee.v](parent,isfolder,code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Employee.v.description.f] ON [Catalog.Employee.v](parent,isfolder,description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Employee.v.description] ON [Catalog.Employee.v](description,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Employee.v.code] ON [Catalog.Employee.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Employee.v.user] ON [Catalog.Employee.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Catalog.Employee.v.company] ON [Catalog.Employee.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Catalog.Employee.v] TO jetti;
GO

      
------------------------------ END Catalog.Employee ------------------------------

GO
RAISERROR('Catalog.Employee complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Document.ExchangeRates start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Document.ExchangeRates ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Document.ExchangeRates.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      FROM dbo.[Documents]
      WHERE [type] = N'Document.ExchangeRates'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Document.ExchangeRates.v] ON [Document.ExchangeRates.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Document.ExchangeRates.v.date] ON [Document.ExchangeRates.v](date,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.ExchangeRates.v.parent] ON [Document.ExchangeRates.v](parent,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.ExchangeRates.v.code] ON [Document.ExchangeRates.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.ExchangeRates.v.user] ON [Document.ExchangeRates.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.ExchangeRates.v.company] ON [Document.ExchangeRates.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Document.ExchangeRates.v] TO jetti;
GO

      
------------------------------ END Document.ExchangeRates ------------------------------

GO
RAISERROR('Document.ExchangeRates complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Document.Invoice start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Document.Invoice ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Document.Invoice.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Storehouse"')) [Storehouse]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Customer"')) [Customer]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Manager"')) [Manager]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Status"')), '') [Status]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.PayDay'),127) [PayDay]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Amount"')), 0) [Amount]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Tax"')), 0) [Tax]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      FROM dbo.[Documents]
      WHERE [type] = N'Document.Invoice'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Document.Invoice.v] ON [Document.Invoice.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Document.Invoice.v.date] ON [Document.Invoice.v](date,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Invoice.v.parent] ON [Document.Invoice.v](parent,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Invoice.v.code] ON [Document.Invoice.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Invoice.v.user] ON [Document.Invoice.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Invoice.v.company] ON [Document.Invoice.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Document.Invoice.v] TO jetti;
GO

      
------------------------------ END Document.Invoice ------------------------------

GO
RAISERROR('Document.Invoice complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Document.Operation start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Document.Operation ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Document.Operation.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Group"')) [Group]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Operation"')) [Operation]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Amount"')), 0) [Amount]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."currency"')) [currency]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."f1"')) [f1]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."f2"')) [f2]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."f3"')) [f3]
      FROM dbo.[Documents]
      WHERE [type] = N'Document.Operation'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Document.Operation.v] ON [Document.Operation.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.date] ON [Document.Operation.v](date,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.parent] ON [Document.Operation.v](parent,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.code] ON [Document.Operation.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.user] ON [Document.Operation.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.company] ON [Document.Operation.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Document.Operation.v] TO jetti;
GO

      
------------------------------ END Document.Operation ------------------------------

GO
RAISERROR('Document.Operation complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Document.PriceList start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Document.PriceList ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Document.PriceList.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."PriceType"')) [PriceType]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."TaxInclude"')), 0) [TaxInclude]
      FROM dbo.[Documents]
      WHERE [type] = N'Document.PriceList'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Document.PriceList.v] ON [Document.PriceList.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Document.PriceList.v.date] ON [Document.PriceList.v](date,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.PriceList.v.parent] ON [Document.PriceList.v](parent,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.PriceList.v.code] ON [Document.PriceList.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.PriceList.v.user] ON [Document.PriceList.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.PriceList.v.company] ON [Document.PriceList.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Document.PriceList.v] TO jetti;
GO

      
------------------------------ END Document.PriceList ------------------------------

GO
RAISERROR('Document.PriceList complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Document.Settings start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Document.Settings ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Document.Settings.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."balanceCurrency"')) [balanceCurrency]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."accountingCurrency"')) [accountingCurrency]
      FROM dbo.[Documents]
      WHERE [type] = N'Document.Settings'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Document.Settings.v] ON [Document.Settings.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Document.Settings.v.date] ON [Document.Settings.v](date,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Settings.v.parent] ON [Document.Settings.v](parent,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Settings.v.code] ON [Document.Settings.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Settings.v.user] ON [Document.Settings.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Settings.v.company] ON [Document.Settings.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Document.Settings.v] TO jetti;
GO

      
------------------------------ END Document.Settings ------------------------------

GO
RAISERROR('Document.Settings complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Document.UserSettings start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Document.UserSettings ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Document.UserSettings.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."UserOrGroup"')) [UserOrGroup]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."COMP"')), 0) [COMP]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."DEPT"')), 0) [DEPT]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."STOR"')), 0) [STOR]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."CASH"')), 0) [CASH]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."BANK"')), 0) [BANK]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."GROUP"')), 0) [GROUP]
      FROM dbo.[Documents]
      WHERE [type] = N'Document.UserSettings'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Document.UserSettings.v] ON [Document.UserSettings.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Document.UserSettings.v.date] ON [Document.UserSettings.v](date,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.UserSettings.v.parent] ON [Document.UserSettings.v](parent,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.UserSettings.v.code] ON [Document.UserSettings.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.UserSettings.v.user] ON [Document.UserSettings.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.UserSettings.v.company] ON [Document.UserSettings.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Document.UserSettings.v] TO jetti;
GO

      
------------------------------ END Document.UserSettings ------------------------------

GO
RAISERROR('Document.UserSettings complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Document.WorkFlow start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Document.WorkFlow ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Document.WorkFlow.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Document"')) [Document]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Status"')), '') [Status]
      FROM dbo.[Documents]
      WHERE [type] = N'Document.WorkFlow'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Document.WorkFlow.v] ON [Document.WorkFlow.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Document.WorkFlow.v.date] ON [Document.WorkFlow.v](date,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.WorkFlow.v.parent] ON [Document.WorkFlow.v](parent,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.WorkFlow.v.code] ON [Document.WorkFlow.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.WorkFlow.v.user] ON [Document.WorkFlow.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.WorkFlow.v.company] ON [Document.WorkFlow.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Document.WorkFlow.v] TO jetti;
GO

      
------------------------------ END Document.WorkFlow ------------------------------

GO
RAISERROR('Document.WorkFlow complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Document.CashRequest start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Document.CashRequest ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Document.CashRequest.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Status"')), '') [Status]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Operation"')), '') [Operation]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."PaymentKind"')), '') [PaymentKind]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."EnforcementProceedings"')), '') [EnforcementProceedings]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."CashKind"')), '') [CashKind]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."PayRollKind"')), '') [PayRollKind]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Department"')) [Department]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."CashRecipient"')) [CashRecipient]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Contract"')) [Contract]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ContractIntercompany"')) [ContractIntercompany]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."CashFlow"')) [CashFlow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."SalaryProject"')) [SalaryProject]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."Loan"')) [Loan]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."CashOrBank"')) [CashOrBank]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."CashRecipientBankAccount"')) [CashRecipientBankAccount]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."CashOrBankIn"')) [CashOrBankIn]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.PayDay'),127) [PayDay]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Amount"')), 0) [Amount]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."AmountPenalty"')), 0) [AmountPenalty]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."сurrency"')) [сurrency]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ExpenseOrBalance"')) [ExpenseOrBalance]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."ExpenseAnalytics"')) [ExpenseAnalytics]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."SalaryAnalitics"')) [SalaryAnalitics]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."SKU"')) [SKU]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."TaxRate"')) [TaxRate]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."TaxKPP"')), '') [TaxKPP]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."TaxPaymentCode"')) [TaxPaymentCode]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."TaxAssignmentCode"')) [TaxAssignmentCode]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."TaxPayerStatus"')) [TaxPayerStatus]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."TaxBasisPayment"')) [TaxBasisPayment]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."TaxPaymentPeriod"')) [TaxPaymentPeriod]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."TaxDocNumber"')), '') [TaxDocNumber]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.TaxDocDate'),127) [TaxDocDate]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."TaxOfficeCode2"')), '') [TaxOfficeCode2]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BalanceAnalytics"')) [BalanceAnalytics]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."workflowID"')), '') [workflowID]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."ManualInfo"')), 0) [ManualInfo]
      , ISNULL(TRY_CONVERT(BIT, JSON_VALUE(doc, N'$."BudgetPayment"')), 0) [BudgetPayment]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."RelatedURL"')), '') [RelatedURL]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."tempCompanyParent"')) [tempCompanyParent]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."tempSalaryKind"')), '') [tempSalaryKind]
      FROM dbo.[Documents]
      WHERE [type] = N'Document.CashRequest'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Document.CashRequest.v] ON [Document.CashRequest.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequest.v.date] ON [Document.CashRequest.v](date,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequest.v.parent] ON [Document.CashRequest.v](parent,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequest.v.code] ON [Document.CashRequest.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequest.v.user] ON [Document.CashRequest.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequest.v.company] ON [Document.CashRequest.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Document.CashRequest.v] TO jetti;
GO

      
------------------------------ END Document.CashRequest ------------------------------

GO
RAISERROR('Document.CashRequest complete', 0 ,1) WITH NOWAIT;
GO
RAISERROR('Document.CashRequestRegistry start', 0 ,1) WITH NOWAIT;
GO

------------------------------ BEGIN Document.CashRequestRegistry ------------------------------

        
GO
CREATE OR ALTER VIEW dbo.[Document.CashRequestRegistry.v] WITH SCHEMABINDING AS
      SELECT id, type, date, code, description, posted, deleted, isfolder, timestamp, parent, company, [user], [version]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."workflow"')) [workflow]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Status"')), '') [Status]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."Operation"')), '') [Operation]
      , ISNULL(TRY_CONVERT(NVARCHAR(250), JSON_VALUE(doc, N'$."CashKind"')), '') [CashKind]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."CashFlow"')) [CashFlow]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."BusinessDirection"')) [BusinessDirection]
      , ISNULL(TRY_CONVERT(MONEY, JSON_VALUE(doc, N'$."Amount"')), 0) [Amount]
      , TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(doc, N'$."сurrency"')) [сurrency]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.BankUploadDate'),127) [BankUploadDate]
      , TRY_CONVERT(DATE, JSON_VALUE(doc, N'$.DocumentsCreationDate'),127) [DocumentsCreationDate]
      FROM dbo.[Documents]
      WHERE [type] = N'Document.CashRequestRegistry'
    ;
GO
CREATE UNIQUE CLUSTERED INDEX [Document.CashRequestRegistry.v] ON [Document.CashRequestRegistry.v](id);
      
      
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequestRegistry.v.date] ON [Document.CashRequestRegistry.v](date,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequestRegistry.v.parent] ON [Document.CashRequestRegistry.v](parent,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequestRegistry.v.code] ON [Document.CashRequestRegistry.v](code,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequestRegistry.v.user] ON [Document.CashRequestRegistry.v]([user],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.CashRequestRegistry.v.company] ON [Document.CashRequestRegistry.v](company,id) INCLUDE([date]);
GO
GRANT SELECT ON dbo.[Document.CashRequestRegistry.v] TO jetti;
GO

      
------------------------------ END Document.CashRequestRegistry ------------------------------

GO
RAISERROR('Document.CashRequestRegistry complete', 0 ,1) WITH NOWAIT;
GO

CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.Amount] ON [Document.Operation.v](Amount,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.Group] ON [Document.Operation.v]([Group],id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.Operation] ON [Document.Operation.v](Operation,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.currency] ON [Document.Operation.v](currency,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.f1] ON [Document.Operation.v](f1,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.f2] ON [Document.Operation.v](f2,id) INCLUDE([company]);
CREATE UNIQUE NONCLUSTERED INDEX [Document.Operation.v.f3] ON [Document.Operation.v](f3,id) INCLUDE([company]);
CREATE NONCLUSTERED INDEX [Document.Operation.v.timestamp] ON [Document.Operation.v]([timestamp],[Operation]);
