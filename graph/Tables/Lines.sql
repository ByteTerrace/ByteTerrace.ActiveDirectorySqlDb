create table [graph].[Lines] (
    [W] [graph].[Identity]
  , [X] [graph].[Identity]
  , [Y] [graph].[Identity]
  , [Z] [graph].[Identity]
  , constraint [graph.Lines_Pk] primary key clustered ([W] asc, [X] asc, [Y] asc, [Z] asc) with (data_compression = page)
);
