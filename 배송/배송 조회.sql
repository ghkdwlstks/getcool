-- 배송 정보 조회
-- select * from delivery;

# delivery_info.html
# 특정 주문 ID로 배송 정보 조회
SELECT 
    d.delivery_id,  -- 고유 배송 ID
    d.order_id,  -- 주문 ID
    d.delivery_address,  -- 배송지 주소
    d.delivery_status,  -- 배송 상태 ('배송 준비', '배송 중', '배송 완료')
    d.delivery_date  -- 배송 완료 날짜
FROM 
    delivery d
WHERE 
    d.order_id = ?;  -- ? : Node.js의 주문 ID 들어가는 자리


# delivery_status.html
# 특정 상태의 배송 조회 (예: 배송 중)
SELECT 
    d.delivery_id,  -- 고유 배송 ID
    d.order_id,  -- 주문 ID
    d.delivery_address,  -- 배송지 주소
    d.delivery_status,  -- 배송 상태
    d.delivery_date  -- 배송 완료 날짜
FROM 
    delivery d
WHERE 
    d.delivery_status = '배송 중';  -- 배송 상태 필터링 (예: '배송 중')


# delivery_complete.html
# 특정 기간 내에 배송 완료된 상품 조회
SELECT 
    d.delivery_id,  -- 고유 배송 ID
    d.order_id,  -- 주문 ID
    d.delivery_address,  -- 배송지 주소
    d.delivery_status,  -- 배송 상태
    d.delivery_date  -- 배송 완료 날짜
FROM 
    delivery d
WHERE 
    d.delivery_status = '배송 완료'  -- 배송 완료 상태만 조회
    AND d.delivery_date BETWEEN '2024-10-01' AND '2024-10-10';  -- 특정 기간 필터링


# delivery_by_address.html
# 배송 주소로 조회 (특정 주소에 배송된 정보 조회)
SELECT 
    d.delivery_id,  -- 고유 배송 ID
    d.order_id,  -- 주문 ID
    d.delivery_address,  -- 배송지 주소
    d.delivery_status,  -- 배송 상태
    d.delivery_date  -- 배송 완료 날짜
FROM 
    delivery d
WHERE 
    d.delivery_address LIKE CONCAT('%', '서울특별시', '%');  -- ? : Node.js에서 특정 주소 필터링

