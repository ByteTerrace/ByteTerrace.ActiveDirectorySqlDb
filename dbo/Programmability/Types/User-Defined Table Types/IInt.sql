create type [dbo].[IInt] as table (
    [Value] int not null primary key nonclustered ([Value])
) with (memory_optimized = on);
