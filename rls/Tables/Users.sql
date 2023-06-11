create table [rls].[Users] (
    [Id] [dbo].[Identifier] identity(1, 1)
  , [ObjectId] uniqueidentifier not null
  , constraint [rls.Users_Pk] primary key clustered ([Id] asc) with (data_compression = page)
  , constraint [rls.Users_UqObjectId] unique nonclustered ([ObjectId] asc) with (data_compression = page)
);
go

deny select on [rls].[Users] to public;
