create procedure [rls].[usp_AddRoleMember] (
    @roleName sysname
  , @userId int
)
as
begin;
    set nocount on;
    set xact_abort on;

    insert into [rls].[RoleAssignments] (
        [RoleId]
      , [UserId]
    )
    select a.[principal_id]
         , @userId
    from [sys].[database_principals] as a
    where (@roleName = a.[name])
      and ('R' = a.[type])
      and not exists (
              select 1
              from [rls].[RoleAssignments] as nea
              where (a.[principal_id] = nea.[RoleId])
                and (@userId = nea.[UserId])
          );
end;
