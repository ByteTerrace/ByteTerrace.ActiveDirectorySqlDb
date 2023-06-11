create table [rls].[Sessions] (
    [Spid] smallint not null constraint [rls.Sessions_DftSpid] default (@@spid)
  , [UserId] int not null
  , constraint [rls.Sessions_CkSpid] check (@@spid = [Spid])
  , constraint [rls.Sessions_FkUser] foreign key ([UserId]) references [rls].[Users]([Id])
  , constraint [rls.Sessions_Pk] primary key nonclustered hash ([Spid]) with (bucket_count = 131072)
) with (
    durability = schema_only
  , memory_optimized = on
);
go

deny select on [rls].[Sessions] to public;
