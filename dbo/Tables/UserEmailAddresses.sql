create table [dbo].[UserEmailAddresses] (
    [Index] smallint not null
  , [UserId] [dbo].[Identifier]
  , [Value] [dbo].[EmailAddress]
  , constraint [dbo.UserEmailAddresses_CkIndex] check ((-1 < [Index]) and (16 > [Index]))
  , constraint [dbo.UserEmailAddresses_FkUser] foreign key ([UserId]) references [dbo].[UserProfiles] ([UserId])
  , constraint [dbo.UserEmailAddresses_Pk] primary key clustered ([UserId] asc, [Index] asc) with (data_compression = page)
  , constraint [dbo.UserEmailAddresses_UqUserEmailAddress] unique nonclustered ([UserId] asc, [Value] asc) with (data_compression = page)
);
go

deny select on [dbo].[UserEmailAddresses] to public;
