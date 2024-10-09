create	database test default character set UTF8;
SHOW DATABASES;
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