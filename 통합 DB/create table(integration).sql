-- 2024.10.16 integration
-- getcool DB 이름 : getcoolDB2로 설정
-- CREATE DATABASE getcoolDB2;
-- USE getcoolDB2;

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

CREATE TABLE review (
	reveiw_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    rating INT NOT NULL,
    comment TEXT NOT NULL,
    review_date datetime NOT NULL
);
-- user 삭제 시, 리뷰도 함께 삭제
ALTER TABLE review
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id) REFERENCES user(user_id)
ON DELETE CASCADE;

# 장바구니 테이블
CREATE TABLE cart (
	cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);


CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,  -- 고유 주문 ID (기본 키)
    user_id INT NOT NULL,                     -- 소비자 ID (User 테이블 참조)
    order_date DATETIME NOT NULL,             -- 주문 날짜 및 시간
    total_amount DECIMAL(10, 2) NOT NULL,     -- 주문 총액
    order_status ENUM('대기', '배송 중', '배송 완료') NOT NULL, -- 주문 상태
    FOREIGN KEY (user_id) REFERENCES user(user_id) -- 외래 키 (User 테이블의 user_id 참조)
);
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