
SELECT
    country,
    online_consumer,
    age,
    annual_salary,
    gender,
    living_region,
    online_service_preference,
    ai_endorsement,
    ai_privacy_no_trust,
    ai_enhance_experience,
    ai_satisfication,
    ai_tools_used_chatbots

FROM {{ ref('stg_raw__general_AI_survey') }}
