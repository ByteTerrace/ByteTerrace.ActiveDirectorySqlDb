create table [rls].[Users] (
    [Id] int not null identity(1, 1)
  , [ObjectId] uniqueidentifier not null
  , constraint [rls.Users_Pk] primary key nonclustered hash ([Id] asc) with (bucket_count = 131072)
  , constraint [rls.Users_UqObjectId] unique nonclustered ([ObjectId] asc)
) with (
    durability = schema_and_data
  , memory_optimized = on
);
