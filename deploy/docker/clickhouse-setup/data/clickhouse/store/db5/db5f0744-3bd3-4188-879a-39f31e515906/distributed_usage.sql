ATTACH TABLE _ UUID '30d8ba35-88bf-4f99-9c45-3c3765af2585'
(
    `tenant` String,
    `collector_id` String,
    `exporter_id` String,
    `timestamp` DateTime,
    `data` String
)
ENGINE = Distributed('cluster', 'signoz_logs', 'usage', cityHash64(rand()))
