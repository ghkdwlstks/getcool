-- 데이터베이스 이름 : getcoolDB로 설정(임시)
-- CREATE DATABASE getcoolDB;
USE getcoolDB;

/*
-- 외래키 설정되나 확인용
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_type ENUM('판매자', '소비자') NOT NULL,
    phone_number VARCHAR(20),
    address VARCHAR(255),
    registration_date DATE NOT NULL
);*/

CREATE TABLE category (
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name varchar(100) NOT NULL
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
