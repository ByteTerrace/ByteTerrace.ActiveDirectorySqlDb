create function [rls].[ValidateSessionsAccess] (
    @spid smallint
)
returns table
with native_compilation
   , schemabinding
as return (
    select 1 as [Result]
    where (@@spid = @spid)
);
