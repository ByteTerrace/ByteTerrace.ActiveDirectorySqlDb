create procedure [graph].[usp_InsertLines] (
    @lines [graph].[ILine] readonly
)
as
begin;
    insert into [graph].[Lines] (
        [W]
      , [X]
      , [Y]
      , [Z]
    )
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
