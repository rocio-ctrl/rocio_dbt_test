with source_data as (
    select
        1 as id,
        'hola' as greeting
)

select
    id,
    greeting
from source_data
