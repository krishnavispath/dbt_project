With fullmoon_reviews as(
    select * from {{ ref('mart_fullmoon_reviews') }}
)
select
    is_full_moon,
    review_sentiment,
    count(*) as total_reviews,
    avg(rating) as average_rating,
    sum(case when rating >= 4 then 1 else 0 end) as positive_reviews,
    sum(case when rating <= 2 then 1 else 0 end) as negative_reviews
from fullmoon_reviews
group by is_full_moon, review_sentiment