create function [dbo].[GetUserProfiles] (
    @displayName nvarchar(254) null = null -- [dbo].[EmailAddress] is not allowed here; must specify manually
  , @userId int null = null
)
returns table
with schemabinding
as return (
    select a.[DisplayName]
         , a.[UserId]
    from [dbo].[UserProfiles] as a
    where (IsNull(@displayName, a.[DisplayName]) = a.[DisplayName])
      and (IsNull(@userId, a.[UserId]) = a.[UserId])
);
