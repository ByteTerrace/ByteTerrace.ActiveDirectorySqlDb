create function [dbo].[GetSandbox]()
returns table
with schemabinding
as return (
    select a.[Id]
         , a.[UserId]
    from [dbo].[Sandbox] as a
);
