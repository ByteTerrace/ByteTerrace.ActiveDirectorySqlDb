create security policy [rls].[EnforceSessionsAccess]
add filter predicate [rls].[ValidateSessionsAccess] ([Spid])
on [rls].[Sessions]
with (
    schemabinding = on
  , state = on
);
