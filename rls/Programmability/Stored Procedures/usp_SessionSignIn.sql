create procedure [rls].[usp_SessionSignIn] (
    @objectId uniqueidentifier
)
as begin;
    declare @ids [dbo].[IInt];

    insert into @ids ([Value])
    select a.[Id]
    from [rls].[Users] as a
    where (@objectId = a.[ObjectId]);

    insert into [rls].[Users] ([ObjectId])
    output [inserted].[Id]
    into @ids
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
    select a.[Value]
    from @ids as a;
end;
go

grant execute on [rls].[usp_SessionSignIn] to public;
