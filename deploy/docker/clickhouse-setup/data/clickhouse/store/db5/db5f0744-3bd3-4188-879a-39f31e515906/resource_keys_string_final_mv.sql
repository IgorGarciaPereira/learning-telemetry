ATTACH MATERIALIZED VIEW _ UUID '1a57e6a4-745f-44b3-baba-189373c44c36' TO signoz_logs.logs_resource_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(resources_string_key) AS name,
    'String' AS datatype
FROM signoz_logs.logs
ORDER BY name ASC
