{{ config(
    pre_hook = [
    "UPDATE {{ source('demo','raw_notes') }}
        SET description = 'Removed'
        WHERE id IN(
            SELECT 
                id
            FROM {{ source('demo','raw_notes') }}
            WHERE description != 'Removed'
        QUALIFY first_value(_fivetran_deleted) OVER (PARTITION BY id ORDER BY _fivetran_id DESC) = 'true'
        )"
    ]
) }}

SELECT 
id,
description,
rating,
LAG(_fivetran_synced) OVER (PARTITION BY id ORDER BY _fivetran_id DESC) AS ValidTo
FROM {{ source('demo','raw_notes') }}