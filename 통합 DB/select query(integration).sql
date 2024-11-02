-- 2024.10.16 integration
-- 2024. 11. 02 last updates
-- 데이터 조회
-- select * from product;
-- select * from user;
-- select * from category;
-- select * from `order`;


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
WHERE buyer_id = ?;
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
SELECT c.buyer_id, c.product_id, p.product_name, p.discounted_price, c.quantity
FROM cart c
JOIN product p ON c.product_id = p.product_id
WHERE c.buyer_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리

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

-- 1. 모든 사용자 데이터 조회
SELECT * 
FROM user;

-- 2. 특정 사용자 이름으로 조회 ('홍길동'이라는 이름을 가진 사용자)
SELECT * 
FROM user
WHERE name = '홍길동';

-- 3. 특정 이메일로 조회 ('example@example.com' 이메일을 가진 사용자)
SELECT * 
FROM user
WHERE email = 'chulsu@example.com';

-- 4. 특정 사용자 유형으로 조회 ('판매자' 유형 사용자)
SELECT * 
FROM user
WHERE user_type = '판매자';

-- 5. 전화번호가 있는 사용자만 조회
SELECT * 
FROM user
WHERE phone_number IS NOT NULL;

-- 6. 최근에 등록한 사용자 10명 조회 (등록일 기준으로 내림차순 정렬 후 10명)
SELECT * 
FROM user
ORDER BY registration_date DESC
LIMIT 10;

-- 7. 특정 날짜(2024-10-01)에 등록된 사용자 조회
SELECT * 
FROM user
WHERE registration_date = '2024-10-01';

-- 8. 이름, 이메일, 사용자 유형만 조회
SELECT name, email, user_type 
FROM user;

-- 9. 주소에 '서울'이 포함된 사용자 조회
SELECT * 
FROM user
WHERE address LIKE '%서울%';

-- 10. 소비자 유형의 사용자 중 전화번호가 있는 사용자 조회
SELECT * 
FROM user
WHERE user_type = '소비자' 
  AND phone_number IS NOT NULL;
  
  -- 1. 전체 주문과 해당하는 주문 상세 정보를 조회
SELECT 
    o.order_id,         -- 주문 ID
    o.buyer_id,          -- 사용자 ID
    o.order_date,       -- 주문 날짜
    o.total_amount,     -- 총 주문 금액
    o.order_status,     -- 주문 상태
    od.product_id,      -- 상품 ID
    od.quantity,        -- 주문 수량
    od.price_at_purchase -- 구매 당시 상품 가격
FROM 
    `order` o
JOIN 
    order_detail od ON o.order_id = od.order_id; -- 주문과 주문 상세 정보 조인

-- 2. 특정 사용자(user_id = 3)의 모든 주문과 주문 상세 정보 조회
SELECT 
    o.order_id,
    o.buyer_id,
    o.order_date,
    o.total_amount,
    o.order_status,
    od.product_id,
    od.quantity,
    od.price_at_purchase
FROM 
    `order` o
JOIN 
    order_detail od ON o.order_id = od.order_id
WHERE 
    o.buyer_id = 3; -- 특정 사용자 ID 필터링

-- 3. 주문 상태가 '배송 완료'인 주문과 주문 상세 정보 조회
SELECT 
    o.order_id,
    o.buyer_id,
    o.order_date,
    o.total_amount,
    o.order_status,
    od.product_id,
    od.quantity,
    od.price_at_purchase
FROM 
    `order` o
JOIN 
    order_detail od ON o.order_id = od.order_id
WHERE 
    o.order_status = '배송 완료'; -- '배송 완료' 상태 필터링

-- 4. 주문 금액이 100,000 이상인 주문과 해당 주문의 주문 상세 정보 조회
SELECT 
    o.order_id,
    o.total_amount,
    od.product_id,
    od.quantity,
    od.price_at_purchase
FROM 
    `order` o
JOIN 
    order_detail od ON o.order_id = od.order_id
WHERE 
    o.total_amount >= 100000; -- 총 주문 금액 필터링

-- 5. 특정 날짜(예: 2024-10-01) 이후 주문된 상품들에 대한 상세 정보 조회
SELECT 
    o.order_id,
    o.order_date,
    od.product_id,
    od.quantity,
    od.price_at_purchase
FROM 
    `order` o
JOIN 
    order_detail od ON o.order_id = od.order_id
WHERE 
    o.order_date >= '2024-10-01'; -- 특정 날짜 이후의 주문 필터링
