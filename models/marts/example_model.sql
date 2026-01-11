select
    id,
    greeting
from {{ ref('stg_example') }}
