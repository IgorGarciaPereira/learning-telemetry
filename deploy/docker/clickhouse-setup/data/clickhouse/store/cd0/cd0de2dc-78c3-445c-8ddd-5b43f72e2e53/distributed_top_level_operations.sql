ATTACH TABLE _ UUID 'da849aa2-8436-4fbf-bfd9-2522c5419ebb'
(
    `name` LowCardinality(String) CODEC(ZSTD(1)),
    `serviceName` LowCardinality(String) CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'top_level_operations', cityHash64(rand()))
