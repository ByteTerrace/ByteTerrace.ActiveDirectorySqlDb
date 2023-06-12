create type [graph].[ILine] as table (
    [W] bigint not null
  , [X] bigint not null
  , [Y] bigint not null
  , [Z] bigint not null
  , primary key clustered ([W] asc, [X] asc, [Y] asc, [Z] asc)
);
