select *
from {{ ref("fct_reviews") }} as f
left join {{ ref("dim_listings_cleansed") }} as d using (listing_id)
where f.review_date <= d.created_at
