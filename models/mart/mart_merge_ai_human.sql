with trad AS (SELECT category_2 
, AVG(response_time) AS avg_reponse_human
, AVG(csat) AS avg_csat_human
FROM {{ ref('mart_trad_company_seg') }}
GROUP BY category_2)
,
AI AS (SELECT query_type 
, AVG(response_time_min) AS avg_response_ai
, AVG(customer_satisfaction) AS avg_csat_ai
FROM {{ ref('mart_ai_company') }}
GROUP BY query_type)

SELECT AI.query_type
, avg_response_ai
, avg_csat_ai
, avg_reponse_human
, avg_csat_human
FROM AI
LEFT JOIN trad
ON trad.category_2 = AI.query_type 