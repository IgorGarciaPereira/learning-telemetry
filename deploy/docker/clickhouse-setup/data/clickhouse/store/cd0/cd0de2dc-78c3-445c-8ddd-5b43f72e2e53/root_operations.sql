ATTACH MATERIALIZED VIEW _ UUID '95587ad6-9de5-4a2e-b75d-c18a619b0cc7' TO signoz_traces.top_level_operations
(
    `name` LowCardinality(String),
    `serviceName` LowCardinality(String)
) AS
SELECT DISTINCT
    name,
    serviceName
FROM signoz_traces.signoz_index_v2
WHERE parentSpanID = ''
