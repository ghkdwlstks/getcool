
# 배송 정보 등록 (배송 시작)
INSERT INTO delivery (order_id, delivery_address, delivery_status, delivery_date)
VALUES 
(?, ?, '배송 준비', NULL);
	-- ? : Node.js의 주문 ID 및 배송 주소 들어가는 자리

# 배송 상태 업데이트 (배송 중으로 변경)
UPDATE delivery
SET 
    delivery_status = '배송 중',
    delivery_date = NULL
WHERE 
    delivery_id = ?;
	-- ? : Node.js의 배송 ID 들어가는 자리

# 배송 완료 업데이트 (배송 완료 시)
UPDATE delivery
SET 
    delivery_status = '배송 완료',
    delivery_date = NOW()
WHERE 
    delivery_id = ?;
	-- ? : Node.js의 배송 ID 들어가는 자리
