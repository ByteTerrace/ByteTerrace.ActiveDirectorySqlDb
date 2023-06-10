create table [rls].[Users] (
    [Id] int not null
  , [ObjectId] uniqueidentifier not null
  , constraint [rls.Users_Pk] primary key nonclustered ([Id] asc)
  , constraint [rls.Users_UqObjectId] unique nonclustered hash ([ObjectId] asc) with (bucket_count = 131072)
) with (
    durability = schema_and_data
  , memory_optimized = on
);
