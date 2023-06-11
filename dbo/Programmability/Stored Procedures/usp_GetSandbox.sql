create procedure [dbo].[usp_GetSandbox]
as
begin;
    select a.[Id]
         , a.[UserId]
    from [dbo].[GetSandbox]() as a;
end;
