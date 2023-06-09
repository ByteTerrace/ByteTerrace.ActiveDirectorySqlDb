create procedure [rls].[usp_SessionSignIn] (
    @objectId varchar(36)
)
as
begin;
    set nocount on;
    set xact_abort on;

    execute [sys].[sp_set_session_context]
        @key = N'object_id'
      , @read_only = 1
      , @value = @objectId
end;
