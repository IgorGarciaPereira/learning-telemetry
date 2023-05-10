ATTACH TABLE _ UUID 'be0bab15-d451-4c35-876a-a14f86ffa005'
(
    `name` String,
    `datatype` String
)
ENGINE = ReplacingMergeTree
ORDER BY (name, datatype)
SETTINGS index_granularity = 8192
