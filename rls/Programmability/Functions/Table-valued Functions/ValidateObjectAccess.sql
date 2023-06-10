create function [rls].[ValidateObjectAccess] (
    @objectId int
)
returns table
with schemabinding
as return (
    select a.[Result]
    from (
        select 1 as [Result]
        from [rls].[Sessions] as a with (snapshot)
        where (@@spid = a.[Spid])
          and not exists (
                  select 1
                  from [rls].[Permissions] as ea
                  where (a.[UserId] = ea.[UserId])
                    and ('SELECT' = ea.[Name])
                    and (@objectId = ea.[MajorId])
                    and ('D' = ea.[State])
              )
          and exists (
                  select 1
                  from [rls].[Permissions] as ea
                  where (a.[UserId] = ea.[UserId])
                    and ('SELECT' = ea.[Name])
                    and (@objectId = ea.[MajorId])
                    and ('G' = ea.[State])
              )
        union all
        select 1 as [Result] -- allow data readers to view all users
        where (Convert(bit, 1) = is_member('db_datareader'))
        union all
        select 1 as [Result] -- allow database owners to view all users
        where (Convert(bit, 1) = is_member('db_owner'))
    ) as a
    where (Convert(bit, 0) = is_member('db_denydatareader')) -- ensure that user isn't blocked from viewing all data
);
