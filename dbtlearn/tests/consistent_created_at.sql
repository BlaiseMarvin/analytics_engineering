SELECT *
FROM {{ ref("fct_reviews") }} r
WHERE r.review_date < (
    SELECT MIN(created_at)
    FROM {{ ref("dim_listings_cleansed") }} l
    WHERE r.listing_id = l.listing_id
)
LIMIT 10