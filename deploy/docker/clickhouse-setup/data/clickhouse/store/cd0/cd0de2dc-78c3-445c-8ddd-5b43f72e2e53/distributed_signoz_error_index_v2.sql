ATTACH TABLE _ UUID 'f7a4330e-3b1b-4229-86cb-925a7859e262'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `errorID` FixedString(32) CODEC(ZSTD(1)),
    `groupID` FixedString(32) CODEC(ZSTD(1)),
    `traceID` FixedString(32) CODEC(ZSTD(1)),
    `spanID` String CODEC(ZSTD(1)),
    `serviceName` LowCardinality(String) CODEC(ZSTD(1)),
    `exceptionType` LowCardinality(String) CODEC(ZSTD(1)),
    `exceptionMessage` String CODEC(ZSTD(1)),
    `exceptionStacktrace` String CODEC(ZSTD(1)),
    `exceptionEscaped` Bool CODEC(T64, ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'signoz_error_index_v2', cityHash64(groupID))
