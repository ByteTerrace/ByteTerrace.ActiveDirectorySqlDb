﻿create table [rls].[Permissions] (
    [MajorId] int not null
  , [MinorId] int not null constraint [rls.Permissions_DfMinorId] default (0)
  , [Name] sysname not null
  , [State] char(1) not null
  , [UserId] int not null
  , constraint [rls.Permissions_Pk] primary key nonclustered hash ([MajorId], [MinorId], [Name], [State], [UserId]) with (bucket_count = 16777216)
) with (
    durability = schema_and_data
  , memory_optimized = on
);
go

deny select on [rls].[Permissions] to public;
