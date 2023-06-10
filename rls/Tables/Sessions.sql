create table [rls].[Sessions] (
    [ObjectId] uniqueidentifier not null
  , [Spid] smallint not null constraint [rls.Sessions_DftSpid] default (@@spid)
  , constraint [rls.Sessions_CkSpid] check (@@spid = [Spid])
  , constraint [rls.Sessions_Pk] primary key nonclustered hash ([Spid]) with (bucket_count = 131072)
) with (
    durability = schema_only
  , memory_optimized = on
);
