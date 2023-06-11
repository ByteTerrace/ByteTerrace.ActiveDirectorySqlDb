create function [rls].[ValidateUsersAccess] (
    @id int
)
returns table
with native_compilation
   , schemabinding
as return (
    select a.[Value]
    from (
        select 1 -- allow users to view themselves
        from [rls].[Sessions] as a
        where (@@spid = a.[Spid])
          and (@id = a.[UserId])
        union all
        select 1 -- allow data readers to view all records
        where (Convert(bit, 1) = is_member(N'db_datareader'))
        union all
        select 1 -- allow database owners to view all records
        where (Convert(bit, 1) = is_member(N'db_owner'))
    ) as a ([Value])
    where (Convert(bit, 0) = is_member(N'db_denydatareader')) -- ensure that user isn't denied access to all records
);
