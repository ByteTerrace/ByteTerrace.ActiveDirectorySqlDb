create function [rls].[ValidateUsersAccess] (
    @id uniqueidentifier
)
returns table
with native_compilation
   , schemabinding
as return (
    select 1 as [Result]
    from [rls].[Sessions] as a
    where (@id = a.[ObjectId])
);
