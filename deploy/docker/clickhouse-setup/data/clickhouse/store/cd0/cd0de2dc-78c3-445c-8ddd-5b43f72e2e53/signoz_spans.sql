ATTACH TABLE _ UUID 'b9238e62-4661-44c3-a0c5-0da9f7b13838'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `traceID` FixedString(32) CODEC(ZSTD(1)),
    `model` String CODEC(ZSTD(9))
)
ENGINE = MergeTree
PARTITION BY toDate(timestamp)
ORDER BY traceID
TTL toDateTime(timestamp) + toIntervalSecond(604800)
SETTINGS index_granularity = 1024, ttl_only_drop_parts = 1
