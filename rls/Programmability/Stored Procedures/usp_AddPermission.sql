create procedure [rls].[usp_AddPermission] (
    @majorId int not null
  , @minorId int null
  , @name sysname not null
  , @state char(1) not null
  , @userId int not null
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
