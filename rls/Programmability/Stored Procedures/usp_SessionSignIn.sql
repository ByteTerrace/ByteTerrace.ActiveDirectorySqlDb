create procedure [rls].[usp_SessionSignIn] (
    @objectId uniqueidentifier
)
as
begin;
    set nocount on;
    set xact_abort on;

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

    delete a
    from [rls].[Sessions] as a
    where (@@spid = a.Spid);

    insert into [rls].[Sessions] ([UserId])
    select a.[Id]
    from [rls].[Users] as a where (@objectId = a.[ObjectId]);;
end;
