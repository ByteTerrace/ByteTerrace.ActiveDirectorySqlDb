create type [graph].[ILine] as table (
    [W] [graph].[Identity]
  , [X] [graph].[Identity]
  , [Y] [graph].[Identity]
  , [Z] [graph].[Identity]
  , primary key clustered ([W] asc, [X] asc, [Y] asc, [Z] asc)
);
