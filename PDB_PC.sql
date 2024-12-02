-- 시퀀스 생성(ID값 자동 생성)`
ALTER USER PC QUOTA UNLIMITED ON USERS;

GRANT SELECT, INSERT, UPDATE, DELETE ON USERS TO PC;
CREATE SEQUENCE USER_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CATEGORY_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PRODUCT_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ORDER_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ORDER_DETAIL_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ADMIN_LOG_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CUSTOM_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CUSTOM_DETAIL_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CART_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CART_ITEM_SEQ START WITH 1 INCREMENT BY 1;
alter table users add address varchar2(255);
alter table users add phone_number varchar2(20);
alter table users add id varchar2(50);
select * from users;
delete from users where user_id = 4;
ALTER TABLE USERS
DROP COLUMN id;

-- 사용자 테이블
CREATE TABLE USERS (
    user_id NUMBER PRIMARY KEY,  -- 사용자 ID (자동 생성)
    username  VARCHAR2(30),  -- 사용자 이름
    password VARCHAR2(64),  -- 비밀번호 (암호화된 형태로 저장)
    email VARCHAR2(150) UNIQUE,  -- 이메일 (유니크 제약)
    role VARCHAR2(50) DEFAULT 'USER'  -- 사용자 역할 (기본값: 'USER')
);

-- 카테고리 테이블
CREATE TABLE CATEGORIES (
    category_id NUMBER PRIMARY KEY,  -- 카테고리 ID (자동 생성)
    name VARCHAR2(30),  -- 카테고리 이름
    description VARCHAR2(4000)  -- 카테고리 설명
);

-- 상품 테이블
CREATE TABLE PRODUCTS (
    product_id NUMBER PRIMARY KEY,  -- 상품 ID (자동 생성)
    name VARCHAR2(30),  -- 상품 이름
    description VARCHAR2(4000),  -- 상품 설명
    price NUMBER(10, 2) CHECK (price >= 0),  -- 상품 가격 (0 이상)
    stock NUMBER(5) CHECK (stock >= 0),  -- 상품 재고 (0 이상)
    image_url VARCHAR2(512),  -- 상품 이미지 URL
    category_id NUMBER NOT NULL,  -- 카테고리 ID (필수)
    CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id)  -- 카테고리 테이블과 연동
);



-- 리뷰 테이블
CREATE TABLE REVIEWS (
    review_id NUMBER PRIMARY KEY,  -- 리뷰 ID (자동 생성)
    rating NUMBER CHECK (rating BETWEEN 1 AND 5),  -- 평점 (1~5 사이)
    review_comment VARCHAR2(4000),  -- 리뷰 내용
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 리뷰 작성 시간 (기본값: 현재 시간)
    product_id NUMBER NOT NULL,  -- 상품 ID (필수)
    user_id NUMBER NOT NULL,  -- 사용자 ID (필수)
    CONSTRAINT FK_REVIEW_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id),  -- 상품 테이블과 연동
    CONSTRAINT FK_REVIEW_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- 사용자 테이블과 연동
);

-- 관리자 로그 테이블
CREATE TABLE ADMIN_LOGS (
    log_id NUMBER PRIMARY KEY,  -- 로그 ID (자동 생성)
    action VARCHAR2(500),  -- 수행된 액션
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 로그 생성 시간 (기본값: 현재 시간)
    user_id NUMBER NOT NULL,  -- 사용자 ID (필수)
    CONSTRAINT FK_LOG_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- 사용자 테이블과 연동
);

-- 커스텀 주문 테이블
CREATE TABLE CUSTOM_ORDERS (
    custom_id NUMBER PRIMARY KEY,  -- 커스텀 주문 ID (자동 생성)
    total_price NUMBER(10, 2),  -- 커스텀 주문 총 금액
    user_id NUMBER NOT NULL,  -- 사용자 ID (필수)
    CONSTRAINT FK_CUSTOM_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- 사용자 테이블과 연동
);

-- 커스텀 주문 상세 테이블
CREATE TABLE CUSTOM_ORDER_DETAILS (
    detail_id NUMBER PRIMARY KEY,  -- 커스텀 주문 상세 ID (자동 생성)
    quantity NUMBER(5) CHECK (quantity > 0),  -- 수량 (0 이상)
    price NUMBER(10, 2) CHECK (price >= 0),  -- 가격 (0 이상)
    subtotal NUMBER(10, 2),  -- 소계 (수량 * 가격)
    custom_id NUMBER,  -- 커스텀 주문 ID
    product_id NUMBER,  -- 상품 ID
    CONSTRAINT FK_CUSTOM_DETAIL_ORDER FOREIGN KEY (custom_id) REFERENCES CUSTOM_ORDERS(custom_id),  -- 커스텀 주문 테이블과 연동
    CONSTRAINT FK_CUSTOM_DETAIL_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id)  -- 상품 테이블과 연동
);

-- 주문 테이블
CREATE TABLE ORDERS (
    order_id NUMBER PRIMARY KEY,  -- 주문 ID (자동 생성)
    total_price NUMBER(10, 2),  -- 총 주문 금액
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 주문 날짜 (기본값: 현재 시간)
    status VARCHAR2(50),  -- 주문 상태
    user_id NUMBER NOT NULL,  -- 사용자 ID (필수)
    CONSTRAINT FK_ORDER_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- 사용자 테이블과 연동
);

-- 주문 상세 테이블
CREATE TABLE ORDER_DETAILS (
    detail_id NUMBER PRIMARY KEY,  -- 주문 상세 ID (자동 생성)
    quantity NUMBER(5) CHECK (quantity > 0),  -- 주문 수량 (0 이상)
    price NUMBER(10, 2) CHECK (price >= 0),  -- 개별 상품 가격 (0 이상)
    subtotal NUMBER(10, 2),  -- 소계 (수량 * 가격)
    product_id NUMBER,  -- 상품 ID
    order_id NUMBER NOT NULL,  -- 주문 ID (필수)
    custom_id NUMBER,  -- 커스텀 주문 ID
    CONSTRAINT FK_ORDER_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id),  -- 상품 테이블과 연동
    CONSTRAINT FK_ORDER_ORDER FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),  -- 주문 테이블과 연동
    CONSTRAINT FK_ORDER_CUSTOM FOREIGN KEY (custom_id) REFERENCES CUSTOM_ORDERS(custom_id)  -- 커스텀 주문 테이블과 연동
);

-- 장바구니 테이블
CREATE TABLE CART (
    cart_id NUMBER PRIMARY KEY,  -- 장바구니 ID (자동 생성)
    user_id NUMBER NOT NULL,  -- 사용자 ID (필수)
    CONSTRAINT FK_CART_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- 사용자 테이블과 연동
);

-- 장바구니 아이템 테이블
CREATE TABLE CART_ITEMS (
    cart_item_id NUMBER PRIMARY KEY,  -- 장바구니 아이템 ID (자동 생성)
    cart_id NUMBER NOT NULL,  -- 장바구니 ID (필수)
    product_id NUMBER,  -- 상품 ID
    quantity NUMBER(5) CHECK (quantity > 0),  -- 수량 (0 이상)
    custom_id NUMBER,  -- 커스텀 주문 ID
    CONSTRAINT FK_CART_CART FOREIGN KEY (cart_id) REFERENCES CART(cart_id) ON DELETE CASCADE,  -- 장바구니 테이블과 연동 (장바구니 삭제 시 연관된 아이템 삭제)
    CONSTRAINT FK_CART_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id),  -- 상품 테이블과 연동
    CONSTRAINT FK_CART_CUSTOM FOREIGN KEY (custom_id) REFERENCES CUSTOM_ORDERS(custom_id)
    );
