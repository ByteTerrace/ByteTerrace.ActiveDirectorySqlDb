create table [dbo].[UserProfiles] (
    [DisplayName] [dbo].[EmailAddress]
  , [PrimaryEmailAddressId] [dbo].[Identifier]
  , [UserId] [dbo].[Identifier]
  , constraint [dbo.UserProfiles_FkPrimaryEmailAddress] foreign key ([PrimaryEmailAddressId]) references [dbo].[UserEmailAddresses] ([Id])
  , constraint [dbo.UserProfiles_FkUser] foreign key ([UserId]) references [rls].[Users] ([Id])
  , constraint [dbo.UserProfiles_Pk] primary key clustered ([UserId] asc) with (data_compression = page)
);
go

deny select on [dbo].[UserProfiles] to public;
go
grant view definition on [dbo].[UserProfiles] to public;
