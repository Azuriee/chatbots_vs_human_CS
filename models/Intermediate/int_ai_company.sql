
---Changing boolean to 1 or 0 --- 
SELECT
    interaction_id
    , timestamp AS date_date 
    , query_type 
    , handled_by
    , response_time_min
    , resolution_status
    , customer_sentiment
    , customer_satisfaction
    , interaction_cost_usd
    , customer_id
    , region 
    , device_type
    ,CAST( follow_up_required AS INT64) AS follow_up_required
FROM {{ ref('stg_raw__ai_company') }}
