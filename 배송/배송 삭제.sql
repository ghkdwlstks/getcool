-- 배송 정보 삭제 (배송 ID로 삭제)
DELETE FROM delivery
WHERE delivery_id = ?;
    -- ? : Node.js에서 삭제하려는 배송 ID가 들어가는 자리

-- 배송 정보 삭제 (주문 ID로 삭제)
DELETE FROM delivery
WHERE order_id = ?;
    -- ? : Node.js에서 삭제하려는 주문 ID가 들어가는 자리
