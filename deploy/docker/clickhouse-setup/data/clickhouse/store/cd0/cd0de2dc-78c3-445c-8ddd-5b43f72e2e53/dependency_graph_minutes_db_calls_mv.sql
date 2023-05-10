ATTACH MATERIALIZED VIEW _ UUID 'c948b841-89a9-4d0a-9f26-6af931e5a4be' TO signoz_traces.dependency_graph_minutes
(
    `src` LowCardinality(String),
    `dest` String,
    `duration_quantiles_state` AggregateFunction(quantiles(0.5, 0.75, 0.9, 0.95, 0.99), Float64),
    `error_count` UInt64,
    `total_count` UInt64,
    `timestamp` DateTime
) AS
SELECT
    serviceName AS src,
    tagMap['db.system'] AS dest,
    quantilesState(0.5, 0.75, 0.9, 0.95, 0.99)(toFloat64(durationNano)) AS duration_quantiles_state,
    countIf(statusCode = 2) AS error_count,
    count(*) AS total_count,
    toStartOfMinute(timestamp) AS timestamp
FROM signoz_traces.signoz_index_v2
WHERE (dest != '') AND (kind != 2)
GROUP BY
    timestamp,
    src,
    dest
