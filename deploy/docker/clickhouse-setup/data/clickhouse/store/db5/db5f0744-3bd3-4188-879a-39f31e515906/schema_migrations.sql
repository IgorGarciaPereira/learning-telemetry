ATTACH TABLE _ UUID 'ec782ebb-7c37-4347-8383-335739327fd7'
(
    `version` Int64,
    `dirty` UInt8,
    `sequence` UInt64
)
ENGINE = MergeTree
ORDER BY sequence
SETTINGS index_granularity = 8192
