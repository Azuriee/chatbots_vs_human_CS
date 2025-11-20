 SELECT 
    unique_id,
    channel_name,
    category,
    sub_category,
    order_id,
    order_date,
    report_date_day,
    issue_reported_at,
    issue_responded,
    response_time,
    delay_category,
    customer_city,
    product_category,
    item_price,
    agent_name,
    tenure_segment,
    csat
FROM {{ ref('in_trad_company_seg') }}









    