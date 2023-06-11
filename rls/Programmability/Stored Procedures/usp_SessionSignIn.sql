create procedure [rls].[usp_SessionSignIn] (
    @objectId uniqueidentifier not null
)
with native_compilation
   , schemabinding
as begin atomic with (
    language = N'us_english'
  , transaction isolation level = snapshot
)
    insert into [rls].[Users] ([ObjectId])
    select @objectId
    where not exists (
          select 1
          from [rls].[Users] as nea
          where (@objectId = nea.[ObjectId])
      );

    delete
    from [rls].[Sessions]
    where (@@spid = [Spid]);

    insert into [rls].[Sessions] ([UserId])
    select a.[Id]
    from [rls].[Users] as a
    where (@objectId = a.[ObjectId]);
end;
