create function [graph].[GetPoints] (
    @id bigint
  , @value nvarchar(max)
)
returns table
with schemabinding
as return (
    select a.[Id]
         , a.[Hash]
         , a.[Value]
    from [graph].[Points] as a
    where (isnull(@id, a.[Id]) = a.[Id])
      and (isnull(hashbytes(N'SHA_256', @value), a.[Hash]) = a.[Hash])
);
