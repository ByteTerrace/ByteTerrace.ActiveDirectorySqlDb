create function [rls].[ValidateObjectAccess] (
    @objectId int
  , @userId int
)
returns table
with native_compilation
   , schemabinding
as return (
    select a.[Value]
    from (
        select 1 -- allow users to view their own records
        where exists (
            select 1
            from [rls].[Sessions] as ea
            where (@@spid = ea.[Spid])
              and (@userId = ea.[UserId])
        )
        union all
        select 1 -- allow users with a SELECT grant to view all records
        where exists (
              select 1
              from [rls].[Sessions] as ea
              where exists (
                    select 1
                    from [rls].[Permissions] as eaa
                    where (@objectId = eaa.[MajorId])
                      and (0 = eaa.[MinorId])
                      and ('SELECT' = eaa.[Name])
                      and ('G' = eaa.[State])
                      and (ea.[UserId] = eaa.[UserId])
                )
          )
        union all
        select 1 -- allow data readers to view all records
        where (Convert(bit, 1) = is_member('db_datareader'))
        union all
        select 1 -- allow database owners to view all records
        where (Convert(bit, 1) = is_member('db_owner'))
    ) as a ([Value])
    where (Convert(bit, 0) = is_member('db_denydatareader')) -- ensure that user isn't denied access to all records
      and not exists (
          select 1
          from [rls].[Sessions] as ea
          where exists (
                select 1
                from [rls].[Permissions] as eaa
                where (@objectId = eaa.[MajorId])
                  and (0 = eaa.[MinorId])
                  and ('SELECT' = eaa.[Name])
                  and ('D' = eaa.[State])
                  and (ea.[UserId] = eaa.[UserId])
            )
      )
);
