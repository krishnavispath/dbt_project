{{
    config(
        materialized = 'incremental',
        on_schema_change='fail'
    )
}}

with src_reviews as (
    select * from {{ ref('src_reviews')}}
)
select 
{{ dbt_utils.generate_surrogate_key(['LISTING_ID', 'REVIEW_DATE','REVIEWER_NAME','REVIEW_TEXT']) }} 
as review_id,
* 
from src_reviews
where review_text is not null

{% if is_incremental() %}
    AND review_date > (select max(review_date) from {{ this}})
    {{ log('Running incremental model: only new reviews will be processed.', info=True) }}
{% else %}
    {{ log('Running full refresh of the model: all reviews will be processed.', info=True) }}
{% endif %}