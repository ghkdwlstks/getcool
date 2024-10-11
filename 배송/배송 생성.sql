CREATE TABLE delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,  -- 고유 배송 ID (기본 키)
    order_id INT,  -- 주문 ID (Order 테이블 참조)
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),  -- order 테이블의 order_id를 참조하는 외래키
    delivery_address VARCHAR(255),  -- 배송지 주소
    delivery_status ENUM('배송 준비', '배송 중', '배송 완료') NOT NULL,  -- 배송 상태
    delivery_date DATETIME  -- 배송 완료 날짜
);
