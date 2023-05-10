ATTACH TABLE _ UUID '66dbb235-3a7c-4aee-ac37-9dad4ca0379c'
(
    `name` String,
    `datatype` String
)
ENGINE = Distributed('cluster', 'signoz_logs', 'logs_resource_keys', cityHash64(datatype))
