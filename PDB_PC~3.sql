--카테도리 테이블 더미데이터--
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (1, 'CPU', 'CPU 관련 상품들');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (2, 'GPU', 'GPU 관련 상품들');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (3, '메인보드', '메인보드 관련 상품들');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (4, 'RAM', 'RAM 관련 상품들');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (5, 'SSD', 'SSD 관련 상품들');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (6, '파워', '파워 관련 상품들');

--프로덕트 테이블 더미데이터--
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i9-14900K', '고성능 인텔 CPU', 700000, 100, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i7-14700', '중고급형 인텔 CPU', 500000, 100, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i5-14500', '가성비 인텔 CPU', 350000, 150, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i5-14400', '효율적인 인텔 CPU', 270000, 200, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i3-14100', '기본 성능의 인텔 CPU', 160000, 250, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i7-13700', '고급형 인텔 CPU', 450000, 120, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i5-13500', '우수한 가성비 인텔 CPU', 350000, 180, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i5-13400', '중급형 인텔 CPU', 240000, 220, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i5-12400', '저가형 인텔 CPU', 150000, 300, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('코어 i3-12100', '엔트리 레벨 인텔 CPU', 120000, 350, NULL, 1);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('지포스 RTX4090', '최고 성능의 그래픽카드', 3000000, 50, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('지포스 RTX4080 SUPER', '하이엔드 그래픽카드', 1700000, 80, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('지포스 RTX4080', '강력한 성능의 그래픽카드', 1500000, 100, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('지포스 RTX4070 Ti', '고급형 그래픽카드', 1250000, 120, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('지포스 RTX4070', '중급형 그래픽카드', 800000, 150, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('지포스 RTX4060 Ti', '합리적인 가격의 그래픽카드', 600000, 180, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('지포스 RTX4060', '가성비 좋은 그래픽카드', 400000, 250, NULL, 2);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('인텔 B760', '인텔 중급형 메인보드', 190000, 150, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('인텔 H610', '엔트리 레벨 인텔 메인보드', 80000, 200, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD X670E', 'AMD 고급형 메인보드', 420000, 80, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD B650', 'AMD 중급형 메인보드', 150000, 150, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD A620', 'AMD 저가형 메인보드', 100000, 200, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD A520', '기본형 AMD 메인보드', 70000, 250, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD B550', 'AMD 중급형 메인보드', 150000, 180, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD B450', '기본형 AMD 메인보드', 70000, 220, NULL, 3);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR4 8GB', '기본형 DDR4 RAM', 20000, 500, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR4 16GB', '중급형 DDR4 RAM', 40000, 400, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR4 32GB', '고용량 DDR4 RAM', 80000, 300, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR5 8GB', '기본형 DDR5 RAM', 30000, 450, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR5 16GB', '중급형 DDR5 RAM', 50000, 350, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR5 32GB', '고용량 DDR5 RAM', 120000, 200, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR5 64GB', '대용량 DDR5 RAM', 350000, 80, NULL, 4);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('256GB SSD', '저장 공간이 적은 SSD', 20000, 500, NULL, 5);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('512GB NVMe SSD', '빠른 속도의 NVMe SSD', 50000, 400, NULL, 5);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('1TB NVMe SSD', '대용량 NVMe SSD', 120000, 300, NULL, 5);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('2TB NVMe SSD', '초고속 대용량 NVMe SSD', 200000, 150, NULL, 5);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('정격 500W', '500W 용량의 정격 파워', 50000, 400, NULL, 6);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('정격 600W', '600W 용량의 정격 파워', 60000, 350, NULL, 6);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('정격 700W', '700W 용량의 정격 파워', 80000, 300, NULL, 6);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('정격 800W', '800W 용량의 정격 파워', 100000, 200, NULL, 6);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('정격 1000W', '1000W 용량의 정격 파워', 200000, 150, NULL, 6);