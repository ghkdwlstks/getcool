-- 배송 정보 수정 (배송 ID로 수정)
UPDATE delivery
SET 
    delivery_address = ?,  -- 배송지 주소
    delivery_status = ?,    -- 배송 상태 ('배송 준비', '배송 완료'만 가능)
    delivery_date = ?       -- 배송 완료 날짜 (NULL일 경우 배송 완료 시점)
WHERE 
    delivery_id = ?        -- 수정할 배송 ID
    AND delivery_status != '배송 중';  -- 배송 상태가 '배송 중'이 아닐 때만 수정 가능
    -- ? : Node.js에서 들어가는 자리
