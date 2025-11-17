with 

source as (

    select * from {{ source('raw', 'ai_company') }}

),

renamed as (

    select
        interaction_id,
        timestamp,
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

    from source

)

select * from renamed