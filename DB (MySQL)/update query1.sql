-- create 2024. 10. 04, shihyun
-- update 2024. 10. 11, shihyun

-- Update DB

# order-info.html
# 사용자 주소 변경
UPDATE user
SET address = ?
WHERE user_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리
    
# product_info.html
# 상품 정보 수정
UPDATE product
SET product_name = ?,
	price = ?,
    description = ?
WHERE product_id = ?;

# 장바구니 수량 변경
UPDATE cart
SET quantity = ?
WHERE user_id = ? AND product_id = ?;