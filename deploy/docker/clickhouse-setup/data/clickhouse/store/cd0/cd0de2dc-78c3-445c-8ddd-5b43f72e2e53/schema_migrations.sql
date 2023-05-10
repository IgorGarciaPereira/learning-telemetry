ATTACH TABLE _ UUID 'c650e83d-2c48-4b10-b1e5-28aa0b7b1a37'
(
    `version` Int64,
    `dirty` UInt8,
    `sequence` UInt64
)
ENGINE = MergeTree
ORDER BY sequence
SETTINGS index_granularity = 8192
