-- 특정 주문 상세 정보 삭제 (예: order_detail_id가 1인 경우)
DELETE FROM order_detail 
WHERE order_detail_id = 1;

-- 특정 주문에 대한 모든 주문 상세 정보 삭제 (예: order_id가 1인 경우)
DELETE FROM order_detail 
WHERE order_id = 1;

-- 특정 주문 정보 삭제 (예: order_id가 1인 경우)
DELETE FROM `order`
WHERE order_id = 1;

-- 특정 사용자의 모든 주문 정보 삭제 (예: user_id가 1인 경우)
DELETE FROM `order`
WHERE user_id = 1;

-- 특정 사용자 정보 삭제 (예: user_id가 1인 경우)
DELETE FROM user
WHERE user_id = 1;

-- 특정 이메일을 가진 사용자 정보 삭제 (예: 이메일이 'chulsoo@example.com'인 경우)
DELETE FROM user
WHERE email = 'chulsoo@example.com';