create procedure [rls].[usp_RemoveRoleMember] (
    @roleName sysname
  , @userId int
)
as
begin;
    set nocount on;
    set xact_abort on;

    delete a
    from [rls].[RoleAssignments] as a
    join [sys].[database_principals] as b
        on a.[RoleId] = b.[principal_id]
    where (@userId = a.[UserId])
      and (@roleName = b.[name])
      and ('R' = b.[type])
end;
