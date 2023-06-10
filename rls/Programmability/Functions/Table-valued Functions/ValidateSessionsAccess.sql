create function [rls].[ValidateSessionsAccess] (
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
        select 1 -- allow data readers to view all sessions
        where (Convert(bit, 1) = is_member('db_datareader'))
        union all
        select 1 -- allow database owners to view all sessions
        where (Convert(bit, 1) = is_member('db_owner'))
    ) as a ([Value])
    where (Convert(bit, 0) = is_member('db_denydatareader')) -- ensure that user isn't blocked from viewing all data
);
