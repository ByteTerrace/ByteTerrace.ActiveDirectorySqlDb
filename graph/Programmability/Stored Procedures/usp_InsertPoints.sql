create procedure [graph].[usp_InsertPoints] (
    @points [graph].[IPoint] readonly
)
as
begin;
    declare @lines [graph].[ILine];

    insert into [graph].[Points] (
        [Hash]
      , [Value]
    )
    output [inserted].[Id]
         , [inserted].[Id]
         , [inserted].[Id]
         , [inserted].[Id]
    into @lines
    select b.[Hash]
         , a.[Value]
    from @points as a
    cross apply (values(isnull(a.[Hash], convert(binary(32), hashbytes(N'SHA2_256', a.[Value]))))) as b ([Hash])
    where not exists (
          select 1
          from [graph].[Points] as nea
          where (b.[Hash] = nea.[Hash])
      );

    execute [graph].[usp_InsertLines] @lines;
end;
