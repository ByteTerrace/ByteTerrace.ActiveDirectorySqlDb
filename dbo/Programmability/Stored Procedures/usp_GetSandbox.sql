create procedure [dbo].[usp_GetSandbox] (
    @id int null = null
)
as
begin;
    select a.[Id]
         , a.[UserId]
    from [dbo].[GetSandbox](@id) as a;
end;
go

grant execute on [dbo].[usp_GetSandbox] to public;
