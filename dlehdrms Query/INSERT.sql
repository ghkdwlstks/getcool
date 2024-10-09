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
