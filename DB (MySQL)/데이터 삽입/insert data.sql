-- 2024.10.04 create, tlgusyu
-- SQL 삽입
-- select * from user;
-- select * from product;

-- ex) user table
INSERT INTO user (name, email, password, user_type, phone_number, address, registration_date)
VALUES 
('김철수', 'kimcs@example.com', 'password123', '판매자', '010-1111-1111', '서울시 중구', '2023-01-01'),
('박영희', 'parkyh@example.com', 'password456', '판매자', '010-2222-2222', '서울시 종로구', '2023-01-15'),
('이민호', 'leemh@example.com', 'password789', '소비자', '010-3333-3333', '서울시 강남구', '2023-02-01');

INSERT INTO user (name, email, password, user_type, phone_number, address, registration_date)
VALUES
('최민수', 'choims@example.com', 'password123', '소비자', '010-4444-4444', '서울시 서초구', '2024-01-01'),
('한지민', 'hanjm@example.com', 'password456', '소비자', '010-5555-5555', '서울시 강남구', '2024-01-02'),
('박지성', 'parkjs@example.com', 'password789', '소비자', '010-6666-6666', '서울시 송파구', '2024-01-03');

-- category table
INSERT INTO category (category_name)
VALUES 
('식료품'),
('생활용품'),
('의류');

INSERT INTO category (category_name)
VALUES 
('가전제품'),
('화장품'),
('가구'),
('문구류'),
('도서'),
('운동용품'),
('악세서리'),
('신발');

-- product table
INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES 
(1, 1, '유기농 사과', 5000, 100, '2024-01-01', 4500, '신선한 유기농 사과입니다.', '2023-03-01 09:00:00'),
(1, 2, '주방 세제', 3000, 200, '2025-01-01', 2500, '환경 친화적인 주방 세제입니다.', '2023-03-05 10:00:00'),
(2, 3, '전통 한복', 150000, 20, '2025-12-31', 140000, '고급스러운 전통 한복입니다.', '2023-03-10 11:00:00');

INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES 
(1, 4, '무선 청소기', 120000, 30, '2026-01-01', 110000, '강력한 흡입력의 무선 청소기입니다.', '2023-03-12 09:30:00'),
(2, 5, '천연 미용 크림', 25000, 150, '2024-12-01', 20000, '피부에 자극이 없는 천연 성분의 미용 크림입니다.', '2023-03-13 10:00:00'),
(1, 6, '원목 책상', 500000, 10, '2025-01-01', 450000, '고급 원목으로 만든 튼튼한 책상입니다.', '2023-03-14 11:30:00'),
(2, 7, '다이어리', 10000, 200, '2025-12-31', 8000, '심플한 디자인의 다이어리입니다.', '2023-03-15 12:00:00'),
(1, 8, '소설책 세트', 45000, 50, '2025-12-31', 40000, '베스트셀러 소설 3권 세트입니다.', '2023-03-16 13:00:00'),
(2, 9, '요가 매트', 30000, 100, '2026-01-01', 25000, '두께감 있고 미끄럼 방지 기능이 있는 요가 매트입니다.', '2023-03-17 14:30:00'),
(1, 10, '실버 목걸이', 50000, 40, '2025-01-01', 45000, '심플한 디자인의 실버 목걸이입니다.', '2023-03-18 15:00:00'),
(2, 11, '러닝화', 90000, 80, '2025-12-31', 85000, '편안한 착용감의 러닝화입니다.', '2023-03-19 16:00:00'),
(1, 4, '스마트폰 충전기', 15000, 300, '2024-12-01', 13000, '고속 충전이 가능한 스마트폰 충전기입니다.', '2023-03-20 17:00:00'),
(2, 5, '립스틱 세트', 35000, 120, '2025-12-31', 30000, '다양한 색상의 립스틱 5종 세트입니다.', '2023-03-21 18:30:00'),
(1, 6, '편안한 의자', 100000, 25, '2026-01-01', 95000, '장시간 사용해도 편안한 의자입니다.', '2023-03-22 09:00:00'),
(2, 7, '볼펜 세트', 7000, 500, '2025-12-31', 6000, '다양한 색상의 볼펜 10종 세트입니다.', '2023-03-23 10:30:00'),
(1, 8, '역사책', 25000, 60, '2025-12-31', 22000, '흥미로운 역사 이야기가 담긴 도서입니다.', '2023-03-24 11:00:00'),
(2, 9, '헬스장갑', 15000, 80, '2026-01-01', 13000, '운동 시 손 보호에 좋은 헬스 장갑입니다.', '2023-03-25 12:00:00'),
(1, 10, '금반지', 200000, 10, '2025-01-01', 190000, '세련된 디자인의 14k 금반지입니다.', '2023-03-26 13:30:00');

INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES (1, 1, '유기농 당근', 3000, 0, '2024-12-31', 2500, '신선한 유기농 당근입니다.', '2023-10-01 09:00:00');

INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES (2, 1, '신선한 유기농 사과', 6000, 50, '2025-01-01', 5500, '아주 신선한 유기농 사과입니다.', '2023-10-05 10:00:00');

INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES
(1, 1, '신선한 토마토', 4000, 100, '2024-12-01', 3500, '신선한 유기농 토마토입니다.', '2024-01-01 08:00:00'),
(2, 1, '친환경 오이', 2000, 150, '2024-11-15', 1800, '아삭한 식감의 친환경 오이입니다.', '2024-01-02 09:00:00'),
(1, 1, '당근', 3000, 200, '2024-10-31', 2800, '비타민이 풍부한 신선한 당근입니다.', '2024-01-03 10:00:00'),
(3, 1, '유기농 양파', 3500, 80, '2024-09-30', 3200, '국산 유기농 양파입니다.', '2024-01-04 11:00:00'),
(2, 1, '달콤한 고구마', 5000, 60, '2025-01-15', 4500, '달콤하고 신선한 고구마입니다.', '2024-01-05 12:00:00');

INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES
(3, 1, '유기농 양파', 3500, 80, '2024-09-30', 3200, '국산 유기농 양파입니다.', '2024-01-04 11:00:00');

INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES
(4, 1, '유기농 딸기', 12000, 50, '2024-06-01', 11000, '신선한 유기농 딸기입니다.', '2024-02-01 08:00:00'),
(4, 2, '수제 비누 세트', 18000, 30, '2025-01-01', 16000, '자연 성분으로 만든 수제 비누 세트입니다.', '2024-02-02 09:30:00');


-- review table
INSERT INTO review (product_id, user_id, rating, comment, review_date)
VALUES 
(1, 3, 5, '사과가 아주 신선하고 맛있습니다!', '2023-03-15 14:00:00'),
(2, 3, 4, '주방 세제 향이 좋고 사용이 편리합니다.', '2023-03-16 15:00:00'),
(3, 3, 5, '한복의 품질이 정말 뛰어나네요. 추천합니다!', '2023-03-17 16:00:00');

INSERT INTO review (product_id, user_id, rating, comment, review_date)
VALUES
(1, 2, 5, '정말 좋은 상품입니다! 만족스러워요.', '2024-01-01 10:00:00'),
(1, 3, 4, '품질이 괜찮은데, 가격이 조금 비싸네요.', '2024-01-02 12:30:00'),
(1, 4, 3, '평범한 품질이에요. 가격 대비 나쁘진 않아요.', '2024-01-03 14:45:00'),
(1, 5, 5, '정말 신선한 제품이었어요. 추천합니다!', '2024-01-04 09:20:00'),
(1, 6, 4, '전체적으로 만족스러운데, 배송이 조금 느렸어요.', '2024-01-05 15:10:00');

INSERT INTO review (product_id, user_id, rating, comment, review_date)
VALUES
(1, 4, 5, '신선하고 매우 만족스러운 상품입니다!', '2024-02-01 10:30:00'),
(2, 4, 4, '상품 품질은 좋았지만 배송이 조금 늦었습니다.', '2024-02-02 12:15:00');

