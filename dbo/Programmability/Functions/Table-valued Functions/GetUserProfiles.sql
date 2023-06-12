create function [dbo].[GetUserProfiles] (
    @displayName nvarchar(254) null = null -- [dbo].[EmailAddress] is not allowed here; must specify manually
  , @userId int null = null
)
returns table
with schemabinding
as return (
    select a.[DisplayName]
         , a.[PrimaryEmailAddressIndex]
         , a.[UserId]
    from [dbo].[UserProfiles] as a
    where (isnull(@displayName, a.[DisplayName]) = a.[DisplayName])
      and (isnull(@userId, a.[UserId]) = a.[UserId])
);
