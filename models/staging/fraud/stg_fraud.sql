select
t.from_address,
c.bytecode,
count(c.bytecode) bytecode_count

from {{ref('stg_transactions_enriched')}} t

left join {{ref('stg_contracts')}} c 
on t.receipt_contract_address = c.address

where t.transaction_category='contract_creation'
and c.bytecode is not null

group by 1,2

-- 0xc7ba7b15a8edf6071f70cf316d81cb02d561ba73
-- 0x2c0c5d6c0a86a0e10dfe77bfe500117498fdf862
-- 0x339257cb1a63c766dd1e415afa5917385225b4a2