create table [graph].[Lines] (
    [W] bigint not null
  , [X] bigint not null
  , [Y] bigint not null
  , [Z] bigint not null
  , constraint [graph.Lines_Pk] primary key clustered ([W] asc, [X] asc, [Y] asc, [Z] asc) with (data_compression = page)
);
