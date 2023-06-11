create security policy [dbo].[EnforceUserProfilesAccess]
add filter predicate [rls].[ValidateObjectAccess] (
    object_id(N'[dbo].[UserProfiles]'),
    [UserId]
)
on [dbo].[UserProfiles]
with (
    schemabinding = on
  , state = on
);
