SELECT
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    purchase_price,
    ROUND(quantity * purchase_price, 2) AS purchase_cost,
    ROUND(revenue - quantity * purchase_price, 2) AS margin
FROM {{ ref("stg_raw__sales") }}
LEFT JOIN {{ ref("stg_raw__product") }}
USING(products_id)