create table [dbo].[UserEmailAddresses] (
    [Id] [dbo].[Identifier] identity(1, 1)
  , [UserId] [dbo].[Identifier]
  , [Value] [dbo].[EmailAddress]
  , constraint [dbo.UserEmailAddresses_FkUser] foreign key ([UserId]) references [dbo].[UserProfiles] ([UserId])
  , constraint [dbo.UserEmailAddresses_Pk] primary key clustered ([Id] asc) with (data_compression = page)
  , constraint [dbo.UserEmailAddresses_UqUserEmailAddress] unique nonclustered ([UserId] asc, [Value] asc) with (data_compression = page)
);
go

deny select on [dbo].[UserEmailAddresses] to public;
