-- create 2024. 10. 04 , shihyun
-- update 2024. 10. 11 , shihyun

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
