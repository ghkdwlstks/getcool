-- 2024.10.04 create, shihyun
-- 2024.10.11 update, shihyun
-- 데이터 조회
-- select * from category;
select * from product;
-- select * from review;
-- select * from user;


# category0823.html
# 상품 조회 (검색창) : 상품명으로 검색, 기본 검색 조건 : 거리순 (거리순 --> 이름순)
SELECT p.product_id, p.product_name, p.price, p.discounted_price
FROM product p
WHERE p.product_name LIKE CONCAT('%', ? ,'%')
   -- ? : Nods.js의 검색어 들어가는 자리
   -- 품절상품 제외하기 버튼 클릭시 : 'AND p.stock_quantity > 0' 추가
ORDER BY product_name asc;
	-- 가격순 필터 적용시 'ORDER BY p.discounted_price ASC'

# category0823.html
# 카테고리 선택 (카테고리 nav) : 클릭시 카테고리에 따른 상품 조회, 기본 검색 조건 : 거리순 (거리순 --> 이름순)
SELECT p.product_id, p.product_name, p.price, p.discounted_price, category_id
FROM product p
WHERE p.category_id = ?
	-- ? : Nods.js의 검색어 들어가는 자리
    -- 품절상품 제외하기 버튼 클릭시 : 'AND p.stock_quantity > 0' 추가
ORDER BY product_name asc;
	-- 가격순 필터 적용시 'ORDER BY p.discounted_price ASC'
    
# ProductDetail.html
# 상품 상세 조회 --> 판매자명, 리뷰점수(평균), 리뷰수, 상품명, 원가, 할인가, 상품설명
SELECT 
	u.user_id,
	u.name AS seller_name,
    SUM(r.rating)/COUNT(r.rating) as avg_rating,
    COUNT(r.rating) as total_review,
    p.product_name,
    p.price,
    p.discounted_price,
    p.description
FROM product p
JOIN user u ON p.seller_id = u.user_id
JOIN review r ON p.product_id = r.product_id
WHERE p.product_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리

# ProductDetail.html
# 상품 상세 조회 시 추천 상품 --> 같은 카테고리 내 가격 낮은 상품 5개 조회
SELECT p.product_id, p.product_name, p.price, p.discounted_price
FROM product p
WHERE p.category_id = ? AND p.product_id != ?
	-- ? : Nods.js의 검색어 들어가는 자리
ORDER BY p.discounted_price ASC
LIMIT 5;

#edit_Minfo.html
# 판매자 정보 조회 (이름, 전화번호, 주소)
SELECT name, phone_number, address
from user
WHERE user_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리
    
# edit_info.html
# 사용자 정보 조회 (이름, 전화번호, email)
SELECT name, phone_number, email
from user
WHERE user_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리

# order-info.html
# 리뷰 수 조회
SELECT COUNT(*)
FROM review
WHERE user_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리

# product_info
# 상품 정보 조회
SELECT product_name, price, description
FROM product
WHERE product_id = ?; 
	-- ? : Nods.js의 검색어 들어가는 자리
    
# product_list.html
# 판매자의 상품 목록 조회
SELECT product_name, stock_quantity
FROM product
WHERE seller_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리
  
# product_list.html
# 판매자의 상품 목록 내 검색
SELECT product_name, stock_quantity
FROM product
WHERE seller_id = ? AND product_name LIKE CONCAT('%', ? ,'%')
ORDER BY product_name asc;
	-- ? : Nods.js의 검색어 들어가는 자리
    
# wishlist.html
# 사용자의 장바구니 조회
SELECT c.user_id, c.product_id, p.product_name, p.discounted_price, c.quantity
FROM cart c
JOIN product p ON c.product_id = p.product_id
WHERE c.user_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리
