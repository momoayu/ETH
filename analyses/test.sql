-- {{ codegen.generate_source(schema_name='eth_schema', database_name='eth', generate_columns = True) }}

-- {{ codegen.generate_model_yaml(['stg_transactions', 'stg_transactions_enriched', 'stablecoin_activity_per_day']) }}

-- select
-- 		{{ dbt_utils.star(from = ref('stg_transactions_enriched'), except =['new_field'], quote_identifiers = False, prefix='stg_') }}

-- from {{ ref('stg_transactions_enriched') }}

-- {{ audit_helper.compare_relations(source('eth', 'contracts'), source('eth', 'contracts_clone')) }}