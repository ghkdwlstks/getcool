-- 2024. 10. 16 integration

# index.html
# 상품 등록
INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES 
(?, ?, ?, ?, ?, ?, ?, ?, NOW());
	-- ? : Nods.js의 검색어 들어가는 자리
    
# 장바구니 넣기
INSERT INTO cart (user_id, product_id, quantity)
VALUES
(?, ?, ?);
	-- ? : Nods.js
    
-- 사용자 정보 삽입
INSERT INTO user (name, email, password, user_type, phone_number, address, registration_date)
VALUES 
('김철수', 'chulsoo@example.com', 'encrypted_password', '소비자', '010-1234-5678', '서울특별시 강남구', '2024-10-01'),
('홍길동', 'gildong@example.com', 'encrypted_password', '판매자', '010-9876-5432', '경기도 성남시', '2024-09-20');
-- 주문 정보 삽입
INSERT INTO `order` (user_id, order_date, total_amount, order_status)
VALUES
(1, '2024-10-02 14:30:00', 150000, '배송 중'),  -- user_id는 1번 사용자
(2, '2024-10-03 10:15:00', 300000, '대기');    -- user_id는 2번 사용자
-- 주문 상세 정보 삽입
INSERT INTO order_detail (order_id, product_id, quantity, price_at_purchase)
VALUES
(1, 101, 2, 75000),   -- order_id는 1번 주문, product_id는 101번 상품
(1, 102, 1, 50000),   -- order_id는 1번 주문, product_id는 102번 상품
(2, 101, 3, 100000);  -- order_id는 2번 주문, product_id는 101번 상품


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