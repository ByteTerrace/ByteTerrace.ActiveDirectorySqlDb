create function [dbo].[GetUserEmailAddresses] (
    @userId int null = null
  , @value nvarchar(254) null = null -- [dbo].[EmailAddress] is not allowed here; must specify manually
)
returns table
with schemabinding
as return (
    select a.[UserId]
         , a.[Value]
    from [dbo].[UserEmailAddresses] as a
    where (isnull(@userId, a.[UserId]) = a.[UserId])
      and (isnull(@value, a.[Value]) = a.[Value])
      and exists (
          select 1
          from [dbo].[UserProfiles] as ea
          where (a.[UserId] = ea.[UserId])
      )
);
