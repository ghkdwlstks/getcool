-- create 2024. 10. 04
-- update 2024. 10. 04

# index.html
# 상품 등록
INSERT INTO product (seller_id, category_id, product_name, price, stock_quantity, expiration_date, discounted_price, description, created_at)
VALUES 
(?, ?, ?, ?, ?, ?, ?, ?, NOW());
	-- ? : Nods.js의 검색어 들어가는 자리
    
