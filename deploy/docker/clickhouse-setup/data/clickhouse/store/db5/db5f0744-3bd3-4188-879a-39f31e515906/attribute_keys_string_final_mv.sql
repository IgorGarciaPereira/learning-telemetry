ATTACH MATERIALIZED VIEW _ UUID '855c4162-5b4c-49f2-931c-26f01cf31a15' TO signoz_logs.logs_attribute_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(attributes_string_key) AS name,
    'String' AS datatype
FROM signoz_logs.logs
ORDER BY name ASC
