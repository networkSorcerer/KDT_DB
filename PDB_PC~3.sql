--ī�׵��� ���̺� ���̵�����--
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (1, 'CPU', 'CPU ���� ��ǰ��');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (2, 'GPU', 'GPU ���� ��ǰ��');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (3, '���κ���', '���κ��� ���� ��ǰ��');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (4, 'RAM', 'RAM ���� ��ǰ��');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (5, 'SSD', 'SSD ���� ��ǰ��');
INSERT INTO CATEGORIES (category_id, name, description)
VALUES (6, '�Ŀ�', '�Ŀ� ���� ��ǰ��');

--���δ�Ʈ ���̺� ���̵�����--
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i9-14900K', '���� ���� CPU', 700000, 100, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i7-14700', '�߰���� ���� CPU', 500000, 100, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i5-14500', '������ ���� CPU', 350000, 150, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i5-14400', 'ȿ������ ���� CPU', 270000, 200, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i3-14100', '�⺻ ������ ���� CPU', 160000, 250, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i7-13700', '����� ���� CPU', 450000, 120, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i5-13500', '����� ������ ���� CPU', 350000, 180, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i5-13400', '�߱��� ���� CPU', 240000, 220, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i5-12400', '������ ���� CPU', 150000, 300, NULL, 1);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('�ھ� i3-12100', '��Ʈ�� ���� ���� CPU', 120000, 350, NULL, 1);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('������ RTX4090', '�ְ� ������ �׷���ī��', 3000000, 50, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('������ RTX4080 SUPER', '���̿��� �׷���ī��', 1700000, 80, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('������ RTX4080', '������ ������ �׷���ī��', 1500000, 100, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('������ RTX4070 Ti', '����� �׷���ī��', 1250000, 120, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('������ RTX4070', '�߱��� �׷���ī��', 800000, 150, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('������ RTX4060 Ti', '�ո����� ������ �׷���ī��', 600000, 180, NULL, 2);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('������ RTX4060', '������ ���� �׷���ī��', 400000, 250, NULL, 2);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('���� B760', '���� �߱��� ���κ���', 190000, 150, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('���� H610', '��Ʈ�� ���� ���� ���κ���', 80000, 200, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD X670E', 'AMD ����� ���κ���', 420000, 80, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD B650', 'AMD �߱��� ���κ���', 150000, 150, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD A620', 'AMD ������ ���κ���', 100000, 200, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD A520', '�⺻�� AMD ���κ���', 70000, 250, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD B550', 'AMD �߱��� ���κ���', 150000, 180, NULL, 3);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('AMD B450', '�⺻�� AMD ���κ���', 70000, 220, NULL, 3);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR4 8GB', '�⺻�� DDR4 RAM', 20000, 500, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR4 16GB', '�߱��� DDR4 RAM', 40000, 400, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR4 32GB', '��뷮 DDR4 RAM', 80000, 300, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR5 8GB', '�⺻�� DDR5 RAM', 30000, 450, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR5 16GB', '�߱��� DDR5 RAM', 50000, 350, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR5 32GB', '��뷮 DDR5 RAM', 120000, 200, NULL, 4);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('DDR5 64GB', '��뷮 DDR5 RAM', 350000, 80, NULL, 4);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('256GB SSD', '���� ������ ���� SSD', 20000, 500, NULL, 5);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('512GB NVMe SSD', '���� �ӵ��� NVMe SSD', 50000, 400, NULL, 5);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('1TB NVMe SSD', '��뷮 NVMe SSD', 120000, 300, NULL, 5);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('2TB NVMe SSD', '�ʰ�� ��뷮 NVMe SSD', 200000, 150, NULL, 5);

INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('���� 500W', '500W �뷮�� ���� �Ŀ�', 50000, 400, NULL, 6);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('���� 600W', '600W �뷮�� ���� �Ŀ�', 60000, 350, NULL, 6);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('���� 700W', '700W �뷮�� ���� �Ŀ�', 80000, 300, NULL, 6);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('���� 800W', '800W �뷮�� ���� �Ŀ�', 100000, 200, NULL, 6);
INSERT INTO PRODUCTS (name, description, price, stock, image_url, category_id)
VALUES ('���� 1000W', '1000W �뷮�� ���� �Ŀ�', 200000, 150, NULL, 6);