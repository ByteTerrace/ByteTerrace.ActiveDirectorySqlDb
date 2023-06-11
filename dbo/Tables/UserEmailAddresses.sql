create table [dbo].[UserEmailAddresses] (
    [UserId] int not null
  , [Value] [dbo].[EmailAddress] not null
  , constraint [dbo.UserEmailAddresses_FkUser] foreign key ([UserId]) references [dbo].[UserProfiles] ([UserId])
  , constraint [dbo.UserEmailAddresses_Pk] primary key clustered ([UserId] asc, [Value] asc) with (data_compression = page)
);
go

deny select on [dbo].[UserEmailAddresses] to public;
