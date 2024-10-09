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
WHERE email = 'example@example.com';

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
    o.user_id,          -- 사용자 ID
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
    o.user_id,
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
    o.user_id = 3; -- 특정 사용자 ID 필터링

-- 3. 주문 상태가 '배송 완료'인 주문과 주문 상세 정보 조회
SELECT 
    o.order_id,
    o.user_id,
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



