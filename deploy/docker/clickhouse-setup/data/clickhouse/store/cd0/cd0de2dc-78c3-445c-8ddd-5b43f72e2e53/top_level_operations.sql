ATTACH TABLE _ UUID '28083d59-28c1-40aa-b852-2d144f19f38b'
(
    `name` LowCardinality(String) CODEC(ZSTD(1)),
    `serviceName` LowCardinality(String) CODEC(ZSTD(1))
)
ENGINE = ReplacingMergeTree
ORDER BY (serviceName, name)
SETTINGS index_granularity = 8192
