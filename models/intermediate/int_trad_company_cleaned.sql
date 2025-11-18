-- SELECT
--     t1.response_time,
--     CASE 
--         -- Si le temps de réponse est négatif ou zéro (considéré comme "invalide")
--         WHEN t1.response_time <= 0 THEN t2.avg_positive_response_time 
--         -- Sinon, on garde la valeur originale
--         ELSE t1.response_time 
--     END AS rp
-- FROM 
--     {{ ref('int_trad_company') }} AS t1
-- CROSS JOIN 
--     -- Sous-requête pour calculer la moyenne des temps de réponse > 0
--     (
--         SELECT
--             AVG(response_time) AS avg_positive_response_time
--         FROM 
--             {{ ref('int_trad_company') }}
--         WHERE 
--             response_time > 0
--     ) AS t2
--     ORDER BY rp DESC


WITH subquery AS (
    SELECT 
        unique_id,
        response_time,
        AVG(response_time) AS avg_positive_response_time
    FROM 
        {{ ref('int_trad_company') }}
        
    WHERE 
        response_time > 0
        GROUP BY unique_id , response_time
)
        


SELECT  
    f.*,
    CASE 
        -- Si le temps de réponse est négatif ou zéro (considéré comme "invalide")
        WHEN subquery.response_time <= 0 THEN avg_positive_response_time 
        -- Sinon, on garde la valeur originale
        ELSE subquery.response_time 
    END AS rp,
FROM subquery 
RIGHT JOIN {{ ref('int_trad_company') }} AS f 
    USING (unique_id)
ORDER BY response_time ASC
