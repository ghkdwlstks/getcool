-- 2024. 10. 16 integration
-- Update DB

# order-info.html
# 사용자 주소 변경
UPDATE user
SET address = ?
WHERE user_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리
    
# product_info.html
# 상품 정보 수정
UPDATE product
SET product_name = ?,
	price = ?,
    description = ?
WHERE product_id = ?;

# 장바구니 수량 변경
UPDATE cart
SET quantity = ?
WHERE user_id = ? AND product_id = ?;

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
    
-- 특정 사용자의 이름, 전화번호, 주소를 갱신 (예: user_id가 1인 경우)
UPDATE user
SET name = '홍길동', 
    phone_number = '010-1234-5678', 
    address = '서울시 강남구'
WHERE user_id = 1;

-- 특정 사용자의 이메일과 비밀번호를 갱신 (예: 이메일이 'chulsoo@example.com'인 경우)
UPDATE user
SET email = 'newemail@example.com', 
    password = 'newencryptedpassword'
WHERE email = 'chulsoo@example.com';
-- 특정 주문의 상태와 총액을 갱신 (예: order_id가 1인 경우)
UPDATE `order`
SET order_status = '배송 완료', 
    total_amount = 50000.00
WHERE order_id = 1;

-- 특정 사용자의 모든 주문 상태를 '배송 중'으로 변경 (예: user_id가 2인 경우)
UPDATE `order`
SET order_status = '배송 중'
WHERE user_id = 2;
-- 특정 주문 상세 정보에서 수량과 주문 당시 가격을 갱신 (예: order_detail_id가 3인 경우)
UPDATE order_detail
SET quantity = 10, 
    price_at_purchase = 25000.00
WHERE order_detail_id = 3;

-- 특정 주문의 모든 주문 상세 정보를 갱신 (예: order_id가 1인 경우)
UPDATE order_detail
SET quantity = 5, 
    price_at_purchase = 45000.00
WHERE order_id = 1;