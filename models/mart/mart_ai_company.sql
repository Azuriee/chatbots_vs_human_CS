
SELECT 
    interaction_id, 
    date_date, 
    query_type, 
    handled_by, 
    response_time_min, 
    resolution_status, 
    customer_sentiment, 
    customer_satisfaction, 
    interaction_cost_usd, 
    customer_id, 
    region, 
    device_type, 
    follow_up_required

FROM {{ ref('int_ai_company') }}

