create table [rls].[Permissions] (
    [MajorId] int not null
  , [MinorId] int not null
  , [Name] sysname not null
  , [State] char(1) not null
  , [UserId] int not null
  , constraint [rls.Permissions_FkUser] foreign key ([UserId]) references [rls].[Users] ([Id])
  , constraint [rls.Permissions_Pk] primary key nonclustered hash ([MajorId], [MinorId], [Name], [State], [UserId]) with (bucket_count = 16777216)
) with (
    durability = schema_and_data
  , memory_optimized = on
);
