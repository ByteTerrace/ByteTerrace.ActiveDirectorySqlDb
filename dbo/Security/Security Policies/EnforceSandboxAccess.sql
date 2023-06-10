create security policy [dbo].[EnforceSandboxAccess]
add filter predicate [rls].[ValidateObjectAccess](
    object_id(N'[dbo].[Sandbox]'),
    [UserId]
)
on [dbo].[Sandbox]
with (
    schemabinding = on
  , state = on
);
