create procedure [rls].[usp_SessionSignIn] (
    @objectId varchar(36)
)
as
begin;
    set nocount on;
    set xact_abort on;

    execute [sys].[sp_set_session_context]
        @key = N'object_id'
      , @value = @objectId
      , @read_only = 1;

    delete a
    from [rls].[Sessions] as a
    where (@@spid = a.Spid);

    insert into [rls].[Sessions] ([ObjectId])
    select @objectId;
end;
