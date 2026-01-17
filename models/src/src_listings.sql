--import raw_listings
WITH raw_listings AS(
    select * from {{ source('retaildb','listings') }}
)
SELECT
    id as listing_id,
    listing_url,
    name as listing_name,
    room_type,
    minimum_nights,
    host_id,
    price as price_str,
    created_at,
    updated_at
    from raw_listings