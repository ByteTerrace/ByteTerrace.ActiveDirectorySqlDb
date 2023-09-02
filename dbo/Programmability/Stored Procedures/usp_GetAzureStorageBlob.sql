create procedure [dbo].[usp_GetAzureStorageBlob] (
    @response nvarchar(max) output
  , @url nvarchar(4000)
  , @credential sysname = default
)
as
begin;
    declare @headers nvarchar(max) = json_object(
        N'x-ms-date': format(sysutcdatetime(), N'R')
      , N'x-ms-version': '2023-08-03'
    );

    execute [sys].[sp_invoke_external_rest_endpoint]
        @credential = @credential
      , @headers = @headers
      , @method = N'GET'
      , @response = @response output
      , @url = @url;
end;
go

grant execute on [dbo].[usp_GetAzureStorageBlob] to public;
