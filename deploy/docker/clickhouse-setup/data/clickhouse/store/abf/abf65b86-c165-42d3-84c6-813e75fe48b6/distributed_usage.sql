ATTACH TABLE _ UUID 'afa72ca6-5f24-471e-860c-bca72e3f7bdf'
(
    `tenant` String,
    `collector_id` String,
    `exporter_id` String,
    `timestamp` DateTime,
    `data` String
)
ENGINE = Distributed('cluster', 'signoz_metrics', 'usage', cityHash64(rand()))
