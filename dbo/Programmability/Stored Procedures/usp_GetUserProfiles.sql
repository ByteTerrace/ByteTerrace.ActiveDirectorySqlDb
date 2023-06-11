create procedure [dbo].[usp_GetUserProfiles] (
    @displayName [dbo].[EmailAddress] null = null
  , @id int null = null
)
as
begin;
    select a.[DisplayName]
         , a.[UserId]
    from [dbo].[GetUserProfiles] (
        @displayName
      , @id
    ) as a;
end;
go

grant execute on [dbo].[usp_GetUserProfiles] to public;
