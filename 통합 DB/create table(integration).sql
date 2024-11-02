-- 2024.10.16 integration
-- getcool DB 이름 : getcoolDB2로 설정
-- CREATE DATABASE getcoolDB;
-- USE getcoolDB;

CREATE TABLE category (
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name varchar(100) NOT NULL
);

CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,  -- 고유 사용자 ID (기본 키)
    name VARCHAR(100) NOT NULL,               -- 사용자 이름 (최대 100자)
    email VARCHAR(100) UNIQUE NOT NULL,       -- 사용자 이메일 주소 (고유값)
    password VARCHAR(255) NOT NULL,           -- 암호화된 비밀번호
    user_type ENUM('판매자', '소비자') NOT NULL, -- 사용자 유형 ('판매자' 또는 '소비자')
    phone_number VARCHAR(20),                 -- 전화번호
    address VARCHAR(255),                     -- 사용자 주소
    registration_date DATE NOT NULL           -- 사용자 등록일
);

create table product (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES user(user_id),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    expiration_date DATE NOT NULL,
    discounted_price DECIMAL(10,2),
    description TEXT,
    created_at DATETIME NOT NULL
);
-- user 삭제 시, 상품도 함께 삭제
ALTER TABLE product
ADD CONSTRAINT fk_seller
FOREIGN KEY (seller_id) REFERENCES user(user_id)
ON DELETE CASCADE;

-- 판매자의 user_id만 seller_id가 될 수 있도록 트리거
DELIMITER //
CREATE TRIGGER check_seller_id
BEFORE INSERT ON product
FOR EACH ROW
BEGIN
    DECLARE seller_type ENUM('판매자', '소비자');
    
    -- 'seller_id'에 해당하는 'user'의 'user_type'을 조회합니다.
    SELECT user_type INTO seller_type 
    FROM user 
    WHERE user_id = NEW.seller_id;
    
    -- 'user_type'이 '판매자'가 아니면 에러를 발생시킵니다.
    IF seller_type != '판매자' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'seller_id must refer to a user with user_type "판매자"';
    END IF;
END //
DELIMITER ;

CREATE TABLE review (
	reveiw_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    buyer_id INT,
    FOREIGN KEY (buyer_id) REFERENCES user(user_id),
    rating INT NOT NULL,
    comment TEXT NOT NULL,
    review_date datetime NOT NULL
);
-- user 삭제 시, 리뷰도 함께 삭제
ALTER TABLE review
ADD CONSTRAINT fk_user
FOREIGN KEY (buyer_id) REFERENCES user(user_id)
ON DELETE CASCADE;

#review테이블의 buyer_id는 user_id의 '소비자'만 들어갈 수 있도록 트리거
DELIMITER //

CREATE TRIGGER check_review_user_is_consumer
BEFORE INSERT ON review
FOR EACH ROW
BEGIN
    DECLARE user_type ENUM('판매자', '소비자');
    
    -- 'user_id'에 해당하는 'user_type'을 조회
    SELECT user_type INTO user_type 
    FROM user 
    WHERE user_id = NEW.buyer_id;

    -- 'user_type'이 '소비자'가 아니면 에러 발생
    IF user_type != '소비자' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'user_id must refer to a user with user_type "소비자" to leave a review';
    END IF;
END //

DELIMITER ;

# 장바구니 테이블
CREATE TABLE cart (
	cart_id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (buyer_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER check_cart_buyer_is_consumer
BEFORE INSERT ON cart
FOR EACH ROW
BEGIN
    DECLARE buyer_type ENUM('판매자', '소비자');
    
    -- 'buyer_id'에 해당하는 'user_type'을 조회
    SELECT user_type INTO buyer_type 
    FROM user 
    WHERE user_id = NEW.buyer_id;

    -- 'user_type'이 '소비자'가 아니면 에러 발생
    IF buyer_type != '소비자' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'buyer_id must refer to a user with user_type "소비자" to add to the cart';
    END IF;
END //

DELIMITER ;


CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,  -- 고유 주문 ID (기본 키)
    buyer_id INT NOT NULL,                     -- 소비자 ID (User 테이블 참조)
    order_date DATETIME NOT NULL,             -- 주문 날짜 및 시간
    total_amount DECIMAL(10, 2) NOT NULL,     -- 주문 총액
    order_status ENUM('주문 대기', '주문 완료') NOT NULL, -- 주문 상태
    FOREIGN KEY (buyer_id) REFERENCES user(user_id) -- 외래 키 (User 테이블의 user_id 참조)
);

#'소비자'만 order에 들어갈 수 있도록 트리거
DELIMITER //
CREATE TRIGGER check_buyer_is_consumer
BEFORE INSERT ON `order`
FOR EACH ROW
BEGIN
    DECLARE buyer_type ENUM('판매자','소비자');

    -- 삽입하려는 buyer_id에 해당하는 user_type을 조회
    SELECT user_type INTO buyer_type
    FROM user
    WHERE user_id = NEW.buyer_id;

    -- 만약 user_type이 '소비자'가 아니면 에러 발생
    IF buyer_type != '소비자' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Buyer must be a 소비자';
    END IF;
END; //
DELIMITER ;

CREATE TABLE order_detail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,  -- 고유 주문 상세 ID (기본 키)
    order_id INT NOT NULL,                          -- 주문 ID (Order 테이블 참조)
    product_id INT NOT NULL,                        -- 상품 ID (Product 테이블 참조)
    quantity INT NOT NULL,                          -- 주문한 상품 수량
    price_at_purchase DECIMAL(10, 2) NOT NULL,      -- 주문 당시 상품 가격
    FOREIGN KEY (order_id) REFERENCES `order`(order_id), -- 외래 키 (Order 테이블의 order_id 참조)
    FOREIGN KEY (product_id) REFERENCES product(product_id) -- 외래 키 (Product 테이블의 product_id 참조)
);

CREATE TABLE delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,  -- 고유 배송 ID (기본 키)
    order_id INT,  -- 주문 ID (Order 테이블 참조)
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),  -- order 테이블의 order_id를 참조하는 외래키
    delivery_address VARCHAR(255),  -- 배송지 주소
    delivery_status ENUM('배송 준비', '배송 중', '배송 완료') NOT NULL,  -- 배송 상태
    delivery_date DATETIME  -- 배송 완료 날짜
);
