create procedure [dbo].[usp_PutAzureStorageBlob] (
    @payload nvarchar(max)
  , @response nvarchar(max) output
  , @url nvarchar(4000)
  , @credential sysname = default
)
as
begin;
    declare @headers nvarchar(max) = json_object(
        N'x-ms-blob-type': N'BlockBlob'
      , N'x-ms-content-length': len(@payload)
      , N'x-ms-date': format(sysutcdatetime(), N'R')
      , N'x-ms-type': N'file'
      , N'x-ms-version': '2023-08-03'
    );

    execute [sys].[sp_invoke_external_rest_endpoint]
        @credential = @credential
      , @headers = @headers
      , @method = N'PUT'
      , @payload = @payload
      , @response = @response output
      , @url = @url;
end;
go

grant execute on [dbo].[usp_PutAzureStorageBlob] to public;
