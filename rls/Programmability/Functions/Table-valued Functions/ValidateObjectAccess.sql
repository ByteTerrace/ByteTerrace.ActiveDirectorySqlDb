create function [rls].[ValidateObjectAccess] (
    @objectId int
)
returns table
with native_compilation
   , schemabinding
as return (
    select a.[Value]
    from (
        select 1
        from [rls].[Sessions] as a
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
        select 1 -- allow data readers to view all users
        where (Convert(bit, 1) = is_member('db_datareader'))
        union all
        select 1 -- allow database owners to view all users
        where (Convert(bit, 1) = is_member('db_owner'))
    ) as a ([Value])
    where (Convert(bit, 0) = is_member('db_denydatareader')) -- ensure that user isn't blocked from viewing all data
);
