create type [graph].[IPoint] as table (
    [Hash] binary(32) null
  , [Value] nvarchar(max) not null
);
