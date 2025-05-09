-- Por quantidade de linhas
SELECT top 10
     Tabela = t.name
    ,Linhas = SUM(p.row_count) 
FROM sys.tables AS t
JOIN sys.indexes AS i ON t.object_id = i.object_id
JOIN sys.dm_db_partition_stats AS p ON i.object_id = p.object_id AND i.index_id = p.index_id
WHERE t.is_ms_shipped = 0 -- Ignorando tabelas de sistema
  AND i.type <= 1 
GROUP BY t.name
ORDER BY Linhas ASC