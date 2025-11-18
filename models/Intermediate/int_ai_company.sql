SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT interaction_id) AS distinct_interactions,
    COUNTIF(interaction_id IS NULL) AS null_interaction_ids,
    COUNTIF(customer_satisfaction IS NULL) AS null_csat_scores,
    COUNTIF(query_type IS NULL) AS null_query_types
FROM
    {{ ref('stg_raw__ai_company') }}

    ------ 10 000, 10 000 intereaction ids, no null intneraction ids, nor csat_score no querry_types--- 

---Counting customers_id--- 
SELECT
 COUNT(DISTINCT customer_id) AS distinct_interactions,
FROM
{{ ref('stg_raw__ai_company') }}
--- Totall unique custoemrs 10 000------

--Checking for typos on categories--- 
SELECT
    query_type,
    COUNT(*) AS interaction_count
FROM
    {{ ref('stg_raw__ai_company') }}
GROUP BY 1
ORDER BY 2 DESC
-----no typo errors---- 
SELECT
    handled_by,
    COUNT(*) AS handled_count
FROM
    {{ ref('stg_raw__ai_company') }}
GROUP BY 1
ORDER BY 2 DESC
---- no typos 2 categories-----

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


----- Average customer_sat by handled_by---- 
SELECT 
    handled_by
    , ROUND(AVG(customer_sentiment),2) AS cust_sent
    , ROUND(AVG(interaction_cost_usd),2)  AS avg_int_cost
    , ROUND(AVG(response_time_min),2) AS resp_time 
    , ROUND(AVG(customer_satisfaction),2) AS c_sat
FROM {{ ref('stg_raw__ai_company') }}
GROUP BY handled_by
---The c_sat gap is nor very big between human agents and AI agents, only 0.05 difference, but thhe response time of AI is muchh faster ( 1.51 vs 7.05 min )
-- Checking cost of human interactions 


