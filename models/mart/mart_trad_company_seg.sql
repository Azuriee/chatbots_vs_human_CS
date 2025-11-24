 SELECT 
    unique_id,
    channel_name,
    category,
    CASE
        WHEN category = 'App/website'       THEN 'Technical Support'
        WHEN category = 'Product Queries'   THEN 'Product Information'
        WHEN category = 'Order Related'     THEN 'Order Related'
        WHEN category = 'Refund Related'    THEN 'Refund Related'
        WHEN category = 'Returns'           THEN 'Returns'
        WHEN category = 'Cancellation'      THEN 'Technical Support'
        WHEN category = 'Feedback'          THEN 'Product Information'
        WHEN category = 'Offers & Cashback' THEN 'Billing Question'
        WHEN category = 'Shopzilla Related' THEN 'Technical Support'
        WHEN category = 'Onboarding related' THEN 'Account Update'
        WHEN category = 'Payments related' THEN 'Billing Question'
        ELSE 'Others'
    END AS category_2,
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