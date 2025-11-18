WITH date_clean AS (
    SELECT 
    unique_id,
    channel_name,
    category, 
    sub_category,
    order_id,
    DATE(order_date_time) AS order_date,
    FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', issue_reported_at) AS issue_reported_at,
    FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', issue_responded) AS issue_responded,
    survey_response_date,
    customer_city,
    product_category,
    item_price,
    agent_name,
    csat
FROM {{ ref('stg_raw__trad_company') }}
)

, 

cat AS (
    SELECT *,
    TIMESTAMP(issue_reported_at) AS a,
    TIMESTAMP(issue_responded) AS b 
FROM date_clean
)


SELECT
    unique_id,
    channel_name,
    category, 
    sub_category,
    order_id,
    order_date,
    issue_reported_at,
    issue_responded,
    DATE_DIFF(b,a,MINUTE) AS response_time,
    survey_response_date,
    customer_city,
    product_category,
    item_price,
    agent_name,
    csat
FROM cat
