-- 배송 테이블 생성
CREATE TABLE delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    delivery_address VARCHAR(255),
    delivery_status ENUM('배송 준비', '배송 중', '배송 완료'),
    delivery_date DATETIME
);

-- 배송 데이터 삽입
INSERT INTO delivery (order_id, delivery_address, delivery_status, delivery_date) VALUES
(1, '서울특별시 강남구 테헤란로 123', '배송 준비', '2024-10-01 10:00:00'),
(2, '부산광역시 해운대구 해운대해변로 456', '배송 중', '2024-10-02 12:00:00'),
(3, '대구광역시 중구 동성로 789', '배송 완료', '2024-10-03 14:00:00');

-- 배송 데이터 조회
SELECT * FROM delivery;

-- 특정 배송 상태 조회
SELECT * FROM delivery WHERE delivery_status = '배송 중';

-- 배송 데이터 수정
UPDATE delivery
SET delivery_status = '배송 완료', delivery_date = NOW()
WHERE delivery_id = 2 AND delivery_status != '배송 중';  -- 배송 중인 경우 수정 불가

-- 배송 데이터 삭제
DELETE FROM delivery WHERE delivery_id = 3;
