ATTACH TABLE _ UUID '24def6d4-aeaf-48d6-ab09-ac9c6b59e9de'
(
    `timestamp` UInt64 CODEC(DoubleDelta, LZ4),
    `observed_timestamp` UInt64 CODEC(DoubleDelta, LZ4),
    `id` String CODEC(ZSTD(1)),
    `trace_id` String CODEC(ZSTD(1)),
    `span_id` String CODEC(ZSTD(1)),
    `trace_flags` UInt32,
    `severity_text` LowCardinality(String) CODEC(ZSTD(1)),
    `severity_number` UInt8,
    `body` String CODEC(ZSTD(2)),
    `resources_string_key` Array(String) CODEC(ZSTD(1)),
    `resources_string_value` Array(String) CODEC(ZSTD(1)),
    `attributes_string_key` Array(String) CODEC(ZSTD(1)),
    `attributes_string_value` Array(String) CODEC(ZSTD(1)),
    `attributes_int64_key` Array(String) CODEC(ZSTD(1)),
    `attributes_int64_value` Array(Int64) CODEC(ZSTD(1)),
    `attributes_float64_key` Array(String) CODEC(ZSTD(1)),
    `attributes_float64_value` Array(Float64) CODEC(ZSTD(1)),
    INDEX body_idx body TYPE tokenbf_v1(10240, 3, 0) GRANULARITY 4,
    INDEX id_minmax id TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree
PARTITION BY toDate(timestamp / 1000000000)
ORDER BY (timestamp, id)
TTL toDateTime(timestamp / 1000000000) + toIntervalSecond(604800)
SETTINGS index_granularity = 8192, ttl_only_drop_parts = 1
