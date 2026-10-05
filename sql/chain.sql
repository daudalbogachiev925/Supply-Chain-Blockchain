CREATE TABLE blockchain (
    id BIGSERIAL PRIMARY KEY,
    batch_id BIGINT,
    event_type TEXT,
    payload JSONB,
    prev_hash TEXT,
    hash TEXT NOT NULL,
    created TIMESTAMP DEFAULT NOW()
);

-- Проверка целостности цепочки
SELECT id,
    CASE WHEN prev_hash = LAG(hash) OVER (ORDER BY id)
         THEN 'ok' ELSE 'broken' END AS status
FROM blockchain;
