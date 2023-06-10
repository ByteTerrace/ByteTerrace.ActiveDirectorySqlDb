create procedure [rls].[usp_GrantSelectPermission] (
    @majorId int not null
  , @minorId int null
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
         , N'SELECT'
         , 'G'
         , @userId;
end;
