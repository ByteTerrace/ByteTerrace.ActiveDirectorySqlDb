create table [rls].[Roles] (
    [Id] int not null
  , [Name] nvarchar(128) not null
  , constraint [rls.Roles_Pk] primary key clustered ([Id] asc) with (data_compression = page)
  , constraint [rls.Roles_UqName] unique nonclustered ([Name] asc) with (data_compression = page)
);
