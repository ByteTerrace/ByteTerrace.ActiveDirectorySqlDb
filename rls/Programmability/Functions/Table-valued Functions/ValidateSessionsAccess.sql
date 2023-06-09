﻿create function [rls].[ValidateSessionsAccess] (
    @spid smallint
)
returns table
with native_compilation
   , schemabinding
as return (
    select a.[Value]
    from (
        select 1 -- allow users to view their own session
        where (@@spid = @spid)
        union all
        select 1 -- allow data readers to view all records
        where (convert(bit, 1) = is_member(N'db_datareader'))
        union all
        select 1 -- allow database owners to view all records
        where (convert(bit, 1) = is_member(N'db_owner'))
    ) as a ([Value])
    where (convert(bit, 0) = is_member(N'db_denydatareader')) -- ensure that user isn't denied access to all records
);
