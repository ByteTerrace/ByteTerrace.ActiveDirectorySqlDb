create security policy [rls].[EnforceUsersAccess]
add filter predicate [rls].[ValidateUsersAccess]([ObjectId])
on [rls].[Users]
with (
    schemabinding = on
  , state = on
);
