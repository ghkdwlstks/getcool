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
