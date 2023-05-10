ATTACH MATERIALIZED VIEW _ UUID '017ea901-9aa7-4d48-8c31-8f35dbc913cd' TO signoz_logs.logs_attribute_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(attributes_int64_key) AS name,
    'Int64' AS datatype
FROM signoz_logs.logs
ORDER BY name ASC
