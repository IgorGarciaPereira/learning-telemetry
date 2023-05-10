ATTACH TABLE _ UUID '34cea3b2-473a-442e-91c5-c15940f03a2a'
(
    `name` String,
    `datatype` String
)
ENGINE = Distributed('cluster', 'signoz_logs', 'logs_attribute_keys', cityHash64(datatype))
