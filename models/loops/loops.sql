{% set columns = [
    'listing_id',
    'listing_name',
    'price'
] %} 

select

{% for col in columns %}
    {{ col }}{% if not loop.last %},{% endif %}
{% endfor %}

from {{ ref('dim_listings_cleansed') }}