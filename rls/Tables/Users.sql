create table [rls].[Users] (
    [Id] int not null constraint [rls.Users_DfId] default (next value for [rls].[UserId])
  , [ObjectId] uniqueidentifier not null
  , constraint [rls.Users_Pk] primary key clustered ([Id] asc) with (data_compression = page)
  , constraint [rls.Users_UqObjectId] unique nonclustered ([ObjectId] asc) with (data_compression = page)
);
