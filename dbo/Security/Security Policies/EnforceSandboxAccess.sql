create security policy [dbo].[EnforceSandboxAccess]
add filter predicate [rls].[ValidateObjectAccess](object_id(N'[dbo].[Sandbox]'))
on [dbo].[Sandbox]
with (
    schemabinding = on
  , state = on
);
