create table [dbo].[UserImages] (
    [Id] [dbo].[Identifier] identity(1, 1)
  , [UserId] [dbo].[Identifier]
  , [Value] [dbo].[ImageData]
  , constraint [dbo.UserImages_CkValue] check (4194305 > datalength([Value])) -- this limit is semi-arbitrarily set to 4 megabytes; which is equivalent to a raw 2 megapixel photo with a bit depth of 16
  , constraint [dbo.UserImages_FkUser] foreign key ([UserId]) references [dbo].[UserProfiles] ([UserId])
  , constraint [dbo.UserImages_Pk] primary key clustered ([Id] asc) with (data_compression = page)
);
go

deny select on [dbo].[UserImages] to public;
