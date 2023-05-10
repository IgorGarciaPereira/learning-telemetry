ATTACH MATERIALIZED VIEW _ UUID '6f09629f-47ca-4357-8195-b82acce7b6a7' TO signoz_traces.usage_explorer
(
    `timestamp` DateTime,
    `service_name` LowCardinality(String),
    `count` UInt64
) AS
SELECT
    toStartOfHour(timestamp) AS timestamp,
    serviceName AS service_name,
    count() AS count
FROM signoz_traces.signoz_index_v2
GROUP BY
    timestamp,
    serviceName
