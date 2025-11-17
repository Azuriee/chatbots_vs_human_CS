with 

source as (

    select * from {{ source('raw', 'trad_company') }}

),

renamed as (

    select
        unique id,
        channel_name,
        category,
        sub-category,
        customer remarks,
        order_id,
        order_date_time,
        issue_reported at,
        issue_responded,
        survey_response_date,
        customer_city,
        product_category,
        item_price,
        connected_handling_time,
        agent_name,
        supervisor,
        manager,
        tenure bucket,
        agent shift,
        csat score

    from source

)

select * from renamed