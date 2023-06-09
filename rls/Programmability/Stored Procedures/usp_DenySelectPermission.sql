﻿create procedure [rls].[usp_DenySelectPermission] (
    @majorId int not null
  , @userId int not null
  , @minorId int null = null
)
with native_compilation
   , schemabinding
as begin atomic with (
    language = N'us_english'
  , transaction isolation level = snapshot
);
    execute [rls].[usp_AddPermission]
        @majorId
      , N'SELECT'
      , 'D'
      , @userId
      , @minorId;
end;
go

deny execute on [rls].[usp_DenySelectPermission] to public;
