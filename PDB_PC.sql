-- ������ ���̺� ����
-- ����� ���̺�
CREATE TABLE USERS (
    user_id NUMBER PRIMARY KEY,  -- ����� ID (�ڵ� ����)
    username VARCHAR2(30),  -- ����� �̸�
    password VARCHAR2(64),  -- ��й�ȣ (��ȣȭ�� ���·� ����)
    email VARCHAR2(150) UNIQUE,  -- �̸��� (����ũ ����)
    address VARCHAR2(255),  -- ����� �ּ�
    phone_number VARCHAR2(20)  -- ��ȭ��ȣ
    role VARCHAR2(50) DEFAULT 'USER'  -- ����� ���� (�⺻��: 'USER')
);

-- ī�װ��� ���̺�
CREATE TABLE CATEGORIES (
    category_id NUMBER PRIMARY KEY,  -- ī�װ��� ID (�ڵ� ����)
    name VARCHAR2(30),  -- ī�װ��� �̸�
    description VARCHAR2(4000)  -- ī�װ��� ����
);

-- ��ǰ ���̺�
CREATE TABLE PRODUCTS (
    product_id NUMBER PRIMARY KEY,  -- ��ǰ ID (�ڵ� ����)
    name VARCHAR2(30),  -- ��ǰ �̸�
    description VARCHAR2(4000),  -- ��ǰ ����
    price NUMBER(10, 2) CHECK (price >= 0),  -- ��ǰ ���� (0 �̻�)
    stock NUMBER(5) CHECK (stock >= 0),  -- ��ǰ ��� (0 �̻�)
    image_url VARCHAR2(512),  -- ��ǰ �̹��� URL
    category_id NUMBER NOT NULL,  -- ī�װ��� ID (�ʼ�)
    CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id)  -- ī�װ��� ���̺��� ����
);



-- ���� ���̺�
CREATE TABLE REVIEWS (
    review_id NUMBER PRIMARY KEY,  -- ���� ID (�ڵ� ����)
    rating NUMBER CHECK (rating BETWEEN 1 AND 5),  -- ���� (1~5 ����)
    review_comment VARCHAR2(4000),  -- ���� ����
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- ���� �ۼ� �ð� (�⺻��: ���� �ð�)
    product_id NUMBER NOT NULL,  -- ��ǰ ID (�ʼ�)
    user_id NUMBER NOT NULL,  -- ����� ID (�ʼ�)
    CONSTRAINT FK_REVIEW_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id),  -- ��ǰ ���̺��� ����
    CONSTRAINT FK_REVIEW_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- ����� ���̺��� ����
);

-- ������ �α� ���̺�
CREATE TABLE ADMIN_LOGS (
    log_id NUMBER PRIMARY KEY,  -- �α� ID (�ڵ� ����)
    action VARCHAR2(500),  -- ����� �׼�
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- �α� ���� �ð� (�⺻��: ���� �ð�)
    user_id NUMBER NOT NULL,  -- ����� ID (�ʼ�)
    CONSTRAINT FK_LOG_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- ����� ���̺��� ����
);

-- Ŀ���� �ֹ� ���̺�
CREATE TABLE CUSTOM_ORDERS (
    custom_id NUMBER PRIMARY KEY,  -- Ŀ���� �ֹ� ID (�ڵ� ����)
    total_price NUMBER(10, 2),  -- Ŀ���� �ֹ� �� �ݾ�
    user_id NUMBER NOT NULL,  -- ����� ID (�ʼ�)
    CONSTRAINT FK_CUSTOM_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- ����� ���̺��� ����
);

-- Ŀ���� �ֹ� �� ���̺�
CREATE TABLE CUSTOM_ORDER_DETAILS (
    detail_id NUMBER PRIMARY KEY,  -- Ŀ���� �ֹ� �� ID (�ڵ� ����)
    quantity NUMBER(5) CHECK (quantity > 0),  -- ���� (0 �̻�)
    price NUMBER(10, 2) CHECK (price >= 0),  -- ���� (0 �̻�)
    subtotal NUMBER(10, 2),  -- �Ұ� (���� * ����)
    custom_id NUMBER,  -- Ŀ���� �ֹ� ID
    product_id NUMBER,  -- ��ǰ ID
    CONSTRAINT FK_CUSTOM_DETAIL_ORDER FOREIGN KEY (custom_id) REFERENCES CUSTOM_ORDERS(custom_id),  -- Ŀ���� �ֹ� ���̺��� ����
    CONSTRAINT FK_CUSTOM_DETAIL_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id)  -- ��ǰ ���̺��� ����
);

-- �ֹ� ���̺�
CREATE TABLE ORDERS (
    order_id NUMBER PRIMARY KEY,  -- �ֹ� ID (�ڵ� ����)
    total_price NUMBER(10, 2),  -- �� �ֹ� �ݾ�
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- �ֹ� ��¥ (�⺻��: ���� �ð�)
    status VARCHAR2(50),  -- �ֹ� ����
    user_id NUMBER NOT NULL,  -- ����� ID (�ʼ�)
    CONSTRAINT FK_ORDER_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- ����� ���̺��� ����
);

-- �ֹ� �� ���̺�
CREATE TABLE ORDER_DETAILS (
    detail_id NUMBER PRIMARY KEY,  -- �ֹ� �� ID (�ڵ� ����)
    quantity NUMBER(5) CHECK (quantity > 0),  -- �ֹ� ���� (0 �̻�)
    price NUMBER(10, 2) CHECK (price >= 0),  -- ���� ��ǰ ���� (0 �̻�)
    subtotal NUMBER(10, 2),  -- �Ұ� (���� * ����)
    product_id NUMBER,  -- ��ǰ ID
    order_id NUMBER NOT NULL,  -- �ֹ� ID (�ʼ�)
    custom_id NUMBER,  -- Ŀ���� �ֹ� ID
    CONSTRAINT FK_ORDER_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id),  -- ��ǰ ���̺��� ����
    CONSTRAINT FK_ORDER_ORDER FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),  -- �ֹ� ���̺��� ����
    CONSTRAINT FK_ORDER_CUSTOM FOREIGN KEY (custom_id) REFERENCES CUSTOM_ORDERS(custom_id)  -- Ŀ���� �ֹ� ���̺��� ����
);


-- ��ٱ��� ������ ���̺�
CREATE TABLE CART_ITEMS (
    cart_item_id NUMBER PRIMARY KEY,  -- ��ٱ��� ������ ID (�ڵ� ����)
    user_id NUMBER NOT NULL,  -- ����� ID (�ʼ�)
    product_id NUMBER,  -- ��ǰ ID
    quantity NUMBER(5) CHECK (quantity > 0),  -- ���� (0 �̻�)
    custom_id NUMBER,  -- Ŀ���� �ֹ� ID
    CONSTRAINT FK_CART_USER FOREIGN KEY (user_id) REFERENCES USERS(user_id),  -- ����� ���̺��� ����
    CONSTRAINT FK_CART_PRODUCT FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id),  -- ��ǰ ���̺��� ����
    CONSTRAINT FK_CART_CUSTOM FOREIGN KEY (custom_id) REFERENCES CUSTOM_ORDERS(custom_id)  -- Ŀ���� �ֹ� ���̺��� ����
);
