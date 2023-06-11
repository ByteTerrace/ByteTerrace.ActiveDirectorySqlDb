create procedure [rls].[usp_AddPermission] (
    @majorId int not null
  , @name sysname not null
  , @state char(1) not null
  , @userId int not null
  , @minorId int null = null
)
with native_compilation
   , schemabinding
as begin atomic with (
    language = N'us_english'
  , transaction isolation level = snapshot
)
    insert into [rls].[Permissions] (
        [MajorId]
      , [MinorId]
      , [Name]
      , [State]
      , [UserId]
    )
    select @majorId
         , IsNull(@minorId, 0)
         , @name
         , @state
         , @userId;
end;
go

deny execute on [rls].[usp_AddPermission] to public;
