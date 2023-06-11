create procedure [dbo].[usp_GetUserEmailAddresses] (
    @userId int null = null
  , @value [dbo].[EmailAddress] null = null
)
as
begin;
    select a.[UserId]
         , a.[Value]
    from [dbo].[GetUserEmailAddresses] (
        @userId
      , @value
    ) as a;
end;
go

grant execute on [dbo].[usp_GetUserEmailAddresses] to public;
