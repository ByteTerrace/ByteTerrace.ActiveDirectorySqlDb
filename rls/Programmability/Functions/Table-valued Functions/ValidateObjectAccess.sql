create function [rls].[ValidateObjectAccess] (
    @objectId int
  , @userId int
)
returns table
with native_compilation
   , schemabinding
as return (
    select 1 as [Value]
    from [rls].[Sessions] as ea
    where (@@spid = ea.[Spid])
      and exists (
          select 1 -- allow users access to their own records
          where (@userId = ea.[UserId])
          union all
          select 1 -- allow users with a SELECT grant to access ALL records
          where exists (
                select 1
                from [rls].[Permissions] as eaa
                where (@objectId = eaa.[MajorId])
                  and (0 = eaa.[MinorId])
                  and (N'SELECT' = eaa.[Name])
                  and ('G' = eaa.[State])
                  and (ea.[UserId] = eaa.[UserId])
            )
         union all
         select 1 -- allow users who are members of db_datareader to access ALL records
         where (convert(bit, 1) = is_member(N'db_datareader'))
         union all
         select 1 -- allow users who are members of db_owner to access ALL records
         where (convert(bit, 1) = is_member(N'db_owner'))
      )
      and (convert(bit, 0) = is_member(N'db_denydatareader')) -- block users who are members of db_denydatareader from accessing ALL records
      and not exists ( -- block users with a SELECT deny from accessing ALL records
          select 1
          from [rls].[Permissions] as eaa
          where (@objectId = eaa.[MajorId])
            and (0 = eaa.[MinorId])
            and (N'SELECT' = eaa.[Name])
            and ('D' = eaa.[State])
            and (ea.[UserId] = eaa.[UserId])
      )
);
