
SELECT
    country
    , CAST(online_consumer AS INT64) AS online_consumer
    , age
    , annual_salary
    , gender
    , living_region
    , CAST(online_service_preference AS INT64) AS online_service_preference
    , CAST(ai_endorsement AS INT64) AS ai_endorsement
    , CAST(ai_privacy_no_trust AS INT64) AS ai_privacy_no_trust
    , CAST(ai_enhance_experience AS INT64) AS ai_enhance_experience
    , ai_satisfication
    , CAST(ai_tools_used_chatbots AS INT64) AS ai_tools_used_chatbots

FROM {{ ref('stg_raw__general_AI_survey') }}

