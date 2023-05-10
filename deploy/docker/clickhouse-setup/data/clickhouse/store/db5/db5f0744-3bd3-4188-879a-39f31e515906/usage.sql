ATTACH TABLE _ UUID '8bc46727-111f-4f78-b9ea-3828b6a5f974'
(
    `tenant` String,
    `collector_id` String,
    `exporter_id` String,
    `timestamp` DateTime,
    `data` String
)
ENGINE = MergeTree
ORDER BY (tenant, collector_id, exporter_id, timestamp)
TTL timestamp + toIntervalDay(3)
SETTINGS index_granularity = 8192
