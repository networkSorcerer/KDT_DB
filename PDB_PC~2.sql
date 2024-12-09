-- 각 테이블의 id값 자동 생성을 위한 코드
-- 시퀀스 생성
CREATE SEQUENCE USER_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CATEGORY_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PRODUCT_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ORDER_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ORDER_DETAIL_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ADMIN_LOG_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CUSTOM_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CUSTOM_DETAIL_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CART_ITEM_SEQ START WITH 1 INCREMENT BY 1;


CREATE OR REPLACE TRIGGER trg_user_id
BEFORE INSERT ON USERS
FOR EACH ROW
BEGIN
   IF :new.user_id IS NULL THEN
      SELECT USER_SEQ.NEXTVAL
      INTO :new.user_id
      FROM dual;
   END IF;
END;

CREATE OR REPLACE TRIGGER trg_category_id
BEFORE INSERT ON CATEGORIES
FOR EACH ROW
BEGIN
   IF :new.category_id IS NULL THEN
      SELECT CATEGORY_SEQ.NEXTVAL
      INTO :new.category_id
      FROM dual;
   END IF;
END;

CREATE OR REPLACE TRIGGER trg_product_id
BEFORE INSERT ON PRODUCTS
FOR EACH ROW
BEGIN
   IF :new.product_id IS NULL THEN
      SELECT PRODUCT_SEQ.NEXTVAL
      INTO :new.product_id
      FROM dual;
   END IF;
END;

CREATE OR REPLACE TRIGGER trg_review_id
BEFORE INSERT ON REVIEWS
FOR EACH ROW
BEGIN
   IF :new.review_id IS NULL THEN
      SELECT REVIEW_SEQ.NEXTVAL
      INTO :new.review_id
      FROM dual;
   END IF;
END;

CREATE OR REPLACE TRIGGER trg_log_id
BEFORE INSERT ON ADMIN_LOGS
FOR EACH ROW
BEGIN
   IF :new.log_id IS NULL THEN
      SELECT ADMIN_LOG_SEQ.NEXTVAL
      INTO :new.log_id
      FROM dual;
   END IF;
END;

CREATE OR REPLACE TRIGGER trg_custom_id
BEFORE INSERT ON CUSTOM_ORDERS
FOR EACH ROW
BEGIN
   IF :new.custom_id IS NULL THEN
      SELECT CUSTOM_SEQ.NEXTVAL
      INTO :new.custom_id
      FROM dual;
   END IF;
END;

CREATE OR REPLACE TRIGGER trg_custom_detail_id
BEFORE INSERT ON CUSTOM_ORDER_DETAILS
FOR EACH ROW
BEGIN
   IF :new.detail_id IS NULL THEN
      SELECT CUSTOM_DETAIL_SEQ.NEXTVAL
      INTO :new.detail_id
      FROM dual;
   END IF;
END;

CREATE OR REPLACE TRIGGER trg_order_id
BEFORE INSERT ON ORDERS
FOR EACH ROW
BEGIN
   IF :new.order_id IS NULL THEN
      SELECT ORDER_SEQ.NEXTVAL
      INTO :new.order_id
      FROM dual;
   END IF;
END;

CREATE OR REPLACE TRIGGER trg_order_detail_id
BEFORE INSERT ON ORDER_DETAILS
FOR EACH ROW
BEGIN
   IF :new.detail_id IS NULL THEN
      SELECT ORDER_DETAIL_SEQ.NEXTVAL
      INTO :new.detail_id
      FROM dual;
   END IF;
END;


CREATE OR REPLACE TRIGGER trg_cart_item_id
BEFORE INSERT ON CART_ITEMS
FOR EACH ROW
BEGIN
   IF :new.cart_item_id IS NULL THEN
      SELECT CART_ITEM_SEQ.NEXTVAL
      INTO :new.cart_item_id
      FROM dual;
   END IF;
END;