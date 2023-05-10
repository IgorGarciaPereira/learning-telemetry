ATTACH TABLE _ UUID 'ab02a528-c9b5-4367-a808-8a35986bb4b7'
(
    `metric_name` LowCardinality(String),
    `fingerprint` UInt64 CODEC(DoubleDelta, LZ4),
    `timestamp_ms` Int64 CODEC(DoubleDelta, LZ4),
    `labels` String CODEC(ZSTD(5))
)
ENGINE = ReplacingMergeTree
PARTITION BY toDate(timestamp_ms / 1000)
ORDER BY (metric_name, fingerprint)
TTL toDateTime(timestamp_ms / 1000) + toIntervalSecond(2592000)
SETTINGS index_granularity = 8192, ttl_only_drop_parts = 1
