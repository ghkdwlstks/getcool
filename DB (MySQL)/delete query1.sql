-- create 2024. 10. 04, shihyun
-- update 2024. 10. 04, shihyun

-- SQL delete

# edit_Minfo.html, edit_info.html
# 회원 정보 삭제 , 등록 상품 및 리뷰 작성도 모두 같이 삭제됨
DELETE FROM user
WHERE user_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리

# wishlist.html
# 장바구니 제거
DELETE FROM cart
WHERE user_id = ? AND product_id = ?;
	-- ? : Nods.js의 검색어 들어가는 자리