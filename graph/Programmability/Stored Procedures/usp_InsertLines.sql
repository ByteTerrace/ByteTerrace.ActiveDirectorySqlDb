create procedure [graph].[usp_InsertLines] (
    @lines [graph].[ILine] readonly
)
as
begin;
    set nocount on;
    set xact_abort on;

    insert into [graph].[Lines] (
        [W]
      , [X]
      , [Y]
      , [Z]
    )
    output [inserted].[W]
         , [inserted].[X]
         , [inserted].[Y]
         , [inserted].[Z]
    select a.[W]
         , a.[X]
         , a.[Y]
         , a.[Z]
    from @lines as a
    where not exists (
          select 1
          from [graph].[Lines] as nea
          where (a.[W] = nea.[W])
            and (a.[X] = nea.[X])
            and (a.[Y] = nea.[Y])
            and (a.[Z] = nea.[Z])
      );
end;
