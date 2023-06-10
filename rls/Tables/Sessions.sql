create table [rls].[Sessions] (
    [Spid] smallint not null constraint [rls.Sessions_DftSpid] default (@@spid)
  , [ObjectId] varchar(36) not null
  , constraint [rls.Sessions_ChkSpid] check (@@spid = [Spid])
  , constraint [rls.Sessions_Pk] primary key nonclustered hash ([Spid]) with (bucket_count = 131072)
) with (
    durability = schema_only
  , memory_optimized = on
);
