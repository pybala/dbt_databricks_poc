{{ 
    config(materialized = "table", file_format = "delta") 
}}

SELECT 
    P.product_id,
    P.name as product_name,
    P.unit_price,
    C.name as category_name
FROM {{ source('bronze_db', 'product') }} P
LEFT JOIN {{ source('bronze_db', 'product_category') }} C
    ON C.category_id = P.category_id
