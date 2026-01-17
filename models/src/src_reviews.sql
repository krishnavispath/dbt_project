with raw_reviews as (
    SELECT * from {{ source('retaildb','reviews') }}
)
SELECT
listing_id,
date as review_date,
reviewer as reviewer_name,
comments as review_text,
sentiment as review_sentiment
from raw_reviews