create table [dbo].[UserProfiles] (
    [DisplayName] [dbo].[EmailAddress] not null
  , [UserId] int not null
  , constraint [dbo.UserProfiles_FkUser] foreign key ([UserId]) references [rls].[Users] ([Id])
  , constraint [dbo.UserProfiles_Pk] primary key clustered ([UserId] asc) with (data_compression = page)
);
go

deny select on [dbo].[UserProfiles] to public;
go
grant view definition on [dbo].[UserProfiles] to public;
