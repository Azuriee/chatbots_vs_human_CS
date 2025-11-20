SELECT * 
FROM {{ ref('int_general_AI_survey') }}
ORDER BY country 