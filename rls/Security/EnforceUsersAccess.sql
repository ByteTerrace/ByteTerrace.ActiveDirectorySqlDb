create security policy [rls].[EnforceUsersAccess]
add filter predicate [rls].[ValidateUsersAccess]([Id])
on [rls].[Users]
with (
    schemabinding = on
  , state = on
);
