ATTACH TABLE _ UUID 'ef4a91d9-65ee-4b9a-b13b-f54f2a6af281'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `service_name` LowCardinality(String) CODEC(ZSTD(1)),
    `count` UInt64 CODEC(T64, ZSTD(1))
)
ENGINE = SummingMergeTree
PARTITION BY toDate(timestamp)
ORDER BY (timestamp, service_name)
TTL toDateTime(timestamp) + toIntervalSecond(604800)
SETTINGS index_granularity = 8192, ttl_only_drop_parts = 1
