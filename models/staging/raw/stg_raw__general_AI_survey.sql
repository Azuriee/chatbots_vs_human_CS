with 

source as (

    select * from {{ source('raw', 'general_AI_survey') }}

),

renamed as (

    select
        country,
        online_consumer,
        age,
        annual_salary,
        gender,
        education,
        payment_method_credit_debit,
        living_region,
        online_service_preference,
        ai_endorsement,
        ai_privacy_no_trust ,
        ai_enhance_experience,
        ai_satisfication,
        ai_tools_used _chatbots,
        ai_tools_used_virtual_assistant,
        ai_tools_used_voice&photo_search,
        payment_method_cod,
        payment_method_ewallet,
        product_category_appliances,
        product_category_electronics,
        product_category_groceries,
        product_category_personal_care,
        product_category_clothing

    from source

)

select * from renamed