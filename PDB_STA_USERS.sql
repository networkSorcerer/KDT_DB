--create table users : �����÷� ����
CREATE TABLE users (
	user_id 	varchar2(20)		NOT NULL,
	user_pwd	varchar2(30)		NOT NULL,
	user_name	varchar2(50)		NOT NULL,
	user_phone	varchar2(20)		NOT NULL,
	user_email	varchar2(50)		NOT NULL,
	user_act	number	DEFAULT 1	NOT NULL,
	user_repcnt	number	DEFAULT 0	NOT NULL,
	user_date	date	DEFAULT sysdate	NOT NULL,
	user_volcnt	number	DEFAULT 0	NOT NULL,
	user_adoptchk	number	DEFAULT 0	NOT NULL
);

--set primary key
ALTER TABLE users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	user_id
);

-- ���� ���� ���� ������ : �ڵ�����ȣ ������ ���� ���� ����
insert all 
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member01', 'password', '�迵��', '01011111111', 'member01@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member02', 'password', '�迵��', '01022222222', 'member02@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member03', 'password', '�迵��', '01033333333', 'member03@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member04', 'password', '�迵��', '01044444444', 'member04@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member05', 'password', '�迵��', '01055555555', 'member05@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member06', 'password', '�迵��', '01066666666', 'member06@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member07', 'password', '�迵ĥ', '01077777777', 'member07@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member08', 'password', '�迵��', '01088888888', 'member08@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member09', 'password', '�迵��', '01099999999', 'member09@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member10', 'password', '���Ͽ�', '01010101010', 'member10@naver.com')
select * from dual;

-- �����׽�Ʈ ������(��ü �÷� ���� ������ 55�� ���ڵ�)
insert all
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february24', 'password', 'Ȳ���', '01059613308', 'february24@naver.com', '2024-02-01', 1, 0, 30, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('august22', 'password', '������', '01051858986', 'august22@daum.net', '2024-01-01', 1, 0, 30, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july31', 'password', '������', '01900797907', 'july31@naver.com', '2024-01-01', 1, 0, 30, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('may12', 'password', '����ȣ', '01049549508', 'may12@gmail.com', '2023-12-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october3', 'password', '������', '01719728387', 'october3@gmail.com', '2023-10-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september19', 'password', '������', '01048548022', 'september19@gmail.com', '2024-02-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july11', 'password', '�ǹ���', '01175348361', 'july11@naver.com', '2023-11-01', 1, 2, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february1', 'password', '������', '01184321809', 'february1@gmail.com', '2024-02-01', 1, 1, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november24', 'password', '�ѹΰ�', '01074544982', 'november24@naver.com', '2024-03-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september16', 'password', '������', '01104936341', 'september16@daum.net', '2023-11-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september13', 'password', '������', '01760465706', 'september13@naver.com', '2023-12-01', 1, 0, 20, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november1', 'password', 'Ȳ����', '01038544196', 'november1@naver.com', '2024-03-01', 1, 2, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july6', 'password', '������', '01176035210', 'july6@naver.com', '2023-10-01', 1, 2, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('january8', 'password', '������', '01607967859', 'january8@gmail.com', '2024-03-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march30', 'password', '�ֽ¹�', '01674195467', 'march30@gmail.com', '2023-12-01', 1, 1, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june6', 'password', '������', '01915452393', 'june6@gmail.com', '2024-03-01', 1, 1, 20, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('august29', 'password', '�̽���', '01747037558', 'august29@gmail.com', '2023-10-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december3', 'password', '�ǿ���', '01765001823', 'december3@gmail.com', '2024-01-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november12', 'password', '�迵��', '01786247971', 'november12@gmail.com', '2024-02-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july24', 'password', '�Ž¿�', '01163242271', 'july24@gmail.com', '2024-03-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november14', 'password', 'ȫ����', '01721568062', 'november14@gmail.com', '2024-01-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june16', 'password', '�ӹ�ȣ', '01022198886', 'june16@naver.com', '2023-10-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october7', 'password', '���ο�', '01171132581', 'october7@gmail.com', '2024-03-01', 1, 1, 10, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april4', 'password', 'ȫ����', '01967233843', 'april4@gmail.com', '2023-12-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september21', 'password', '������', '01979758872', 'september21@naver.com', '2023-11-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september9', 'password', '����ȣ', '01112511206', 'september9@naver.com', '2023-10-01', 1, 2, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('january3', 'password', '������', '01082573129', 'january3@daum.net', '2024-03-01', 1, 1, 10, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('august30', 'password', '�ֽ���', '01968891010', 'august30@daum.net', '2023-11-01', 1, 1, 3, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september8', 'password', '�ż���', '01735313674', 'september8@naver.com', '2024-02-01', 1, 2, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july4', 'password', '������', '01958232395', 'july4@gmail.com', '2023-12-01', 1, 2, 3, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june27', 'password', 'ȫ����', '01007080963', 'june27@naver.com', '2023-12-01', 1, 1, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june21', 'password', '������', '01680577273', 'june21@naver.com', '2024-02-01', 1, 0, 3, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april26', 'password', '������', '01905154153', 'april26@naver.com', '2023-11-01', 1, 1, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september28', 'password', 'ȫ����', '01798766276', 'september28@gmail.com', '2024-02-01', 1, 0, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march9', 'password', '������', '01697723896', 'march9@daum.net', '2023-11-01', 1, 1, 2, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october29', 'password', '������', '01033044775', 'october29@daum.net', '2024-02-01', 1, 0, 2, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march5', 'password', '�Ǽ���', '01118512843', 'march5@daum.net', '2024-03-01', 1, 1, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april13', 'password', '�Ѽ���', '01941812094', 'april13@naver.com', '2024-02-01', 1, 1, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december6', 'password', '�ǽ¿�', '01701998752', 'december6@daum.net', '2023-12-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november15', 'password', '�ȼ���', '01141519529', 'november15@daum.net', '2024-03-01', 1, 0, 0, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november20', 'password', '�ȹ̿�', '01657918229', 'november20@naver.com', '2024-02-01', 1, 1, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february28', 'password', 'ȫ����', '01927411687', 'february28@naver.com', '2024-02-01', 1, 2, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april23', 'password', '������', '01783989902', 'april23@gmail.com', '2024-02-01', 1, 2, 0, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september15', 'password', '�Ž¹�', '01982200268', 'september15@naver.com', '2024-03-01', 1, 0, 2, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march11', 'password', '������', '01754812797', 'march11@gmail.com', '2023-10-01', 1, 1, 0, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september5', 'password', '������', '01019605947', 'september5@gmail.com', '2024-02-01', 2, 3, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december29', 'password', '������', '01035514424', 'december29@naver.com', '2024-01-01', 2, 3, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april16', 'password', '������', '01765549245', 'april16@daum.net', '2024-03-01', 2, 3, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december25', 'password', '��̿�', '01149345495', 'december25@naver.com', '2024-02-01', 2, 3, 0, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february23', 'password', '������', '01007695449', 'february23@naver.com', '2024-03-01', 2, 3, 0, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('january7', 'password', '������', '01915876324', 'january7@naver.com', '2023-10-01', 0, 2, 1, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february19', 'password', '����ȣ', '01770431531', 'february19@naver.com', '2023-12-01', 0, 2, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february10', 'password', '������', '01745618299', 'february10@daum.net', '2024-01-01', 0, 2, 2, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november6', 'password', '������', '01603075215', 'november6@daum.net', '2023-10-01', 0, 2, 1, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october2', 'password', '������', '01002312264', 'october2@naver.com', '2024-02-01', 0, 0, 0, 1)
select * from dual;
--commit;
select * from users order by user_id;


--------------------------------------------------------------------------------
--create table admin
CREATE TABLE admin (
	admin_id	varchar2(20)		NOT NULL,
	admin_pwd	varchar2(30)		NOT NULL
);

--set primary key
ALTER TABLE admin ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	admin_id
);

-- ������ ������
insert into admin (admin_id, admin_pwd)
values('admin', 'admin1234');

--commit;
select * from admin;