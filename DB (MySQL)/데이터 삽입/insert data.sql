-- SQL 삽입
select * from review;

-- ex) user table (외래키 확인용)
INSERT INTO user (name, email, password, user_type, phone_number, address, registration_date)
VALUES 
('김철수', 'kimcs@example.com', 'password123', '판매자', '010-1111-1111', '서울시 중구', '2023-01-01'),
('박영희', 'parkyh@example.com', 'password456', '판매자', '010-2222-2222', '서울시 종로구', '2023-01-15'),
('이민호', 'leemh@example.com', 'password789', '소비자', '010-3333-3333', '서울시 강남구', '2023-02-01');

-- category table
INSERT INTO category (category_name)
VALUES 
('식료품'),
('생활용품'),
('의류');

-- product table
INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES 
(1, 1, '유기농 사과', 5000, 100, '2024-01-01', 4500, '신선한 유기농 사과입니다.', '2023-03-01 09:00:00'),
(1, 2, '주방 세제', 3000, 200, '2025-01-01', 2500, '환경 친화적인 주방 세제입니다.', '2023-03-05 10:00:00'),
(2, 3, '전통 한복', 150000, 20, '2025-12-31', 140000, '고급스러운 전통 한복입니다.', '2023-03-10 11:00:00');

-- review table
INSERT INTO review (product_id, user_id, rating, comment, review_date)
VALUES 
(1, 3, 5, '사과가 아주 신선하고 맛있습니다!', '2023-03-15 14:00:00'),
(2, 3, 4, '주방 세제 향이 좋고 사용이 편리합니다.', '2023-03-16 15:00:00'),
(3, 3, 5, '한복의 품질이 정말 뛰어나네요. 추천합니다!', '2023-03-17 16:00:00');
