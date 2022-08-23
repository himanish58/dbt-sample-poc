{ % snapshot countries_snapshot %}

{{
    config(
        target_database = 'demo',
        target_schema ='public',
        unique_key = 'id',
        strategy = 'check',
        check_cols = 'all'
    )
}}

select * from countries

{% endsnapshot %}

