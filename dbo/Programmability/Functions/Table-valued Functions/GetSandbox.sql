create function [dbo].[GetSandbox](
    @id int
)
returns table
with schemabinding
as return (
    select a.[Id]
         , a.[UserId]
    from [dbo].[Sandbox] as a
    where (IsNull(@id, a.[Id]) = a.[Id])
);
