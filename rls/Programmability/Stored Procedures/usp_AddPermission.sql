create procedure [rls].[usp_AddPermission] (
    @majorId int
  , @minorId int
  , @name sysname
  , @state char(1)
  , @userId int
)
as
begin;
    set nocount on;
    set xact_abort on;

    insert into [rls].[Permissions] (
        [MajorId]
      , [MinorId]
      , [Name]
      , [State]
      , [UserId]
    )
    select @majorId
         , @minorId
         , @name
         , @state
         , @userId;
end;
