create table [rls].[RoleAssignments] (
    [RoleId] int not null
  , [UserId] int not null
  , constraint [rls.RoleAssignments_FkUser] foreign key ([UserId]) references [rls].[Users] ([Id])
  , constraint [rls.RoleAssignments_Pk] primary key nonclustered hash ([RoleId], [UserId]) with (bucket_count = 1048576)
) with (
    durability = schema_and_data
  , memory_optimized = on
);
go

deny select on [rls].[RoleAssignments] to public;
