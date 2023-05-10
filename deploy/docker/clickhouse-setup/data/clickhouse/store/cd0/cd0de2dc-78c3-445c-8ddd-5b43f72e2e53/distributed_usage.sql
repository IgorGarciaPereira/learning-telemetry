ATTACH TABLE _ UUID 'e1a7c964-18a8-42e1-a594-b0105ac84219'
(
    `tenant` String,
    `collector_id` String,
    `exporter_id` String,
    `timestamp` DateTime,
    `data` String
)
ENGINE = Distributed('cluster', 'signoz_traces', 'usage', cityHash64(rand()))
