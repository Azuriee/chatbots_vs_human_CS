with 

source as (

    select * from {{ source('raw', 'trad_company') }}

),

renamed as (

    select
        unique_id,
        channel_name,
        category,
        sub_category,
        order_id,
        order_date_time,
        issue_reported_at,
        issue_responded,
        survey_response_date,
        customer_city,
        product_category,
        item_price,
        agent_name,
        csat

    from source

)

select * from renamed