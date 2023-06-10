create procedure [rls].[usp_SessionSignIn] (
    @objectId uniqueidentifier
)
as
begin;
    set nocount on;
    set xact_abort on;

    declare @isReadOnly bit = convert(bit, 1);
    declare @key nvarchar(128) = N'object_id';
    declare @value sql_variant = convert(sql_variant, @objectId);

    execute [sys].[sp_set_session_context]
        @key = @key
      , @value = @value
      , @read_only = @isReadOnly;

    delete a
    from [rls].[Sessions] as a
    where (@@spid = a.Spid);

    insert into [rls].[Sessions] ([ObjectId])
    select @objectId;

    insert into [rls].[Users] (
        [Id]
      , [ObjectId]
    )
    select next value for [rls].[UserId]
         , @objectId
    where not exists (
              select 1
              from [rls].[Users] as nea
              where (@objectId = nea.[ObjectId])
          );
end;
