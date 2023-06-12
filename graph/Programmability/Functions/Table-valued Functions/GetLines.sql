create function [graph].[GetLines] (
    @w bigint
  , @x bigint
  , @y bigint
  , @z bigint
)
returns table
with schemabinding
as return (
    select a.[W]
         , a.[X]
         , a.[Y]
         , a.[Z]
    from [graph].[Lines] as a
    where (isnull(@w, a.[X]) = a.[X])
      and (isnull(@x, a.[X]) = a.[X])
      and (isnull(@y, a.[Y]) = a.[Y])
      and (isnull(@z, a.[Z]) = a.[Z])
);
