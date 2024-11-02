-- 2024. 10. 16 integration
-- 2024. 11. 02 last updates
-- SQL delete

# edit_Minfo.html, edit_info.html
# 회원 정보 삭제 , 등록 상품 및 리뷰 작성도 모두 같이 삭제됨
DELETE FROM user
WHERE user_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리

# wishlist.html
# 장바구니 제거
DELETE FROM cart
WHERE buyer_id = ? AND product_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리
    
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
WHERE buyer_id = 1;

-- 특정 사용자 정보 삭제 (예: user_id가 1인 경우)
DELETE FROM user
WHERE user_id = 1;

-- 특정 이메일을 가진 사용자 정보 삭제 (예: 이메일이 'chulsoo@example.com'인 경우)
DELETE FROM user
WHERE email = 'chulsoo@example.com';

-- 배송 정보 삭제 (배송 ID로 삭제)
DELETE FROM delivery
WHERE delivery_id = ?;
    -- ? : Node.js에서 삭제하려는 배송 ID가 들어가는 자리

-- 배송 정보 삭제 (주문 ID로 삭제)
DELETE FROM delivery
WHERE order_id = ?;
    -- ? : Node.js에서 삭제하려는 주문 ID가 들어가는 자리
