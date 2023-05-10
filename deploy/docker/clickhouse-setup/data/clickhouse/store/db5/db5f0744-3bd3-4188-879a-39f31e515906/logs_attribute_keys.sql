ATTACH TABLE _ UUID '5e1d2a2e-ead6-4064-9296-cf0b06a32020'
(
    `name` String,
    `datatype` String
)
ENGINE = ReplacingMergeTree
ORDER BY (name, datatype)
SETTINGS index_granularity = 8192
