create procedure [graph].[usp_InsertPoints] (
    @points [graph].[IPoint] readonly
)
as
begin;
    set nocount on;
    set xact_abort on;

    insert into [graph].[Points] (
        [Hash]
      , [Value]
    )
    output [inserted].[Id]
         , [inserted].[Hash]
         , [inserted].[Value]
    select a.[Hash]
         , a.[Value]
    from @points as a
    where not exists (
          select 1
          from [graph].[Points] as nea
          where (a.[Hash] = nea.[Hash])
      );
end;
