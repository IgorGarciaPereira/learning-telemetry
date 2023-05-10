ATTACH TABLE _ UUID '142b9550-350c-43bb-a88e-ab09503eda6d'
(
    `metric_name` LowCardinality(String),
    `fingerprint` UInt64 CODEC(DoubleDelta, LZ4),
    `timestamp_ms` Int64 CODEC(DoubleDelta, LZ4),
    `labels` String CODEC(ZSTD(5))
)
ENGINE = Distributed('cluster', 'signoz_metrics', 'time_series_v2', cityHash64(metric_name, fingerprint))
