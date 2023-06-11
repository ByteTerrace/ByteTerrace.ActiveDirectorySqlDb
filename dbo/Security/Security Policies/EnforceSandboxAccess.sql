create security policy [dbo].[EnforceSandboxAccess]
add filter predicate [rls].[ValidateObjectAccess](
    0,
    [UserId]
)
on [dbo].[Sandbox]
with (
    schemabinding = on
  , state = on
);
