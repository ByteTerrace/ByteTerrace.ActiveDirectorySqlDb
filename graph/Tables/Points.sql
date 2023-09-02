create table [graph].[Points] (
    [Id] [graph].[Identity] identity (1, 1)
  , [Hash] binary(32) not null
  , [Value] nvarchar(max) not null
  , constraint [graph.Points_CkHash] check ([Hash] = hashbytes(N'SHA2_256', [Value]))
  , constraint [graph.Points_Pk] primary key clustered ([Id] asc)
  , constraint [graph.Points_UqHash] unique nonclustered ([Hash] asc)
);
