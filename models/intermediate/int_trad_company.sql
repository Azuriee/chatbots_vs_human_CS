-- FORMATING FORMAT OF THE DATE
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
-- PREP FOR KPI CALCULATION
cat AS (
    SELECT *,
    TIMESTAMP(issue_reported_at) AS a,
    TIMESTAMP(issue_responded) AS b 
FROM date_clean
)
,
-- DATEDIFF CALCULATION AS RESPONSE_TIME
base_raw AS (
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
)
,
-- SPLIP POSITIVES/NEGATIVES RESPONSE TIME VALUES AND CALCULATE THE AVG OF THE POSITIVES TIME VALUES
base_with_avg AS (
    SELECT
        base_raw.*,
        avg(case when response_time > 0 then response_time end) over () as avg_positive_response_time
    FROM base_raw
)

-- REPLACE THE NEGATIVE RESPONSE TIME VALUES WITH THE AVG RESPONSE TIME VALUES
SELECT
    order_id,
    order_date,
    issue_reported_at,
    issue_responded,
    case 
        when response_time < 0 then ROUND (avg_positive_response_time, 1)
        else response_time
        end as response_time,
    customer_city,
    product_category,
    item_price

FROM base_with_avg