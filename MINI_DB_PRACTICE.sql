CREATE TABLE mini_member (
	email varchar2(30) PRIMARY KEY,
	password varchar2(30) NOT NULL,
	name varchar2(30) NOT NULL,
	reg_date DATE DEFAULT SYSDATE
);

INSERT INTO mini_member (email, password, name, reg_date) VALUES ('yujin@example.com', 'securepass123', '������', SYSDATE);
INSERT INTO mini_member (email, password, name, reg_date) VALUES ('ga_eul@example.com', 'securepass456', '����', SYSDATE);
INSERT INTO mini_member (email, password, name, reg_date) VALUES ('rei@example.com', 'securepass789', '����', SYSDATE);
INSERT INTO mini_member (email, password, name, reg_date) VALUES ('wonyoung@example.com', 'securepass101', '�����', SYSDATE);
INSERT INTO mini_member (email, password, name, reg_date) VALUES ('liz@example.com', 'securepass202', '����', SYSDATE);
INSERT INTO mini_member (email, password, name, reg_date) VALUES ('leeseo@example.com', 'securepass303', '�̼�', SYSDATE);

SELECT * FROM mini_member;

SELECT email, name reg_date FROM mini_member;

SELECT COUNT(*) FROM mini_member WHERE email = 'yujin@example.com';