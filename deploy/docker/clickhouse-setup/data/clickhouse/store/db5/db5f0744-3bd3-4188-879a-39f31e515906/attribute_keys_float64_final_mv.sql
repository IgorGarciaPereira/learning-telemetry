ATTACH MATERIALIZED VIEW _ UUID '93d05a4c-da9a-4770-aa2f-651c1252741e' TO signoz_logs.logs_attribute_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(attributes_float64_key) AS name,
    'Float64' AS datatype
FROM signoz_logs.logs
ORDER BY name ASC
