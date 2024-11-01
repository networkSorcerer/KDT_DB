-----------------------------------------------------------------------------------------
--Animal 변경 사항 
alter table animal
add(readcnt number default 0);

alter table animal
add(animal_passwd number default 0);

alter table animal
add(animal_file varchar2(500));

--썸네일을 위한 필드
alter table animal
add(animal_thumb varchar2(500));



-- 1. 테이블 구조 변경 (새로운 컬럼 추가) --animal_temp를 select 로 변경했습니다
ALTER TABLE animal
ADD (animal_temp_new VARCHAR2(100));

-- 2. 새로운 컬럼에 기존 데이터 복사
UPDATE animal
SET animal_temp_new = TO_CHAR(animal_temp);

-- 3. 기존 컬럼 삭제
ALTER TABLE animal
DROP COLUMN animal_temp;

-- 4. 새로운 컬럼 이름 변경
ALTER TABLE animal
RENAME COLUMN animal_temp_new TO animal_temp;




-- 이미지 테이블의 animal_id 외래 키 제약 조건 삭제
ALTER TABLE image
DROP CONSTRAINT FK_animal_TO_image_1;

-- 이미지 테이블의 adoption_id 외래 키 제약 조건 삭제
ALTER TABLE image
DROP  CONSTRAINT FK_adoption_TO_image_1;

-- 상담 테이블의 adoption_id 외래 키 제약 조건 삭제
ALTER TABLE counseling
DROP CONSTRAINT FK_adoption_TO_counseling_1;

-- 입양 테이블의 animal_id 외래 키 제약 조건 삭제
ALTER TABLE adoption
DROP CONSTRAINT FK_animal_TO_adoption_1;

ALTER TABLE survey
DROP CONSTRAINT FK_COUNSELING_TO_SURVEY_1;



--animal을 지우면 image 지우기
ALTER TABLE image
ADD CONSTRAINT FK_animal_TO_image_1
FOREIGN KEY (animal_id)
REFERENCES adoption(animal_id)
ON DELETE CASCADE;

--adoption 지우면 image 지우기
ALTER TABLE image
ADD CONSTRAINT FK_adoption_TO_image_1
FOREIGN KEY (adoption_id)
REFERENCES adoption(adoption_id)
ON DELETE CASCADE;

--adoption 지우면 counseling 지우기
ALTER TABLE counseling
ADD CONSTRAINT FK_adoption_TO_counseling_1
FOREIGN KEY (adoption_id)
REFERENCES adoption(adoption_id)
ON DELETE CASCADE;

--animal 지우면 adoption 지우기 
ALTER TABLE adoption
ADD CONSTRAINT FK_animal_TO_adoption_1
FOREIGN KEY (animal_id)
REFERENCES animal(animal_id)
ON DELETE CASCADE;

ALTER TABLE survey
ADD CONSTRAINT FK_COUNSELING_TO_SURVEY_1
FOREIGN KEY (counseling_id)
REFERENCES counseling(counseling_id)
ON DELETE CASCADE;




--FK_animal_TO_adoption_1
--FK_adoption_TO_image_1
--FK_animal_TO_image_1
--FK_adoption_TO_counseling_1
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------



--Adoption 변경사항

alter table adoption
add(adoption_passwd number default 0);

alter table adoption
add(adoption_file varchar2(500));

--썸네일을 위한 필드
alter table adoption
add(adoption_thumb varchar2(500));



ALTER TABLE animal DROP COLUMN animal_passwd;
ALTER TABLE adoption DROP COLUMN adoption_passwd;



--img 파일 문제 해결 
--UPDATE animal
--SET animal_file = NULL;




-- 테이블의 구조 확인
DESCRIBE animal;
DESCRIBE adoption;
DESCRIBE image;


-- 테이블의 모든 데이터 조회

select * from animal;
select * from adoption;
select * from admin;
select * from image;






-- 개 추가
INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '2살', '암컷', '중성화 O', '5kg', '갈색', '활발하고 친화적입니다.', 'admin', '1.입양가능', SYSDATE, '멍멍이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '1살', '수컷', '중성화 O', '6kg', '흰색', '재미있는 개입니다.', 'admin', '1.입양가능', SYSDATE, '댕댕이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '2살', '수컷', '중성화 O', '6kg', '검정', '활발한 개입니다.', 'admin', '1.입양가능', SYSDATE, '왈이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '1살', '암컷', '중성화 O', '3kg', '갈색', '순한 개입니다.', 'admin', '1.입양가능', SYSDATE, '잠만보');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '2살', '수컷', '중성화 O', '4kg', '흰색', '활발한 개입니다.', 'admin', '1.입양가능', SYSDATE, '피카츄');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '2살', '수컷', '중성화 O', '5kg', '흰색', '얌전한 개입니다.', 'admin', '1.입양가능', SYSDATE, '진돌');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '2살', '수컷', '중성화 O', '3kg', '흰색', '장난이 많은 개입니다.', 'admin', '1.입양가능', SYSDATE, '북이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '2살', '암컷', '중성화 O', '4kg', '흰색', '활발한 개입니다.', 'admin', '1.입양가능', SYSDATE, '브이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '2살', '수컷', '중성화 O', '5kg', '흰색', '순한 개입니다.', 'admin', '1.입양가능', SYSDATE, '두비');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '강아지', '2살', '암컷', '중성화 O', '6kg', '흰색', '순한 개입니다.', 'admin', '1.입양가능', SYSDATE, '순이');

-- 고양이 추가
INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '3살', '암컷', '중성화 O', '4kg', '검은색', '아름다운 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '양이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '암컷', '중성화 X', '5kg', '갈색', '애교 많은 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '냥냥이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '1살', '암컷', '중성화 X', '3kg', '흰색', '잠이 은 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '뮤');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '수컷', '중성화 X', '5kg', '갈색', '활발한 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '뮤츠');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '수컷', '중성화 X', '5kg', '갈색', '축하드려요 수속성 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '고라파덕');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '3살', '암컷', '중성화 O', '4kg', '검은색', '아름다운 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '네리');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '암컷', '중성화 X', '5kg', '갈색', '애교 많은 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '노량이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '1살', '암컷', '중성화 X', '3kg', '흰색', '잠이 은 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '귤이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '수컷', '중성화 X', '5kg', '갈색', '활발한 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '황건적');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '수컷', '중성화 X', '5kg', '갈색', '축하드려요 수속성 고양이입니다.', 'admin', '1.입양가능', SYSDATE, '나무');




INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '무료분양 이벤트가 시작되었습니다. 많은 참여 부탁드립니다.', TO_DATE('2024-03-05', 'YYYY-MM-DD'), '무료분양 이벤트 공지', 100, '진행중', '상', 'admin', 11);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '당신의 따뜻한 가정이 필요한 아이들이 기다리고 있습니다.', TO_DATE('2024-03-04', 'YYYY-MM-DD'), '어린이날 특별 무료분양', 75, '진행중', '중', 'admin', 12);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '고양이 친구들이 새로운 가족을 찾고 있어요.', TO_DATE('2024-03-03', 'YYYY-MM-DD'), '봄맞이 고양이 무료분양', 120, '종료', '하', 'admin', 13);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '겨울철 특별 무료분양 이벤트! 참여하세요.', TO_DATE('2024-03-02', 'YYYY-MM-DD'), '겨울 무료분양', 90, '진행중', '상', 'admin', 14);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '새로 무료분양받은 친구들을 소개합니다.', TO_DATE('2024-03-01', 'YYYY-MM-DD'), '신규 동물 소개', 110, '진행중', '중', 'admin', 15);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '특별한 무료분양 기회! 놓치지 마세요.', TO_DATE('2024-02-29', 'YYYY-MM-DD'), '특별 무료분양 프로모션', 80, '진행중', '하', 'admin', 16);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '무료분양 후기 이벤트가 진행 중입니다.', TO_DATE('2024-02-28', 'YYYY-MM-DD'), '무료분양 후기 작성 이벤트', 95, '진행중', '상', 'admin', 17);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '봄철 무료분양의 계절, 당신의 집에 따뜻한 친구를 불러보세요.', TO_DATE('2024-02-27', 'YYYY-MM-DD'), '봄 무료분양 이벤트', 110, '종료', '중', 'admin', 18);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '아이들을 위한 특별 무료분양 이벤트가 준비되어 있습니다.', TO_DATE('2024-02-26', 'YYYY-MM-DD'), '무료분양 이벤트', 85, '진행중', '하', 'admin', 19);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '다함께 즐기는 여름! 무료분양 이벤트에 참여하세요.', TO_DATE('2024-02-25', 'YYYY-MM-DD'), '여름 무료분양 캠페인', 105, '진행중', '상', 'admin', 20);
INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '무료분양 이벤트가 시작되었습니다. 많은 참여 부탁드립니다.', TO_DATE('2024-03-05', 'YYYY-MM-DD'), '무료분양 이벤트 공지', 100, '진행중', '상', 'admin', 21);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '당신의 따뜻한 가정이 필요한 아이들이 기다리고 있습니다.', TO_DATE('2024-03-04', 'YYYY-MM-DD'), '어린이날 특별 무료분양', 75, '진행중', '중', 'admin', 22);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '고양이 친구들이 새로운 가족을 찾고 있어요.', TO_DATE('2024-03-03', 'YYYY-MM-DD'), '봄맞이 고양이 무료분양', 120, '종료', '하', 'admin', 23);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '겨울철 특별 무료분양 이벤트! 참여하세요.', TO_DATE('2024-03-02', 'YYYY-MM-DD'), '겨울 무료분양', 90, '진행중', '상', 'admin', 24);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '새로 무료분양받은 친구들을 소개합니다.', TO_DATE('2024-03-01', 'YYYY-MM-DD'), '신규 동물 소개', 110, '진행중', '중', 'admin', 25);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '특별한 무료분양 기회! 놓치지 마세요.', TO_DATE('2024-02-29', 'YYYY-MM-DD'), '특별 무료분양 프로모션', 80, '진행중', '하', 'admin', 26);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '무료분양 후기 이벤트가 진행 중입니다.', TO_DATE('2024-02-28', 'YYYY-MM-DD'), '무료분양 후기 작성 이벤트', 95, '진행중', '상', 'admin', 27);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '봄철 무료분양의 계절, 당신의 집에 따뜻한 친구를 불러보세요.', TO_DATE('2024-02-27', 'YYYY-MM-DD'), '봄 무료분양 이벤트', 110, '종료', '중', 'admin', 28);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '아이들을 위한 특별 무료분양 이벤트가 준비되어 있습니다.', TO_DATE('2024-02-26', 'YYYY-MM-DD'), '무료분양 이벤트', 85, '진행중', '하', 'admin', 29);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '다함께 즐기는 여름! 무료분양 이벤트에 참여하세요.', TO_DATE('2024-02-25', 'YYYY-MM-DD'), '여름 무료분양 캠페인', 105, '진행중', '상', 'admin', 30);




CREATE TABLE volunteer (
	volunteer_id	number		NOT NULL,
	volunteer_detail	varchar2(2000)		NOT NULL,
	volunteer_date	date	DEFAULT sysdate	NOT NULL,
	volunteer_title	varchar2(100)		NOT NULL,
	volunteer_time	varchar2(30)		NOT NULL,
	volunteer_due	varchar2(30)		NOT NULL,
	volunteer_limit	number		NOT NULL,
	volunteer_cost	varchar2(20)	DEFAULT '없음'	NOT NULL,
	volunteer_location	varchar2(100)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);

-- 파일명을 위한 필드
alter table volunteer
add(volunteer_file varchar2(500));

alter table volunteer
modify(volunteer_detail varchar2(4000));

CREATE TABLE application (
	application_id	number		NOT NULL,
	application_date	date	DEFAULT sysdate	NOT NULL,
	application_comment	varchar2(150)		NULL,
	user_id	varchar2(20)		NOT NULL,
	volunteer_id	number		NOT NULL,
	application_result	number	DEFAULT 0	NOT NULL
);



ALTER TABLE volunteer ADD CONSTRAINT PK_VOLUNTEER PRIMARY KEY (
	volunteer_id
);

ALTER TABLE application ADD CONSTRAINT PK_APPLICATION PRIMARY KEY (
	application_id
);

ALTER TABLE application ADD CONSTRAINT FK_volunteer_TO_application_1 FOREIGN KEY (volunteer_id)
REFERENCES volunteer (volunteer_id)
ON DELETE CASCADE;

-- 봉사 공고
create sequence volunteer_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 신청
create sequence application_seq
start with 1
increment by 1
nocycle
nocache;

--????????? ?????, ????
CREATE TABLE freeBoard (
	fboard_id	number		NOT NULL,
	fboard_title	varchar2(80)		NOT NULL,
	fboard_content	varchar2(2000)		NOT NULL,
	fboard_cnt	number	DEFAULT 0	NOT NULL,
	fboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

CREATE TABLE Fcomment (
	fcomment_id	number		NOT NULL,
	fcomment_content	varchar2(150)		NOT NULL,
	fcomment_date	date	DEFAULT sysdate	NOT NULL,
	fboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

ALTER TABLE freeBoard ADD CONSTRAINT PK_FREEBOARD PRIMARY KEY (
	fboard_id
);

ALTER TABLE freeBoard ADD CONSTRAINT FK_users_TO_freeBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
)ON DELETE CASCADE;

ALTER TABLE Fcomment ADD CONSTRAINT PK_FCOMMENT PRIMARY KEY (
	fcomment_id
);

ALTER TABLE Fcomment ADD CONSTRAINT FK_freeBoard_TO_Fcomment_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
)ON DELETE CASCADE;

ALTER TABLE Fcomment ADD CONSTRAINT FK_users_TO_Fcomment_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
)ON DELETE CASCADE;

create sequence freeBoard_seq
start with 1
increment by 1
nocycle
nocache;

create sequence Fcomment_seq
start with 1
increment by 1
nocycle
nocache;


insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '碍酒瘤? ??配甫 ???!', '力格 弊措肺 ば ??? 碍酒瘤? 鞍? 瘤?? ???狼 ??配? ?牢狼 ??配?
摹快妨? ?? ?瘤矛??? 悼救俊? 割? ??? 愁耳? 利? ???

??促 ?? ??配 ?抵? 登????? (??摹快扼?? 酒?扼 摹快妨? 茄 ? 魄 ??俊 ?? ?芭唱 弊繁 版快俊?!)
???柳 救?? 瘤?父毫? 登?瘤 ?陛秦?', 1, '2023-07-26', 'member01');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '? 厚?辨? ?老茄 辨??扼?! / 秦寇 ?悼豪? 葛?', '葛? ?刮? ??? 罐瘤 酒??哥, 屈?惑 磊扁俊? ?府茄 柳?? 碍?寸?瘤 酒?茄促. ??犁魄家俊? ?伏狼 困?搬?, 藕琴狼 搬?, ?寸秦魂狼 搬? ?? ??家?俊 包茄 牢?搬?? 且 ?俊? 犁魄包 6牢 ?惑狼 ?己? ??具 茄促.

?累磊·???·苞切扁?磊客 抗??狼 鼻府? ?伏肺? ??茄促. ?公困?? ?公?府狼 力??肺 措烹?? 烙?茄促. ?肺款 雀拌楷?? 俺?? ??瘤 抗魂救? 狼搬登瘤 ?茄 ?俊? ?何? ?雀俊? 抗魂救? 狼搬? ??瘤 促?狼 格利? 困茄 版厚? ?斥? 抗魂俊 霖?? ??且 ? ?促.

措烹?? 力3?苞 力4?狼 ??甫 瘤眉?? 傍器??具 茄促. 傍公?狼 脚盒苞 ?摹利 吝?己? ?伏? ??? 官俊 狼?? ?厘等促. ?雀? 狼厘 1牢苞 何狼厘 2牢? 急免茄促.

措烹?·?公?府·?公困?·??阿何狼 厘·??犁魄家 犁魄包·?包·吝居急芭包府困?雀 困?·???厘·??困? 扁? ?伏? ?茄 傍公?? 弊 流公??俊 ??? ???唱 ?伏? 困硅茄 ?俊? ?雀? 藕琴狼 家眠甫 狼搬且 ? ?促.

?背? 牢?登瘤 酒??哥, ?背客 ?摹? 盒府等促. 措烹?? 比困登芭唱 ??肺 牢?? 流公甫 ??且 ? ?? ?俊? ?公?府, ?伏? ?茄 ?公困?狼 ??肺 弊 鼻茄? 措?茄促.

措烹?? 秒烙俊 令??? 促?狼 急?甫 茄促. 葛? ?刮? 脚眉狼 磊?甫 ?柳促. 穿??瘤 ?伏俊 狼?瘤 酒???? 眉器·?加·拘?·?? ?? ??? 罐瘤 酒??哥, ?伏苞 利?茄 例?俊 狼?瘤 酒???? ??·?救?盒 ?? 碍力??? 罐瘤 酒?茄促.', 2, '2023-05-26', 'member02');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '??狼 ? 唱? ??甫 困秦 ??秦 林技?.', '措烹?? ?伏? ??? 官俊 狼?? ?厘 扁?狼 康?? ??茄促. ??俺?? ?雀犁利狼? 苞?? ?? 措烹?狼 ?狼肺 力救等促. 措??厘? ?雀狼 悼狼甫 掘? 措烹?? 烙?茄促.

措烹?? 烙?雀狼 ?雀甫 ??且 ?俊? 扁埃苞 ?雀??狼 ??甫 ????具 茄促. ???傍磊·惑?焙版 棺 ?隔焙版狼 ???? ?伏? ??? 官俊 狼?? 快急利?肺 ?肺狼 扁雀甫 何?罐?促.

?何? 抗魂俊 函版? ?且 ??? ?? ?俊? 眠?版?抗魂救? 祈己?? ?雀俊 力免且 ? ?促. ?雀狼?狼 ?? ?伏肺 ??登, 200牢 ?惑?肺 茄促.

措烹?狼 烙扁? 父?登? ?俊? 烙扁父? 70老 ?瘤 40老?俊 ?烙磊甫 急芭茄促. 葛? ?刮? 脚加茄 犁魄? 罐? 鼻府甫 ?柳促. 屈???牢? 惑寸茄 ??? ?? 茄 瘤眉?? 傍俺犁魄? 罐? 鼻府甫 ?柳促.

措烹?? ?伏救狼 老何俊 措?? ?? ?伏救? ???? 犁狼甫 ??且 ? ?促. ?包? ??苞 ?伏俊 狼?? 弊 ??俊 蝶扼 刀??? ?魄茄促. 乞拳烹老?氓狼 ??俊 包茄 措烹?狼 磊?俊 ??扁 困?? 刮林乞拳烹老磊?雀狼甫 笛 ? ?促.

穿??瘤 眉器 ?? ?加狼 ??客 函?牢狼 ??? 罐? 鼻府? ??? ?瘤罐瘤 酒???? 眉器 ?? ?加? 寸?瘤 酒?茄促. 眉器 ?? ?加? 寸茄 磊狼 ??殿 ?伏? ??? 磊俊?? 弊 ??客 老?·厘家? 瘤眉?? 烹瘤登?具 茄促.', 3, '2023-08-11', 'member03');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '?? ?? ??厘 ??斑 ?尼?, ?? ?板??.', '?配客 磊?? ??狼 ??甫 罐?哥, ??? 弊 ?屈?? 俺?苞 ??? 困?? ??茄 拌裙? ??茄促. ?雀? 急?器?, ?焙狼 寇?俊狼 ?斑 ?? 寇?焙措狼 措茄刮? 康?救俊?狼 林幅俊 措茄 悼狼鼻? ?柳促.

?何? 雀拌楷?付促 抗魂救? 祈己?? 雀拌楷? 俺? 90老??瘤 ?雀俊 力免??, ?雀? 雀拌楷? 俺? 30老??瘤 ?甫 狼搬??具 茄促. 力2?苞 力3?狼 ?盒俊 措??? ??俊 力家且 ? ?促.

??犁魄家? ?伏俊 ?盟登瘤 酒??? ?困救俊? ?魄俊 包茄 例?, ?何??苞 ?公?府俊 包茄 ??? 力?且 ? ?促. ?雀狼?? ?伏? ??? 流? ?且 ? ?促.

楷家磊狼 ?肺? 漂喊茄 ??甫 罐?促. ?寸狼 汲?? 磊??哥, 汗??寸力? ?厘等促. 措茄刮?狼 ?刮? 登? ??? ?伏肺 ?茄促. 葛? ?刮? 烹脚狼 厚?? 魔秦罐瘤 酒?茄促.

? ???? 寸?狼 措??厘苞 措??魄?? 酒? ?包? 力1? ??狼 ??俊 ???? ? ??俊 狼?? 烙?等 巴?肺 ?促. 力2?狼 犁魄包吝 3牢? ?雀俊? 急免?? 磊甫, 3牢? 措??厘? 瘤??? 磊甫 烙?茄促.

狼?? 力??妨? ?雀犁利狼? 3盒狼 2 ?惑狼 ?己? ??具 茄促. 屈??狼磊 ?? 屈???牢?肺? ?陛登菌? 磊? ?伏? ??? ?扁家?盒? 罐芭唱 公了魄搬? 罐? ?俊? ?伏? ??? 官俊 狼?? ??俊 ?寸茄 ?惑? ??且 ? ?促.', 4, '2023-02-03', 'member04');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '?? 9俺?父..! 烙???俊 悼曼秦林技?!', '?公雀狼? ?何狼 鼻茄俊 加?? 吝?茄 ?氓? ?狼茄促. ?雀? 狼?狼 磊拜? ???哥, 狼?? 隆拌且 ? ?促. 葛? ?刮? 牢埃?肺?狼 粮?苞 ?摹甫 ?瘤哥, ?汗? 眠?且 鼻府甫 ?柳促. ??? 俺牢? ?瘤? ??魔狼 扁?利 牢鼻? 犬牢?? ?甫 ?厘且 狼公甫 柳促.

急芭客 ?刮捧?狼 傍?茄 包府 棺 ?寸俊 包茄 ?公甫 ?府?扁 困?? 急芭包府困?雀甫 ?促. 措烹?? ?伏? ??? 官俊 狼?? ?厘 扁?狼 康?? ??茄促.

措烹?? ???促? 牢?且 ?俊? 寇背·??·烹老 扁? ??救困俊 包茄 吝??氓? ?刮捧?俊 ?老 ? ?促. 葛? ?刮? ?背狼 磊?甫 ?柳促. ??? 瘤?埃狼 ?屈?? ??? 困?? 瘤?版力甫 ?己且 狼公甫 柳促.

措烹?? ?伏? ??? 官俊 狼?? ??·?屈 ?? 汗鼻? ?且 ? ?促. ??·?? ?? ?盒? ???唱 ?伏俊 困?登? ?何? 犁魄狼 ?力? 等 版快俊? 措??? ?甫 ??利?肺 ??且 鼻茄? ?柳促.

??犁魄家俊? ?伏狼 困?搬?, 藕琴狼 搬?, ?寸秦魂狼 搬? ?? ??家?俊 包茄 牢?搬?? 且 ?俊? 犁魄包 6牢 ?惑狼 ?己? ??具 茄促. 措茄刮?狼 版力??? 俺牢苞 扁?狼 版力惑狼 磊?客 芒狼甫 粮吝?? 扁??肺 茄促.

葛? ?刮? ??? 罐瘤 酒??哥, 屈?惑 磊扁俊? ?府茄 柳?? 碍?寸?瘤 酒?茄促. ??? ?雀?厘·?雀汗瘤狼 ?柳俊 ??且 狼公甫 柳促. 傍傍??俊 狼茄 犁魂鼻狼 ??·?? ?? 力茄 棺 弊俊 措茄 ?惑? ?伏肺? ?登, ?寸茄 ?惑? 瘤鞭??具 茄促.', 5, '2023-03-08', 'member05');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '4? ?扁 豪?肺 ?膊且 "? 唱? 豪??"? 葛???促!', '酒??府 ???? 抗弊府唱 酒??府 ????促 慷?? 弊?? 喊? ??合 氓? ?快厚 ???? 唱? 促? 酒? 喊? 抗弊府唱 ?敲.

唱? 酒? 喊蝴 酒? 家? 疵前 ?福? 酒??府 ?福? ?苞 ????促 ????促 氓? ??合 酒? 唱厚? 磅促? ?? 固府? 疵前 官唱唱 家? ???? 疵前 ??俺 ????促 ????促 ????促 弊?? ?柯穿府 ?快喊 喊蝴 魂甸覆 ?苞 ?福? 磅促? 快府? 疵前 ?敲 磅促? ?? 肺款 肺款 ?? 唱厚? ?福? ????促 酒??府 ?快厚 官恩采.

救崇 魂甸覆 ?福? 魂甸覆 家?家? 慷?? 家? 氓? 官唱唱 唱? ?快厚 ??包 魂甸覆 促? 弊?? ?柯秦 官恩采 ?腔磐 氓? ?柯穿府 肺款 酒? 官恩采 ?敲 官唱唱 酒府酒 ?福? 促? ????促 磅促?.

崔撥 ??合 ?苞 酒府酒 促? 酒? 酒??府 固悔促 慷?? 促? 促? 官唱唱 酒? 喊? 固府? ?柯穿府 慷?? ????促 ??包 魂甸覆 磅促? 厚唱府 弊?? 厚唱府 ??合 酒??府 快府? ???? ?快厚 抗弊府唱 弊?? ?? 唱? ?柯穿府 喊? 促? 救崇 家?家? 磅促? 官恩采 器? ????促 ??包 厚唱府 疵前 ?快厚 ?? 氓? 厚唱府 抗弊府唱.

抗弊府唱 酒? ?柯穿府 酒府酒 疵前 ??包 崔撥 促? 磅促? ???? 肺款 ?腔磐 促? 唱厚? 弊?? ????促 ?腔磐 ??合 酒府酒 ?福? 救崇 ?腔磐 酒府酒 崔撥 ?腔磐 魂甸覆 酒??府 ?快喊 ?柯秦 喊蝴 ?快厚 弊?? 慷?? 酒府酒 ?腔磐 ???? 酒??府 磅促? 固悔促 官恩采.', 6, '2022-11-03', 'member06');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '??????厘 ??斑 "扼款?"? 喊? 登菌嚼?促.', '肺款 抗弊府唱 ?柯穿府 肺款 ?福? 喊蝴 ??合 酒??府 疵前 官恩采 ?? 酒? ?苞 ?快厚 唱? 家?家? 疵前 ?腔磐 ?? 疵前 ?快厚 ?柯秦 酒??府 官唱唱 ?福? 喊蝴 ?福? ?快喊 唱? 魂甸覆 ????促 疵前 酒府酒 ?苞 厚唱府 救崇 ?柯穿府 家? 喊? 喊蝴 磅促? ?? 酒??府 ??俺 厚唱府 ?快厚 弊?? ?敲 抗弊府唱 弊??.

??包 家? 氓? 喊? 唱厚? ?快厚 ????促 酒府酒 弊?? 固悔促 肺款 氓? ?福? ?苞 ???? 官唱唱 唱厚? 官唱唱 酒?扼 喊蝴 酒府酒 磅促? 魂甸覆 唱? ??俺 ?快喊 ?敲 救崇 唱? ?快喊 ????促 喊蝴 官唱唱 ??俺 酒??府 弊?? 救崇 酒府酒 厚唱府 ?柯秦 崔撥 器? ?敲 ????促 酒??府 ?柯穿府 氓? 磅促? ?福? ??俺.

氓? 喊蝴 肺款 官唱唱 ?腔磐 ?柯穿府 厚唱府 家? 喊蝴 唱? 固府? 抗弊府唱 固悔促 魂甸覆 磅促? 喊蝴 喊? ?快厚 官恩采 酒? 救崇 弊?? ????促 ???? ?腔磐 ?苞 肺款 ????促 ??俺 唱厚? 唱厚? ?? 促? ?腔磐 ?腔磐 官恩采 固府? 酒? 酒?扼 磅促? 酒?扼 ?快喊 肺款 唱厚? ???? ?快厚 喊? 固悔促 酒??府 固府?.

?快厚 家? ????促 ?福? 官唱唱 快府? 快府? ??俺 ?福? 快府? ?快厚 ?柯秦 ????促 喊? 慷?? ?腔磐 酒??府 ?敲 ???? ?苞 ?敲 弊?? 氓? ?腔磐 官唱唱 固府? 喊蝴 ?柯穿府 喊蝴 酒府酒 救崇 ??俺 固府? ????促 魂甸覆 ?? 崔撥 官唱唱 官恩采 ?柯穿府 ?快厚 ?快厚 慷?? ??俺 快府? ???? ?快厚 崔撥 喊蝴 弊??.', 7, '2023-03-11', 'member07');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '?????厘俊? ??等 "???"? ??? 扁促??促', '?苞 唱厚? 家? 唱厚? ?? ??包 酒?扼 喊? ??俺 抗弊府唱 氓? 固府? ??包 疵前 磅促? 酒府酒 魂甸覆 崔撥 ?腔磐 ????促 唱厚? 酒??府 磅促? ????促 ?腔磐 磅促? 固悔促 快府? 家? 救崇 促? 氓? 官唱唱 ?苞 快府? 固悔促 ?快喊 固府? 厚唱府 ????促 官恩采 ??俺 酒府酒 唱? 魂甸覆 ???? ?快喊 ????促 崔撥 唱厚?.

??俺 ?柯秦 酒府酒 官恩采 抗弊府唱 慷?? 魂甸覆 促? 官恩采 官恩采 崔撥 ?? 疵前 家?家? 喊? 慷?? ?快喊 疵前 促? 喊蝴 弊?? ?快喊 ?柯秦 救崇 喊? 肺款 崔撥 救崇 ?腔磐 官恩采 救崇 唱? ??合 ??合 ?快喊 崔撥 固悔促 器? 固悔促 厚唱府 酒府酒 固悔促 ?腔磐 ?福? ?福? 酒??府 唱厚? 固悔促 ?快厚 抗弊府唱.

肺款 官唱唱 抗弊府唱 酒府酒 喊? 氓? 唱? 快府? 官唱唱 唱厚? 快府? ?福? ????促 氓? 疵前 ?敲 器? 喊? 酒??府 唱? 促? 官恩采 抗弊府唱 酒府酒 ?快喊 ????促 慷?? ?柯穿府 ?? 酒府酒 ?快厚 家?家? 氓? 官唱唱 肺款 ?敲 弊?? 弊?? 固府? 家? 家? 弊?? 家? ????促 家?家? 家? 酒?扼 ?柯穿府 厚唱府 魂甸覆.

?快厚 ?快厚 ?快厚 官恩采 崔撥 氓? ??包 ????促 ??俺 酒?扼 ?快厚 酒?扼 促? 快府? 救崇 官恩采 ??包 快府? 厚唱府 促? ???? ??俺 ?柯穿府 磅促? 抗弊府唱 肺款 ????促 ?腔磐 ?敲 ?快厚 快府? 弊?? ?柯穿府 ??合 肺款 弊?? ????促 疵前 快府? 磅促? 喊? ?快喊 弊?? ???? 喊? 官唱唱 ?敲 ?快厚 ?腔磐 ?柯秦.', 8, '2023-04-12', 'member08');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '乞藕?客 ?悼?? 官?俊 措磊肺 桓? ??', '酒? 厚唱府 魂甸覆 促? ???? ????促 器? 救崇 ?腔磐 喊蝴 固悔促 快府? 家?家? 喊? ?苞 ????促 磅促? 慷?? 快府? 喊蝴 器? 喊? 抗弊府唱 ?柯秦 魂甸覆 ?? 家? 厚唱府 ?腔磐 救崇 喊蝴 家? ????促 固悔促 家? 器? 酒??府 唱? 酒?扼 ??合 酒? 固府? 救崇 固府? ?? ?? 酒??府 ?? ?福? 氓?.

家? ?福? ?柯秦 酒府酒 ????促 疵前 唱? 器? 家?家? 官恩采 氓? ?苞 快府? 固府? ?福? 喊? 器? 慷?? 促? 磅促? 唱? ?柯穿府 器? 酒??府 酒?扼 家? 氓? 固悔促 ?柯秦 ?敲 家? 厚唱府 ????促 ???? 唱? 快府? ?柯穿府 唱厚? ?敲 促? 酒?扼 酒府酒 酒??府 固悔促 弊?? 厚唱府 ?柯秦 厚唱府 慷?? ?福?.

慷?? 厚唱府 ?柯穿府 ?? ??合 氓? 官恩采 快府? 救崇 ?柯穿府 崔撥 慷?? ?柯秦 ?快厚 ?腔磐 ???? ?柯穿府 肺款 官唱唱 酒??府 ??包 疵前 ?苞 魂甸覆 救崇 唱厚? ?腔磐 快府? ?柯秦 救崇 快府? ?福? ?敲 慷?? ?快厚 喊蝴 厚唱府 唱? ?柯穿府 家?家? ?福? ??包 ??俺 喊蝴 家?家? ??俺 肺款 酒府酒 官恩采 ????促.

酒??府 ?柯穿府 磅促? 喊蝴 ?柯穿府 ?? ?快喊 ?? ????促 喊蝴 慷?? ??俺 唱厚? 崔撥 厚唱府 酒?扼 慷?? 氓? 磅促? 肺款 官恩采 ????促 ??合 魂甸覆 器? ?? 官唱唱 固悔促 ?柯秦 唱厚? 酒府酒 ?腔磐 固府? 酒? 魂甸覆 ????促 磅促? ?腔磐 氓? 酒?扼 ????促 酒?扼 ?苞 酒府酒 ?敲 崔撥 ??包 器? ?柯秦 抗弊府唱.', 9, '2023-08-29', 'member09');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '力磊府??? ?何看? ?? ??厘 ??斑狼 ? 魂氓 家?!', '??包 ?福? ?快厚 疵前 崔撥 肺款 ????促 促? 唱? ?敲 ??俺 ?福? 氓? 促? 固悔促 官恩采 ?苞 ?快喊 ??包 ?苞 ?快厚 慷?? ??俺 酒? 厚唱府 喊蝴 ????促 喊? 官恩采 家?家? 固悔促 酒府酒 酒?扼 固府? 促? ????促 酒? ?福? 促? 促? 崔撥 崔撥 ??俺 ????促 ?柯秦 家? 喊蝴 崔撥 ????促 ?快厚.

酒?扼 磅促? 唱? 厚唱府 唱厚? 慷?? 固府? 官唱唱 ?柯穿府 磅促? ??俺 喊蝴 器? 酒??府 ?柯穿府 官唱唱 唱厚? 唱厚? 器? ?福? 促? 酒? 魂甸覆 疵前 ?快喊 酒??府 固悔促 救崇 抗弊府唱 ????促 ?快喊 官恩采 ?苞 喊? 弊?? 魂甸覆 家? 家? ?快喊 ?? 喊? ??包 弊?? 促? ?福? ?苞 慷?? 疵前 魂甸覆 快府?.

????促 ?福? 酒? 家? 喊蝴 ?敲 唱厚? 厚唱府 磅促? 酒府酒 救崇 魂甸覆 ?快喊 ?敲 ?快喊 ?腔磐 酒? 快府? ?腔磐 肺款 弊?? 崔撥 促? 弊?? ????促 器? ?柯秦 ?快喊 家?家? ?快喊 救崇 酒府酒 厚唱府 家?家? 官唱唱 疵前 固府? ?腔磐 ?福? 酒??府 ?柯秦 官恩采 酒? 弊?? 唱厚? ?柯穿府 磅促? ?柯穿府 ??俺 酒?.

??俺 家?家? ??合 酒??府 家? 魂甸覆 固悔促 官唱唱 厚唱府 ?? ????促 ?柯秦 器? 官恩采 唱? 喊? 疵前 ??合 促? ?快厚 ??包 ????促 厚唱府 磅促? ?柯秦 救崇 疵前 ?? ?敲 肺款 ?柯穿府 快府? ??俺 唱厚? 唱? 酒府酒 官恩采 ????促 ????促 崔撥 家?家? 酒?扼 弊?? 固悔促 促? 喊蝴 ???? ?快喊 ?苞 促?.', 10, '2023-08-28', 'member10');

insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '? 腹? 犁??? 5摸 埃魄俊? 混? 等 ?楷', '??包 ?福? ?快厚 疵前 崔撥 肺款 ????促 促? 唱? ?敲 ??俺 ?福? 氓? 促? 固悔促 官恩采 ?苞 ?快喊 ??包 ?苞 ?快厚 慷?? ??俺 酒? 厚唱府 喊蝴 ????促 喊? 官恩采 家?家? 固悔促 酒府酒 酒?扼 固府? 促? ????促 酒? ?福? 促? 促? 崔撥 崔撥 ??俺 ????促 ?柯秦 家? 喊蝴 崔撥 ????促 ?快厚.

酒?扼 磅促? 唱? 厚唱府 唱厚? 慷?? 固府? 官唱唱 ?柯穿府 磅促? ??俺 喊蝴 器? 酒??府 ?柯穿府 官唱唱 唱厚? 唱厚? 器? ?福? 促? 酒? 魂甸覆 疵前 ?快喊 酒??府 固悔促 救崇 抗弊府唱 ????促 ?快喊 官恩采 ?苞 喊? 弊?? 魂甸覆 家? 家? ?快喊 ?? 喊? ??包 弊?? 促? ?福? ?苞 慷?? 疵前 魂甸覆 快府?.

????促 ?福? 酒? 家? 喊蝴 ?敲 唱厚? 厚唱府 磅促? 酒府酒 救崇 魂甸覆 ?快喊 ?敲 ?快喊 ?腔磐 酒? 快府? ?腔磐 肺款 弊?? 崔撥 促? 弊?? ????促 器? ?柯秦 ?快喊 家?家? ?快喊 救崇 酒府酒 厚唱府 家?家? 官唱唱 疵前 固府? ?腔磐 ?福? 酒??府 ?柯秦 官恩采 酒? 弊?? 唱厚? ?柯穿府 磅促? ?柯穿府 ??俺 酒?.

??俺 家?家? ??合 酒??府 家? 魂甸覆 固悔促 官唱唱 厚唱府 ?? ????促 ?柯秦 器? 官恩采 唱? 喊? 疵前 ??合 促? ?快厚 ??包 ????促 厚唱府 磅促? ?柯秦 救崇 疵前 ?? ?敲 肺款 ?柯穿府 快府? ??俺 唱厚? 唱? 酒府酒 官恩采 ????促 ????促 崔撥 家?家? 酒?扼 弊?? 固悔促 促? 喊蝴 ???? ?快喊 ?苞 促?.', 10, '2023-08-28', 'member10');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '柯季磐 ??埃! 流柳?瓷 配??客 局例茄 娘?', '??包 ?福? ?快厚 疵前 崔撥 肺款 ????促 促? 唱? ?敲 ??俺 ?福? 氓? 促? 固悔促 官恩采 ?苞 ?快喊 ??包 ?苞 ?快厚 慷?? ??俺 酒? 厚唱府 喊蝴 ????促 喊? 官恩采 家?家? 固悔促 酒府酒 酒?扼 固府? 促? ????促 酒? ?福? 促? 促? 崔撥 崔撥 ??俺 ????促 ?柯秦 家? 喊蝴 崔撥 ????促 ?快厚.

酒?扼 磅促? 唱? 厚唱府 唱厚? 慷?? 固府? 官唱唱 ?柯穿府 磅促? ??俺 喊蝴 器? 酒??府 ?柯穿府 官唱唱 唱厚? 唱厚? 器? ?福? 促? 酒? 魂甸覆 疵前 ?快喊 酒??府 固悔促 救崇 抗弊府唱 ????促 ?快喊 官恩采 ?苞 喊? 弊?? 魂甸覆 家? 家? ?快喊 ?? 喊? ??包 弊?? 促? ?福? ?苞 慷?? 疵前 魂甸覆 快府?.

????促 ?福? 酒? 家? 喊蝴 ?敲 唱厚? 厚唱府 磅促? 酒府酒 救崇 魂甸覆 ?快喊 ?敲 ?快喊 ?腔磐 酒? 快府? ?腔磐 肺款 弊?? 崔撥 促? 弊?? ????促 器? ?柯秦 ?快喊 家?家? ?快喊 救崇 酒府酒 厚唱府 家?家? 官唱唱 疵前 固府? ?腔磐 ?福? 酒??府 ?柯秦 官恩采 酒? 弊?? 唱厚? ?柯穿府 磅促? ?柯穿府 ??俺 酒?.

??俺 家?家? ??合 酒??府 家? 魂甸覆 固悔促 官唱唱 厚唱府 ?? ????促 ?柯秦 器? 官恩采 唱? 喊? 疵前 ??合 促? ?快厚 ??包 ????促 厚唱府 磅促? ?柯秦 救崇 疵前 ?? ?敲 肺款 ?柯穿府 快府? ??俺 唱厚? 唱? 酒府酒 官恩采 ????促 ????促 崔撥 家?家? 酒?扼 弊?? 固悔促 促? 喊蝴 ???? ?快喊 ?苞 促?.', 10, '2023-08-28', 'member10');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '脚何? 捧?吝牢 ???甫 ??秦林技?', '??包 ?福? ?快厚 疵前 崔撥 肺款 ????促 促? 唱? ?敲 ??俺 ?福? 氓? 促? 固悔促 官恩采 ?苞 ?快喊 ??包 ?苞 ?快厚 慷?? ??俺 酒? 厚唱府 喊蝴 ????促 喊? 官恩采 家?家? 固悔促 酒府酒 酒?扼 固府? 促? ????促 酒? ?福? 促? 促? 崔撥 崔撥 ??俺 ????促 ?柯秦 家? 喊蝴 崔撥 ????促 ?快厚.

酒?扼 磅促? 唱? 厚唱府 唱厚? 慷?? 固府? 官唱唱 ?柯穿府 磅促? ??俺 喊蝴 器? 酒??府 ?柯穿府 官唱唱 唱厚? 唱厚? 器? ?福? 促? 酒? 魂甸覆 疵前 ?快喊 酒??府 固悔促 救崇 抗弊府唱 ????促 ?快喊 官恩采 ?苞 喊? 弊?? 魂甸覆 家? 家? ?快喊 ?? 喊? ??包 弊?? 促? ?福? ?苞 慷?? 疵前 魂甸覆 快府?.

????促 ?福? 酒? 家? 喊蝴 ?敲 唱厚? 厚唱府 磅促? 酒府酒 救崇 魂甸覆 ?快喊 ?敲 ?快喊 ?腔磐 酒? 快府? ?腔磐 肺款 弊?? 崔撥 促? 弊?? ????促 器? ?柯秦 ?快喊 家?家? ?快喊 救崇 酒府酒 厚唱府 家?家? 官唱唱 疵前 固府? ?腔磐 ?福? 酒??府 ?柯秦 官恩采 酒? 弊?? 唱厚? ?柯穿府 磅促? ?柯穿府 ??俺 酒?.

??俺 家?家? ??合 酒??府 家? 魂甸覆 固悔促 官唱唱 厚唱府 ?? ????促 ?柯秦 器? 官恩采 唱? 喊? 疵前 ??合 促? ?快厚 ??包 ????促 厚唱府 磅促? ?柯秦 救崇 疵前 ?? ?敲 肺款 ?柯穿府 快府? ??俺 唱厚? 唱? 酒府酒 官恩采 ????促 ????促 崔撥 家?家? 酒?扼 弊?? 固悔促 促? 喊蝴 ???? ?快喊 ?苞 促?.', 10, '2023-08-28', 'member10');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '模秦瘤? 茄?? 促?茄 "付悼?"', '??包 ?福? ?快厚 疵前 崔撥 肺款 ????促 促? 唱? ?敲 ??俺 ?福? 氓? 促? 固悔促 官恩采 ?苞 ?快喊 ??包 ?苞 ?快厚 慷?? ??俺 酒? 厚唱府 喊蝴 ????促 喊? 官恩采 家?家? 固悔促 酒府酒 酒?扼 固府? 促? ????促 酒? ?福? 促? 促? 崔撥 崔撥 ??俺 ????促 ?柯秦 家? 喊蝴 崔撥 ????促 ?快厚.

酒?扼 磅促? 唱? 厚唱府 唱厚? 慷?? 固府? 官唱唱 ?柯穿府 磅促? ??俺 喊蝴 器? 酒??府 ?柯穿府 官唱唱 唱厚? 唱厚? 器? ?福? 促? 酒? 魂甸覆 疵前 ?快喊 酒??府 固悔促 救崇 抗弊府唱 ????促 ?快喊 官恩采 ?苞 喊? 弊?? 魂甸覆 家? 家? ?快喊 ?? 喊? ??包 弊?? 促? ?福? ?苞 慷?? 疵前 魂甸覆 快府?.

????促 ?福? 酒? 家? 喊蝴 ?敲 唱厚? 厚唱府 磅促? 酒府酒 救崇 魂甸覆 ?快喊 ?敲 ?快喊 ?腔磐 酒? 快府? ?腔磐 肺款 弊?? 崔撥 促? 弊?? ????促 器? ?柯秦 ?快喊 家?家? ?快喊 救崇 酒府酒 厚唱府 家?家? 官唱唱 疵前 固府? ?腔磐 ?福? 酒??府 ?柯秦 官恩采 酒? 弊?? 唱厚? ?柯穿府 磅促? ?柯穿府 ??俺 酒?.

??俺 家?家? ??合 酒??府 家? 魂甸覆 固悔促 官唱唱 厚唱府 ?? ????促 ?柯秦 器? 官恩采 唱? 喊? 疵前 ??合 促? ?快厚 ??包 ????促 厚唱府 磅促? ?柯秦 救崇 疵前 ?? ?敲 肺款 ?柯穿府 快府? ??俺 唱厚? 唱? 酒府酒 官恩采 ????促 ????促 崔撥 家?家? 酒?扼 弊?? 固悔促 促? 喊蝴 ???? ?快喊 ?苞 促?.', 10, '2023-08-28', 'member10');


insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, '8th Floor', '2023-05-04', 1, 'member01');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'PO Box 9799', '2023-02-02', 2, 'member02');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Suite 55', '2023-02-27', 3, 'member03');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Apt 1581', '2023-06-04', 4, 'member04');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'PO Box 18018', '2023-07-10', 5, 'member05');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'PO Box 96224', '2022-05-15', 6, 'member06');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, '17th Floor', '2023-01-02', 7, 'member07');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Room 1437', '2022-07-25', 8, 'member08');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Room 1499', '2023-10-19', 9, 'member09');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Apt 1738', '2024-02-05', 10, 'member10');

--??????瓣????? ?????, ????


CREATE TABLE volunteerFeedbackBoard (
	vfboard_id	number		NOT NULL,
	vfboard_title	varchar2(80)		NOT NULL,
	vfboard_content	varchar2(2000)		NOT NULL,
	vfboard_cnt	number	DEFAULT 0	NOT NULL,
	vfboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

CREATE TABLE VFcomment (
	vfcomment_id	number		NOT NULL,
	vfcomment_content	varchar2(150)		NOT NULL,
	vfcomment_date	date	DEFAULT sysdate	NOT NULL,
	vfboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

ALTER TABLE volunteerFeedbackBoard ADD CONSTRAINT PK_VOLUNTEERFEEDBACKBOARD PRIMARY KEY (
	vfboard_id
);

ALTER TABLE volunteerFeedbackBoard ADD CONSTRAINT FK_users_TO_volunteerFeedbackBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
)ON DELETE CASCADE;

ALTER TABLE VFcomment ADD CONSTRAINT PK_VFCOMMENT PRIMARY KEY (
	vfcomment_id
);

ALTER TABLE VFcomment ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_VFcomment_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
)ON DELETE CASCADE;

ALTER TABLE VFcomment ADD CONSTRAINT FK_users_TO_VFcomment_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
)ON DELETE CASCADE;

create sequence volunteerFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

create sequence VFcomment_seq
start with 1
increment by 1
nocycle
nocache;




insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '菊?? 狐瘤?, ?陛?? ?己?己 厚? ?? ‘??’', '氓? ??俺 喊蝴 固悔促 ????促 ??俺 酒?扼 唱厚? ??包 ?? 快府? 喊蝴 ?苞 快府? ??合 唱? 促? 厚唱府 酒?扼 家? 疵前 固悔促 家? 崔撥 ????促 崔撥 氓? 厚唱府 酒府酒 ?柯秦 ??包 ?柯穿府 厚唱府 崔撥 家? 厚唱府 家?家? ??俺 ????促 官恩采 酒?扼 喊? 官唱唱 喊蝴 ?腔磐 唱? 家?家? ?苞 酒? ????促.

快府? ??俺 官唱唱 ?苞 ?柯穿府 崔撥 官恩采 崔撥 家? 喊蝴 固府? ??包 ?快喊 ??包 ?? ?苞 唱厚? 肺款 酒府酒 酒府酒 ?腔磐 ?柯秦 家? ????促 喊? 固悔促 喊蝴 磅促? 固悔促 酒??府 ?敲 喊? ?快厚 ?柯穿府 ??包 救崇 慷?? ??合 ?快厚 ??合 ??俺 ?柯秦 ?? 氓? 家? 喊? ???? 家? ?柯穿府 慷??.

?敲 ????促 ?柯穿府 弊?? 固府? ?快喊 ?福? 喊蝴 ?苞 ?快厚 崔撥 磅促? 崔撥 ?腔磐 ??包 酒府酒 固悔促 磅促? 崔撥 弊?? 磅促? 酒? ???? ??俺 厚唱府 ????促 ?腔磐 ?? 厚唱府 ??俺 ????促 ??包 氓? 抗弊府唱 ?腔磐 崔撥 ??包 酒?扼 快府? 魂甸覆 ?快喊 官唱唱 ????促 魂甸覆 酒?扼 ????促 ??包 快府? 器? 酒府酒.

快府? ????促 崔撥 疵前 ?敲 唱? 唱? 家? 厚唱府 官唱唱 ??合 ?柯秦 官恩采 快府? ???? 酒? ?快喊 固府? ?快厚 抗弊府唱 抗弊府唱 磅促? ?苞 ???? 弊?? 快府? 酒? ?苞 崔撥 唱? 弊?? ????促 慷?? ?? 慷?? 救崇 ??包 ?快喊 ??包 慷?? ?福? 固悔促 ??合 崔撥 酒?扼 ????促 ??包 家?家? ?快喊 魂甸覆.', 1, '2023-03-12', 'member01');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '?? 力措肺 ? ?? 惑?甫 ?? ?? ‘根角?’', '唱厚? 唱? 快府? 氓? 魂甸覆 ?福? ?柯穿府 救崇 酒? 崔撥 酒? 弊?? 酒府酒 酒? ??合 ?快厚 家? 官恩采 ?苞 酒??府 酒?扼 器? ??俺 ??俺 家?家? ?柯穿府 固府? 慷?? ?腔磐 慷?? 磅促? 魂甸覆 ?快厚 厚唱府 酒?扼 喊? 崔撥 ?柯穿府 ?柯穿府 家?家? ?腔磐 磅促? 酒?扼 崔撥 快府? ?苞 唱? 酒府酒 疵前 促?.

?柯秦 ?柯穿府 唱厚? 固悔促 磅促? 崔撥 酒?扼 ????促 疵前 ????促 ?敲 厚唱府 慷?? 酒府酒 ??俺 ?柯秦 慷?? ??合 酒府酒 酒? 厚唱府 ?柯穿府 喊蝴 家?家? ???? 家? ?福? ??包 ????促 快府? 疵前 氓? ?快喊 弊?? ?福? ?腔磐 ?苞 ????促 崔撥 酒?扼 ??合 ????促 促? 器? ?苞 肺款 崔撥 ???? ??合 官恩采.

固悔促 抗弊府唱 酒??府 氓? 肺款 ??包 ?快喊 慷?? 救崇 疵前 固悔促 喊? 酒府酒 官恩采 器? 酒??府 固府? 喊? 救崇 ????促 抗弊府唱 弊?? ??包 官唱唱 厚唱府 ?柯秦 ?快厚 喊? 抗弊府唱 厚唱府 ??俺 ?福? ??俺 ??俺 ?苞 官恩采 唱厚? 家?家? ????促 ??俺 酒?扼 ?苞 酒??府 唱厚? 魂甸覆 抗弊府唱 促? 酒府酒 家? 肺款.

抗弊府唱 喊? 酒? 唱厚? ?柯穿府 唱厚? 救崇 弊?? ?腔磐 魂甸覆 家?家? 崔撥 器? 固悔促 ?敲 慷?? ?柯穿府 喊? ?快厚 疵前 魂甸覆 酒?扼 ?快厚 肺款 固府? ?快喊 酒?扼 固府? 救崇 磅促? ?福? ?柯秦 ?腔磐 喊? ?柯秦 快府? ???? 厚唱府 ?柯秦 ??合 崔撥 磅促? 肺款 救崇 酒? 肺款 官唱唱 唱厚? 魂甸覆 崔撥.', 2, '2022-12-15', 'member02');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '殿俊 舅 ? ?? 惑?甫 ?? ?? 辨??? ‘成部’', '喊蝴 酒府酒 ?快喊 ??俺 ?快厚 ?快喊 肺款 ??合 ??合 ??包 固悔促 弊?? 弊?? 快府? 固府? 喊蝴 慷?? ?快喊 官恩采 ????促 ??俺 固府? 酒? ?柯穿府 快府? 厚唱府 ??包 魂甸覆 快府? 家? 唱? 酒? 崔撥 ?柯穿府 磅促? 慷?? 抗弊府唱 ?腔磐 家?家? 弊?? 氓? 弊?? 慷?? 固府? ?快厚 固悔促 磅促? 官恩采 ?快喊 ??.

喊蝴 磅促? 唱厚? 唱? 喊? 固府? 疵前 ??包 促? 固府? 喊? 抗弊府唱 ?腔磐 磅促? 家?家? ??合 救崇 ?快厚 ??合 唱? 家? 酒?扼 家? ???? 家?家? 快府? ????促 肺款 官唱唱 疵前 酒?扼 酒??府 酒? 家? 肺款 器? ?快厚 ?? 快府? ?福? 酒府酒 氓? ??包 家? ?敲 魂甸覆 固府? 快府? ?柯秦 抗弊府唱.

快府? ?福? ????促 ????促 ?柯穿府 喊? 疵前 官恩采 厚唱府 家? ?柯秦 酒?扼 唱? ?快厚 ?腔磐 ????促 ?柯穿府 官唱唱 肺款 家? ?柯穿府 ?快厚 ?? 家?家? 器? ?快厚 酒? ?苞 ????促 喊? 唱厚? ??包 磅促? ?苞 氓? 魂甸覆 ????促 ????促 家?家? 酒??府 ??俺 ????促 酒? 唱厚? 弊?? ?敲 ?快喊 救崇 官恩采 固悔促.

??合 ?? ??合 魂甸覆 ??合 ?? 磅促? ?快厚 ?? ?敲 崔撥 ?腔磐 慷?? 弊?? 器? 官唱唱 ??包 慷?? 官恩采 唱? 酒府酒 慷?? 促? 酒府酒 唱? 酒府酒 ?敲 家? 疵前 固悔促 喊蝴 ??合 促? ??合 ?苞 喊蝴 弊?? 磅促? 氓? ?快喊 酒? ?腔磐 ???? 器? 疵前 崔撥 酒?扼 喊蝴 慷?? 家?.', 3, '2023-11-02', 'member03');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '背烹??肺 促府 例?? ?且 ? ?菌? ??? ‘?宏’', '?福? 疵前 肺款 ?快喊 促? ?? ????促 ????促 ??俺 ??俺 慷?? 厚唱府 ?柯秦 氓? 唱厚? ?福? 官恩采 ?福? 酒??府 ????促 ?敲 酒府酒 慷?? ????促 固悔促 ?柯穿府 酒?扼 ?敲 ?柯穿府 抗弊府唱 酒? 唱厚? ?快喊 ??俺 官唱唱 ??包 磅促? ?柯穿府 肺款 酒??府 ??俺 促? ??合 ?敲 快府? ?快喊.

唱? ????促 ??合 酒? 慷?? ?福? 氓? 唱? ?柯秦 慷?? 官恩采 ?? 官唱唱 酒府酒 ??包 快府? ?腔磐 ????促 固悔促 ??俺 救崇 ?苞 ????促 喊蝴 ?柯穿府 ?敲 肺款 器? ????促 ?? ??俺 喊? 弊?? 崔撥 ?敲 ?柯秦 器? 固悔促 抗弊府唱 ????促 唱? ????促 喊? ???? 魂甸覆 固府? 救崇 ????促 肺款 酒??府.

慷?? ?苞 ?柯秦 ?快厚 ?福? 酒? 酒府酒 酒府酒 ?敲 抗弊府唱 ?敲 慷?? ?福? ?快厚 ??合 ???? ?福? ??俺 ??合 固府? ?快喊 抗弊府唱 崔撥 酒府酒 ??包 喊? 磅促? 家?家? ?快喊 磅促? ??合 磅促? ???? 官恩采 ?柯秦 ??俺 喊蝴 酒? 固府? ????促 ?敲 ????促 酒府酒 ?腔磐 固府? 磅促? ?敲 家?家? 家?家? 磅促?.

快府? 崔撥 崔撥 氓? 崔撥 官唱唱 魂甸覆 弊?? ????促 魂甸覆 官唱唱 ?柯穿府 ????促 磅促? 肺款 ?快喊 ?柯秦 唱? 磅促? 酒? ?柯秦 喊蝴 弊?? ????促 酒?扼 官恩采 魂甸覆 快府? 家? 抗弊府唱 ????促 ?快喊 酒府酒 快府? 家? 官唱唱 喊蝴 唱厚? 酒? ?敲 救崇 ????促 酒??府 ?柯穿府 喊蝴 ??俺 疵前 酒??府 酒?扼 酒府酒.', 4, '2024-01-21', 'member04');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '?妨款 惑?加俊? 父抄 ??堪 ??? ‘八嫡’?', '?柯穿府 酒?扼 酒?扼 崔撥 促? 磅促? 魂甸覆 弊?? 弊?? 喊? ?快喊 ?柯秦 抗弊府唱 疵前 器? 酒? 氓? 酒府酒 弊?? 崔撥 官恩采 慷?? 唱厚? 慷?? ?快喊 ?敲 厚唱府 魂甸覆 促? 酒??府 ?快厚 固悔促 氓? 喊? 快府? 快府? ?苞 ?敲 厚唱府 肺款 ?柯秦 氓? 救崇 固悔促 ?柯秦 家?家? ??俺 酒??府 肺款 促?.

官恩采 疵前 喊? 救崇 酒府酒 魂甸覆 ?柯秦 喊? 酒?扼 ?柯秦 ????促 ?柯秦 酒? 魂甸覆 ????促 ????促 慷?? 器? 弊?? 官唱唱 ?? ??俺 ?柯穿府 ????促 喊? 官恩采 氓? 酒?扼 家? ?柯秦 ?腔磐 固府? 崔撥 固悔促 ??合 肺款 ?柯秦 ?腔磐 慷?? ?柯秦 氓? 喊蝴 喊? 固悔促 快府? 氓? 慷?? 弊?? ?腔磐 氓?.

器? 肺款 救崇 ?腔磐 ?福? 慷?? ?快厚 快府? ?福? 抗弊府唱 家? 促? 喊蝴 肺款 酒??府 器? ?快喊 疵前 固府? 酒?扼 酒府酒 喊? 救崇 ??俺 官恩采 唱厚? 喊? ?腔磐 促? ????促 家? ????促 ?腔磐 ?快喊 弊?? 官唱唱 ?敲 ????促 ??合 ?柯秦 磅促? 酒? 喊? 酒?扼 氓? 快府? ?苞 ?柯穿府 ????促 疵前.

?柯秦 慷?? 磅促? ?? 厚唱府 家? 崔撥 魂甸覆 ?快喊 ?敲 ?腔磐 肺款 ?苞 ?腔磐 家?家? 酒??府 固府? ????促 ??合 厚唱府 ??俺 ?快厚 固悔促 崔撥 ?苞 官唱唱 ?福? 固悔促 ??包 酒?扼 促? ??合 酒? 救崇 氓? 固悔促 酒府酒 家?家? 弊?? 家? ?腔磐 固悔促 ???? 弊?? ????促 酒府酒 ?快厚 官唱唱 ??合 ?福?.', 5, '2023-06-24', 'member05');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '芭措??? ???? ?? ???瘤 ?茄 ?扁功 ‘??’', '?福? 器? 酒?扼 ??合 酒? 酒府酒 厚唱府 ?福? 唱厚? 酒府酒 氓? 唱? ?柯穿府 ??俺 疵前 ???? 酒? 固府? ????促 ????促 促? ?苞 ????促 弊?? 酒? ??俺 ???? 酒? 救崇 抗弊府唱 氓? 酒府酒 ?苞 崔撥 ?苞 酒??府 ?柯穿府 ?腔磐 ?? 肺款 固府? ?柯秦 酒? 唱? 唱厚? ?柯秦 氓? 酒?扼 ??俺 ?敲.

慷?? 磅促? 器? ?快厚 救崇 疵前 酒??府 ?柯秦 快府? ?柯穿府 氓? 固悔促 ?快喊 ????促 崔撥 唱厚? ??合 ????促 ?敲 酒? ?腔磐 官唱唱 魂甸覆 崔撥 器? ?福? 疵前 酒??府 唱? 氓? ?柯穿府 固府? ?快厚 ?苞 固府? 喊蝴 酒?扼 促? 家? 肺款 唱? ?柯秦 ?苞 肺款 氓? 磅促? 魂甸覆 酒?扼 酒府酒 喊?.

厚唱府 喊蝴 氓? 家?家? 酒??府 ?? 家?家? ??俺 弊?? 官唱唱 ??俺 ?腔磐 唱? ?快喊 家? 崔撥 ?腔磐 ?? ?腔磐 磅促? 抗弊府唱 快府? 家?家? 抗弊府唱 ?福? 官唱唱 ?腔磐 抗弊府唱 ?快厚 崔撥 酒府酒 疵前 促? ?柯秦 唱? 促? ?福? ?? 肺款 器? 崔撥 疵前 ?柯秦 快府? 肺款 ?腔磐 酒??府 ??合 唱厚? 喊蝴.

?苞 ??合 弊?? 固悔促 ?柯秦 ????促 酒??府 疵前 官唱唱 ????促 促? 慷?? 快府? 救崇 ?福? 喊蝴 喊? 固府? 家? ?快喊 喊? 磅促? 崔撥 家? ?柯秦 ?柯秦 ??包 固悔促 ?福? 磅促? 氓? 官唱唱 ?腔磐 ????促 官唱唱 ????促 固悔促 ????促 喊蝴 官恩采 快府? ????促 ???? 抗弊府唱 唱厚? ??俺 器? 磅促? ???? 磅促?.', 6, '2023-09-23', 'member06');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '??? ?扁瘤 ??? ?疵狼 喊? 等 ‘付?’', '??包 ?? 酒? 官唱唱 救崇 ?苞 ?腔磐 快府? 抗弊府唱 ?快喊 酒??府 酒? ?柯秦 促? 氓? 厚唱府 ??包 ?柯穿府 ?敲 唱? ??合 慷?? ?? ??包 快府? 肺款 肺款 家? 魂甸覆 崔撥 魂甸覆 官恩采 氓? ???? ?敲 ????促 酒? 喊? 厚唱府 ?快厚 弊?? 慷?? ????促 促? 磅促? ?柯穿府 促? ?快厚 ?? ??.

酒府酒 ?苞 弊?? 救崇 官恩采 ?柯秦 固府? 酒? ??合 ?苞 ?快喊 酒?扼 喊蝴 快府? 唱? 酒府酒 ?柯穿府 官恩采 酒??府 慷?? ?敲 ?敲 促? 氓? ????促 促? ?苞 ????促 ?柯秦 官恩采 ?快厚 氓? 官唱唱 ?快厚 疵前 快府? 器? ????促 崔撥 魂甸覆 救崇 酒? 崔撥 酒府酒 ??包 魂甸覆 官恩采 ???? ?苞 酒?.

氓? 器? ?敲 ????促 ?腔磐 氓? ?福? ?福? 厚唱府 酒? ?柯穿府 唱? ??俺 抗弊府唱 ?柯秦 魂甸覆 酒府酒 ?柯秦 促? 固府? 抗弊府唱 ?苞 疵前 ??合 唱厚? 家?家? 弊?? 酒?扼 酒??府 ?柯穿府 固府? 固悔促 疵前 固悔促 酒?扼 官唱唱 ?福? 喊? ?柯穿府 酒??府 官唱唱 喊蝴 ?? 喊蝴 家?家? 快府? 快府? ??包 喊? ?快厚.

?苞 慷?? ?柯秦 唱? ?快喊 唱厚? 快府? 官唱唱 ?苞 酒? 抗弊府唱 ??包 厚唱府 肺款 ??俺 酒?扼 唱? 厚唱府 ?腔磐 魂甸覆 ?苞 官恩采 ??包 ?苞 崔撥 家?家? 喊蝴 ??包 厚唱府 ????促 固悔促 酒?扼 喊蝴 ????促 ?快厚 ?快厚 ?快厚 唱? 唱厚? ?快喊 促? ????促 磅促? 官唱唱 器? 救崇 疵前 ?苞 磅促? ?柯穿府.', 7, '2023-11-10', 'member07');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '?甸扁父 秦? ??堪? ?? ?? ‘?肺’', '固府? 酒? ??包 ?福? 疵前 慷?? 崔撥 酒府酒 酒府酒 ?敲 疵前 唱厚? ????促 ????促 ?福? 官恩采 ?快喊 魂甸覆 崔撥 厚唱府 ?腔磐 喊? 官恩采 快府? 疵前 喊蝴 ?敲 ?? ??俺 快府? ?柯穿府 魂甸覆 快府? ?快厚 ?柯穿府 官恩采 抗弊府唱 ?敲 酒? ??合 ?柯穿府 ?柯穿府 固府? 救崇 ?苞 厚唱府 唱? ?? 固府? 氓?.

?苞 ????促 家? 酒府酒 酒? 唱? 抗弊府唱 厚唱府 官恩采 疵前 ?快厚 ?苞 ?柯穿府 崔撥 固府? 固府? ?快喊 家?家? ??包 氓? 磅促? 器? ?快喊 固悔促 弊?? 促? ?快喊 ?苞 ????促 喊蝴 磅促? 酒??府 ????促 ?敲 酒??府 喊? 酒府酒 ?柯秦 ??合 酒? 氓? 官唱唱 慷?? ??包 ???? 器? ?? 官恩采 官唱唱 磅促?.

???? 崔撥 固悔促 ?? 喊蝴 快府? 喊蝴 厚唱府 慷?? ?福? 弊?? ?苞 固府? 喊蝴 唱厚? 磅促? 魂甸覆 ????促 家?家? 官唱唱 慷?? ??俺 酒? ?腔磐 ??包 酒?扼 魂甸覆 喊蝴 固悔促 抗弊府唱 ??合 ?苞 ?快厚 厚唱府 喊? 官恩采 ??合 抗弊府唱 唱厚? ?敲 家? 魂甸覆 固悔促 厚唱府 ????促 ?快喊 ????促 快府? 唱? 喊?.

促? ?柯秦 ???? 固悔促 喊? 家?家? ?敲 疵前 酒?扼 ?? 魂甸覆 ????促 ????促 ?敲 ???? ????促 疵前 ?快厚 喊蝴 ?福? ?柯穿府 疵前 崔撥 ??合 器? ?柯秦 ?快喊 ?苞 ?? 弊?? ??包 器? 魂甸覆 慷?? ?苞 家? ?柯秦 ?? 固府? 救崇 ?柯穿府 魂甸覆 ????促 厚唱府 ?? 家?家? ?快厚 官唱唱 ?苞 ?敲.', 8, '2023-08-22', 'member08');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '背烹??牢瘤 ?港? 甸? 林??疽? ‘???’', '救崇 ?福? ???? 固悔促 ?柯穿府 氓? 喊蝴 ?柯穿府 磅促? ????促 崔撥 肺款 唱? 唱厚? ????促 疵前 ?? 家?家? ????促 家? 崔撥 酒?扼 酒?扼 ?快厚 ?敲 ???? 促? ???? 固悔促 喊蝴 慷?? 慷?? 救崇 喊蝴 ?快喊 ?快厚 ?苞 器? 固悔促 器? 酒? 崔撥 ?快厚 肺款 魂甸覆 酒? 喊蝴 ?快喊 ?福? 氓?.

快府? 抗弊府唱 家?家? 酒府酒 魂甸覆 ?? 喊? ?福? 唱? 酒??府 救崇 唱? ?快厚 慷?? 官恩采 弊?? 磅促? 家? 抗弊府唱 酒?扼 酒?扼 慷?? ??合 ??合 唱厚? ??包 酒??府 ?快厚 器? 疵前 慷?? 酒??府 魂甸覆 促? 快府? 慷?? ????促 喊? 酒??府 疵前 厚唱府 救崇 唱? 唱厚? 救崇 ?柯秦 官恩采 ?柯秦 ??合 ?快厚.

慷?? 魂甸覆 崔撥 官唱唱 ???? 家? ??合 ?? 固悔促 崔撥 ?快厚 ?福? 器? 喊蝴 ?腔磐 快府? 厚唱府 官恩采 疵前 ??包 器? ?快厚 家?家? 崔撥 ?柯穿府 促? 器? ?苞 疵前 崔撥 ???? 喊? 喊? 酒?扼 磅促? 促? ?? 磅促? 官恩采 崔撥 抗弊府唱 魂甸覆 磅促? 酒?扼 ?福? ?柯秦 氓? ??俺 ?? 崔撥.

酒?扼 ??包 厚唱府 弊?? 氓? 酒? ???? 氓? 魂甸覆 固府? 救崇 肺款 ?敲 唱? ??俺 酒??府 ???? 厚唱府 崔撥 官唱唱 ??合 ??俺 喊蝴 ??合 ?腔磐 酒?扼 唱? ????促 唱? 肺款 磅促? 崔撥 氓? 磅促? ?苞 厚唱府 弊?? 官恩采 固悔促 ??俺 官唱唱 ?福? 唱厚? 家? 肺款 ?福? ????促 喊蝴 官唱唱 官恩采.', 9, '2023-06-22', 'member09');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '酒?? 力措肺 ??甫 久瘤 ??? ?快 ??? ‘???’', '酒??府 疵前 ?柯穿府 ?苞 抗弊府唱 ???? 酒?扼 氓? 酒?扼 促? 慷?? ?腔磐 ????促 肺款 促? 家? 救崇 酒??府 ????促 器? 家? 固府? ???? 磅促? 疵前 ?快喊 ???? 固悔促 酒府酒 酒??府 ???? 磅促? 酒??府 酒? 抗弊府唱 ??俺 ?福? 喊蝴 抗弊府唱 ?苞 抗弊府唱 ?腔磐 ?福? 魂甸覆 救崇 厚唱府 喊蝴 家? 官恩采 崔撥.

?快厚 喊? 酒?扼 酒??府 抗弊府唱 弊?? ????促 酒府酒 官恩采 官唱唱 疵前 固悔促 ??包 喊? ??合 救崇 ?? ?福? 官恩采 ??包 ???? 酒??府 唱厚? 厚唱府 氓? 氓? 喊蝴 救崇 疵前 官恩采 ?快喊 固悔促 ?柯秦 ????促 救崇 ????促 疵前 唱厚? 家?家? 肺款 崔撥 唱? 官唱唱 氓? ?? 快府? 酒??府 ????促 ?? ?柯穿府.

????促 ?快厚 ?? 酒府酒 ?快喊 磅促? 酒府酒 喊? 氓? 魂甸覆 酒府酒 氓? 魂甸覆 喊蝴 唱? 官唱唱 ?苞 ?? ?福? 官唱唱 家?家? ????促 家? ?柯秦 ??包 ?柯秦 厚唱府 快府? 快府? 弊?? 氓? 酒? 唱厚? 唱? 弊?? 家? 固悔促 弊?? ?福? ?? ?苞 弊?? 酒?扼 ?柯秦 ?快厚 ????促 ??合 官唱唱 酒? 器?.

救崇 ??俺 ??俺 固悔促 ?柯秦 ?? 快府? 固府? 肺款 官恩采 酒?扼 ?快喊 ??包 酒? 快府? 氓? 器? 喊? 疵前 ?快喊 ??合 崔撥 唱厚? 固悔促 ?柯穿府 喊蝴 唱? ?? ??俺 救崇 ?苞 氓? 崔撥 快府? 崔撥 喊蝴 ?? 喊? ????促 唱厚? ?柯秦 ????促 喊蝴 ????促 慷?? ??合 ?腔磐 酒??府 喊蝴 氓?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '??堪?肺 舅酒杭 ? ?菌? ‘魂? 酒狐’', '酒??府 疵前 ?柯穿府 ?苞 抗弊府唱 ???? 酒?扼 氓? 酒?扼 促? 慷?? ?腔磐 ????促 肺款 促? 家? 救崇 酒??府 ????促 器? 家? 固府? ???? 磅促? 疵前 ?快喊 ???? 固悔促 酒府酒 酒??府 ???? 磅促? 酒??府 酒? 抗弊府唱 ??俺 ?福? 喊蝴 抗弊府唱 ?苞 抗弊府唱 ?腔磐 ?福? 魂甸覆 救崇 厚唱府 喊蝴 家? 官恩采 崔撥.

?快厚 喊? 酒?扼 酒??府 抗弊府唱 弊?? ????促 酒府酒 官恩采 官唱唱 疵前 固悔促 ??包 喊? ??合 救崇 ?? ?福? 官恩采 ??包 ???? 酒??府 唱厚? 厚唱府 氓? 氓? 喊蝴 救崇 疵前 官恩采 ?快喊 固悔促 ?柯秦 ????促 救崇 ????促 疵前 唱厚? 家?家? 肺款 崔撥 唱? 官唱唱 氓? ?? 快府? 酒??府 ????促 ?? ?柯穿府.

????促 ?快厚 ?? 酒府酒 ?快喊 磅促? 酒府酒 喊? 氓? 魂甸覆 酒府酒 氓? 魂甸覆 喊蝴 唱? 官唱唱 ?苞 ?? ?福? 官唱唱 家?家? ????促 家? ?柯秦 ??包 ?柯秦 厚唱府 快府? 快府? 弊?? 氓? 酒? 唱厚? 唱? 弊?? 家? 固悔促 弊?? ?福? ?? ?苞 弊?? 酒?扼 ?柯秦 ?快厚 ????促 ??合 官唱唱 酒? 器?.

救崇 ??俺 ??俺 固悔促 ?柯秦 ?? 快府? 固府? 肺款 官恩采 酒?扼 ?快喊 ??包 酒? 快府? 氓? 器? 喊? 疵前 ?快喊 ??合 崔撥 唱厚? 固悔促 ?柯穿府 喊蝴 唱? ?? ??俺 救崇 ?苞 氓? 崔撥 快府? 崔撥 喊蝴 ?? 喊? ????促 唱厚? ?柯秦 ????促 喊蝴 ????促 慷?? ??合 ?腔磐 酒??府 喊蝴 氓?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '? 惑?? ???菌? 辨??? ‘虐冠’?', '酒??府 疵前 ?柯穿府 ?苞 抗弊府唱 ???? 酒?扼 氓? 酒?扼 促? 慷?? ?腔磐 ????促 肺款 促? 家? 救崇 酒??府 ????促 器? 家? 固府? ???? 磅促? 疵前 ?快喊 ???? 固悔促 酒府酒 酒??府 ???? 磅促? 酒??府 酒? 抗弊府唱 ??俺 ?福? 喊蝴 抗弊府唱 ?苞 抗弊府唱 ?腔磐 ?福? 魂甸覆 救崇 厚唱府 喊蝴 家? 官恩采 崔撥.

?快厚 喊? 酒?扼 酒??府 抗弊府唱 弊?? ????促 酒府酒 官恩采 官唱唱 疵前 固悔促 ??包 喊? ??合 救崇 ?? ?福? 官恩采 ??包 ???? 酒??府 唱厚? 厚唱府 氓? 氓? 喊蝴 救崇 疵前 官恩采 ?快喊 固悔促 ?柯秦 ????促 救崇 ????促 疵前 唱厚? 家?家? 肺款 崔撥 唱? 官唱唱 氓? ?? 快府? 酒??府 ????促 ?? ?柯穿府.

????促 ?快厚 ?? 酒府酒 ?快喊 磅促? 酒府酒 喊? 氓? 魂甸覆 酒府酒 氓? 魂甸覆 喊蝴 唱? 官唱唱 ?苞 ?? ?福? 官唱唱 家?家? ????促 家? ?柯秦 ??包 ?柯秦 厚唱府 快府? 快府? 弊?? 氓? 酒? 唱厚? 唱? 弊?? 家? 固悔促 弊?? ?福? ?? ?苞 弊?? 酒?扼 ?柯秦 ?快厚 ????促 ??合 官唱唱 酒? 器?.

救崇 ??俺 ??俺 固悔促 ?柯秦 ?? 快府? 固府? 肺款 官恩采 酒?扼 ?快喊 ??包 酒? 快府? 氓? 器? 喊? 疵前 ?快喊 ??合 崔撥 唱厚? 固悔促 ?柯穿府 喊蝴 唱? ?? ??俺 救崇 ?苞 氓? 崔撥 快府? 崔撥 喊蝴 ?? 喊? ????促 唱厚? ?柯秦 ????促 喊蝴 ????促 慷?? ??合 ?腔磐 酒??府 喊蝴 氓?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '??堪 摹?何磐 ???瘤, 辨??? ‘??’ ?具扁', '酒??府 疵前 ?柯穿府 ?苞 抗弊府唱 ???? 酒?扼 氓? 酒?扼 促? 慷?? ?腔磐 ????促 肺款 促? 家? 救崇 酒??府 ????促 器? 家? 固府? ???? 磅促? 疵前 ?快喊 ???? 固悔促 酒府酒 酒??府 ???? 磅促? 酒??府 酒? 抗弊府唱 ??俺 ?福? 喊蝴 抗弊府唱 ?苞 抗弊府唱 ?腔磐 ?福? 魂甸覆 救崇 厚唱府 喊蝴 家? 官恩采 崔撥.

?快厚 喊? 酒?扼 酒??府 抗弊府唱 弊?? ????促 酒府酒 官恩采 官唱唱 疵前 固悔促 ??包 喊? ??合 救崇 ?? ?福? 官恩采 ??包 ???? 酒??府 唱厚? 厚唱府 氓? 氓? 喊蝴 救崇 疵前 官恩采 ?快喊 固悔促 ?柯秦 ????促 救崇 ????促 疵前 唱厚? 家?家? 肺款 崔撥 唱? 官唱唱 氓? ?? 快府? 酒??府 ????促 ?? ?柯穿府.

????促 ?快厚 ?? 酒府酒 ?快喊 磅促? 酒府酒 喊? 氓? 魂甸覆 酒府酒 氓? 魂甸覆 喊蝴 唱? 官唱唱 ?苞 ?? ?福? 官唱唱 家?家? ????促 家? ?柯秦 ??包 ?柯秦 厚唱府 快府? 快府? 弊?? 氓? 酒? 唱厚? 唱? 弊?? 家? 固悔促 弊?? ?福? ?? ?苞 弊?? 酒?扼 ?柯秦 ?快厚 ????促 ??合 官唱唱 酒? 器?.

救崇 ??俺 ??俺 固悔促 ?柯秦 ?? 快府? 固府? 肺款 官恩采 酒?扼 ?快喊 ??包 酒? 快府? 氓? 器? 喊? 疵前 ?快喊 ??合 崔撥 唱厚? 固悔促 ?柯穿府 喊蝴 唱? ?? ??俺 救崇 ?苞 氓? 崔撥 快府? 崔撥 喊蝴 ?? 喊? ????促 唱厚? ?柯秦 ????促 喊蝴 ????促 慷?? ??合 ?腔磐 酒??府 喊蝴 氓?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '促府甫 例哥 困??? 叭? 辨??? ‘??’', '酒??府 疵前 ?柯穿府 ?苞 抗弊府唱 ???? 酒?扼 氓? 酒?扼 促? 慷?? ?腔磐 ????促 肺款 促? 家? 救崇 酒??府 ????促 器? 家? 固府? ???? 磅促? 疵前 ?快喊 ???? 固悔促 酒府酒 酒??府 ???? 磅促? 酒??府 酒? 抗弊府唱 ??俺 ?福? 喊蝴 抗弊府唱 ?苞 抗弊府唱 ?腔磐 ?福? 魂甸覆 救崇 厚唱府 喊蝴 家? 官恩采 崔撥.

?快厚 喊? 酒?扼 酒??府 抗弊府唱 弊?? ????促 酒府酒 官恩采 官唱唱 疵前 固悔促 ??包 喊? ??合 救崇 ?? ?福? 官恩采 ??包 ???? 酒??府 唱厚? 厚唱府 氓? 氓? 喊蝴 救崇 疵前 官恩采 ?快喊 固悔促 ?柯秦 ????促 救崇 ????促 疵前 唱厚? 家?家? 肺款 崔撥 唱? 官唱唱 氓? ?? 快府? 酒??府 ????促 ?? ?柯穿府.

????促 ?快厚 ?? 酒府酒 ?快喊 磅促? 酒府酒 喊? 氓? 魂甸覆 酒府酒 氓? 魂甸覆 喊蝴 唱? 官唱唱 ?苞 ?? ?福? 官唱唱 家?家? ????促 家? ?柯秦 ??包 ?柯秦 厚唱府 快府? 快府? 弊?? 氓? 酒? 唱厚? 唱? 弊?? 家? 固悔促 弊?? ?福? ?? ?苞 弊?? 酒?扼 ?柯秦 ?快厚 ????促 ??合 官唱唱 酒? 器?.

救崇 ??俺 ??俺 固悔促 ?柯秦 ?? 快府? 固府? 肺款 官恩采 酒?扼 ?快喊 ??包 酒? 快府? 氓? 器? 喊? 疵前 ?快喊 ??合 崔撥 唱厚? 固悔促 ?柯穿府 喊蝴 唱? ?? ??俺 救崇 ?苞 氓? 崔撥 快府? 崔撥 喊蝴 ?? 喊? ????促 唱厚? ?柯秦 ????促 喊蝴 ????促 慷?? ??合 ?腔磐 酒??府 喊蝴 氓?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '??堪?肺 ??甫 ?? ? ?府甫 如甸? ‘局扁’', '酒??府 疵前 ?柯穿府 ?苞 抗弊府唱 ???? 酒?扼 氓? 酒?扼 促? 慷?? ?腔磐 ????促 肺款 促? 家? 救崇 酒??府 ????促 器? 家? 固府? ???? 磅促? 疵前 ?快喊 ???? 固悔促 酒府酒 酒??府 ???? 磅促? 酒??府 酒? 抗弊府唱 ??俺 ?福? 喊蝴 抗弊府唱 ?苞 抗弊府唱 ?腔磐 ?福? 魂甸覆 救崇 厚唱府 喊蝴 家? 官恩采 崔撥.

?快厚 喊? 酒?扼 酒??府 抗弊府唱 弊?? ????促 酒府酒 官恩采 官唱唱 疵前 固悔促 ??包 喊? ??合 救崇 ?? ?福? 官恩采 ??包 ???? 酒??府 唱厚? 厚唱府 氓? 氓? 喊蝴 救崇 疵前 官恩采 ?快喊 固悔促 ?柯秦 ????促 救崇 ????促 疵前 唱厚? 家?家? 肺款 崔撥 唱? 官唱唱 氓? ?? 快府? 酒??府 ????促 ?? ?柯穿府.

????促 ?快厚 ?? 酒府酒 ?快喊 磅促? 酒府酒 喊? 氓? 魂甸覆 酒府酒 氓? 魂甸覆 喊蝴 唱? 官唱唱 ?苞 ?? ?福? 官唱唱 家?家? ????促 家? ?柯秦 ??包 ?柯秦 厚唱府 快府? 快府? 弊?? 氓? 酒? 唱厚? 唱? 弊?? 家? 固悔促 弊?? ?福? ?? ?苞 弊?? 酒?扼 ?柯秦 ?快厚 ????促 ??合 官唱唱 酒? 器?.

救崇 ??俺 ??俺 固悔促 ?柯秦 ?? 快府? 固府? 肺款 官恩采 酒?扼 ?快喊 ??包 酒? 快府? 氓? 器? 喊? 疵前 ?快喊 ??合 崔撥 唱厚? 固悔促 ?柯穿府 喊蝴 唱? ?? ??俺 救崇 ?苞 氓? 崔撥 快府? 崔撥 喊蝴 ?? 喊? ????促 唱厚? ?柯秦 ????促 喊蝴 ????促 慷?? ??合 ?腔磐 酒??府 喊蝴 氓?.', 10, '2022-12-31', 'member10');


insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 719', '2022-05-27', 1, 'member01');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 418', '2024-02-02', 2, 'member02');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Suite 35', '2023-03-21', 3, 'member03');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 1251', '2022-04-04', 4, 'member04');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'PO Box 97750', '2023-06-23', 5, 'member05');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 1171', '2022-03-08', 6, 'member06');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, '17th Floor', '2023-11-07', 7, 'member07');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Room 167', '2022-06-10', 8, 'member08');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Room 1216', '2023-12-24', 9, 'member09');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Room 306', '2023-02-03', 10, 'member10');

--???????瓣????? ?????, ????

CREATE TABLE adoptionFeedbackBoard (
	afboard_id	number		NOT NULL,
	afboard_title	varchar2(80)		NOT NULL,
	afboard_content	varchar2(2000)		NOT NULL,
	afboard_cnt	number	DEFAULT 0	NOT NULL,
	afboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);


CREATE TABLE AFcomment (
	afcomment_id	number		NOT NULL,
	afcomment_content	varchar2(150)		NOT NULL,
	afcomment_date	date	DEFAULT sysdate	NOT NULL,
	afboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

ALTER TABLE adoptionFeedbackBoard ADD CONSTRAINT PK_ADOPTIONFEEDBACKBOARD PRIMARY KEY (
	afboard_id
);

ALTER TABLE adoptionFeedbackBoard ADD CONSTRAINT FK_users_TO_adoptionFeedbackBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
)ON DELETE CASCADE;




ALTER TABLE AFcomment ADD CONSTRAINT PK_AFCOMMENT PRIMARY KEY (
	afcomment_id
);

ALTER TABLE AFcomment ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_AFcomment_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
)ON DELETE CASCADE;

ALTER TABLE AFcomment ADD CONSTRAINT FK_users_TO_AFcomment_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
)ON DELETE CASCADE;

create sequence adoptionFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

create sequence AFcomment_seq
start with 1
increment by 1
nocycle
nocache;

insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '??狼 ??? ??秦 林技??', '??狼 ??? ??秦 林技?~



??? ?秒? ??沁? ?滴款 厚??快? 救, 累? ? ?唱 祈? 穿? ? ? ?? ?? ??厘俊? ??登菌嚼?促. 八柳? 柳???? 付林茄 ??狼 葛嚼? 呈公唱? 救??奎嚼?促. ?? ?埃 ?摹登? ??? ?? 判肺 ??狼 ?何? 腹? 距秦廉 ?菌嚼?促. ??? 距?? ??, 豪?磊?甸苞 ?悼?甸狼 ??? ?灰 罐?哥 隔扼?? ?碍秦柳 ??! 弊繁 ??? ??? ??? 父唱? 登菌嚼?促. ??? ??? 父唱? ?? 辨, ???? ?膊秦林?嚼?促. ', 1, '2022-10-28', 'member01');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?虐 ???扁', '??俺 氓? 酒?扼 崔撥 酒??府 磅促? 器? 快府? ???? ?苞 崔撥 磅促? 快府? ????促 ?? 厚唱府 家? ????促 ??合 酒?扼 磅促? ???? 官恩采 酒??府 酒?扼 肺款 ??合 家? 酒??府 救崇 肺款 ?福? ?福? 喊? 慷?? 酒? ??合 ?柯穿府 ?苞 厚唱府 ?苞 崔撥 磅促? 崔撥 氓? 酒府酒 ??包 器? 肺款 崔撥.

??俺 快府? 救崇 固府? ?柯穿府 酒? 器? 家?家? 酒? ?福? 唱? 促? 家? 喊蝴 ??合 ????促 固悔促 疵前 ?腔磐 酒府酒 酒?扼 喊蝴 唱厚? 官唱唱 磅促? ?快喊 固悔促 家? 疵前 ?快厚 ????促 促? 喊? ?腔磐 固府? ????促 固府? 家?家? 崔撥 酒? ?腔磐 家?家? ????促 弊?? 促? ?敲 ???? 固悔促 ????促 家?家?.

唱? ?柯穿府 喊? ?敲 疵前 弊?? ?快喊 ?快厚 氓? 氓? 家? 器? 救崇 ?? 官恩采 ?腔磐 唱厚? 弊?? 慷?? ?敲 抗弊府唱 固府? ?腔磐 喊? ?柯穿府 促? ?腔磐 磅促? 家? ??合 喊蝴 酒府酒 ?柯秦 厚唱府 疵前 酒府酒 酒??府 ?腔磐 ??包 氓? 磅促? 磅促? ?柯秦 唱厚? 喊蝴 酒? 肺款 ?? 器? 固府?.

固悔促 快府? ?柯穿府 ????促 肺款 ?福? 固悔促 ?苞 促? ??俺 器? ?快喊 ?柯秦 磅促? 官恩采 ?福? ?快厚 ??俺 肺款 弊?? 固府? 魂甸覆 家?家? 唱厚? 肺款 固悔促 ????促 ?? 救崇 ?快厚 官恩采 ?福? ????促 救崇 固府? ?敲 救崇 酒? ?快喊 官恩采 唱? ????促 厚唱府 肺款 氓? ???? 官唱唱 ?柯秦 ?柯穿府 厚唱府.', 2, '2023-11-09', 'member02');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?? ???扁 ?', '????促 弊?? 酒??府 酒?扼 ??包 唱厚? 救崇 喊蝴 厚唱府 疵前 氓? 家? ??俺 ?? 器? 器? 弊?? 崔撥 ?快喊 肺款 ??俺 ?快喊 快府? 魂甸覆 ????促 喊蝴 ?敲 ?柯穿府 唱? 崔撥 ?? ?柯秦 唱? 快府? 氓? 肺款 ?敲 官恩采 ?福? 家?家? 家? 崔撥 ?敲 酒府酒 ??合 氓? 促? 酒?扼 ?苞 家?.

官唱唱 ?敲 固悔促 ?快喊 唱? 官唱唱 家?家? 酒? 家?家? 酒府酒 ?柯秦 ?? 喊? 固悔促 酒?扼 ????促 氓? ??俺 ?敲 ???? ?福? ?快厚 喊? ???? 器? ?苞 磅促? 唱厚? 家?家? 肺款 ?快厚 磅促? 喊蝴 ???? ?快喊 抗弊府唱 肺款 弊?? 魂甸覆 固府? 慷?? 磅促? 崔撥 ?快厚 喊? 固悔促 ?柯穿府 唱? 厚唱府 器?.

唱? 固府? 救崇 快府? ????促 家? 崔撥 唱厚? 官唱唱 ???? ?福? 崔撥 酒府酒 快府? ?腔磐 ?福? 磅促? 固府? 快府? 厚唱府 喊蝴 酒??府 弊?? 疵前 ?快喊 器? ?腔磐 ?快喊 救崇 固府? 官恩采 ???? ??俺 唱厚? ??俺 ?柯穿府 ??合 抗弊府唱 ?福? 酒?扼 ?快喊 ??合 崔撥 ??俺 ?敲 酒? 氓? 固悔促 ?敲 家?家?.

酒? 慷?? 官唱唱 ????促 弊?? 喊? ???? 抗弊府唱 救崇 救崇 快府? 官唱唱 ?柯穿府 ?苞 ??包 酒? 酒? ?? 促? 抗弊府唱 ???? 抗弊府唱 ??合 魂甸覆 ?柯秦 酒??府 酒? ?柯秦 磅促? 唱厚? ????促 快府? ?苞 固悔促 ????促 固悔促 固府? 官唱唱 酒?扼 慷?? 磅促? 救崇 抗弊府唱 ?苞 快府? 喊蝴 促? 器? 促? ????.', 3, '2023-11-27', 'member03');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '弊肺快? ??? 父?嚼?促~', '快府? 家? 快府? 固府? 唱厚? 氓? 酒府酒 酒?扼 家?家? ??合 救崇 魂甸覆 魂甸覆 喊蝴 官唱唱 ?柯穿府 慷?? ??俺 慷?? ?? 救崇 肺款 抗弊府唱 唱厚? ????促 固府? ?快喊 氓? 疵前 弊?? ?快厚 厚唱府 厚唱府 器? 唱? ?敲 唱? 喊蝴 ??合 家? 促? ?? 抗弊府唱 喊? 酒?扼 ???? ??俺 ?苞 ??俺 ?快喊.

酒府酒 ?敲 家? ?苞 抗弊府唱 崔撥 喊蝴 ??包 ????促 喊? 器? 唱? ?敲 ?快喊 氓? ?柯穿府 快府? ?柯穿府 ?? 魂甸覆 酒府酒 魂甸覆 ?快厚 ?快喊 抗弊府唱 ??俺 官唱唱 家?家? 慷?? ?福? 喊? 酒?扼 官唱唱 厚唱府 磅促? 弊?? 酒??府 家? ?腔磐 酒府酒 器? ????促 快府? ?柯穿府 崔撥 酒? 抗弊府唱 ????促 酒府酒 喊?.

肺款 唱厚? 唱厚? ???? ???? 家? 快府? 磅促? 固悔促 疵前 ??合 ?柯秦 氓? ????促 ?敲 快府? 磅促? ?快厚 ?敲 ????促 酒? 酒??府 ??包 官恩采 慷?? ?? 固悔促 ?快厚 ???? 抗弊府唱 酒? 喊? ???? 救崇 ???? 官唱唱 厚唱府 ??俺 崔撥 ????促 慷?? ?苞 ???? 喊? ?福? 抗弊府唱 喊蝴 喊? ?快喊 厚唱府.

唱? ??俺 抗弊府唱 喊? 酒? 氓? ?? 酒府酒 ??合 ??包 ??合 抗弊府唱 ??合 崔撥 ?快厚 ????促 ?苞 喊? ??包 促? ?快厚 ?快厚 ?快喊 家? ?敲 磅促? ?柯秦 磅促? 官唱唱 ??俺 官恩采 ?敲 ?柯秦 促? 喊蝴 磅促? 酒府酒 ?福? 酒??府 肺款 酒府酒 促? ?快喊 ??包 ?福? 魂甸覆 厚唱府 ?柯秦 ?柯秦 器?.', 4, '2023-10-04', 'member04');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '???? ??? 父?嚼?促.', '酒? ????促 崔撥 ??合 唱? 喊? ?快厚 喊? 慷?? ????促 酒? 唱厚? ?柯秦 酒?扼 家? 唱厚? 促? ?快喊 家? ?苞 ????促 救崇 家? 氓? 固府? ?柯穿府 ?敲 唱? ????促 官唱唱 器? 氓? 救崇 ?柯秦 ??包 魂甸覆 固府? ????促 ?苞 ????促 ??合 ????促 促? 慷?? 弊?? 家?家? 氓? 疵前 抗弊府唱 磅促?.

??俺 酒? 酒府酒 慷?? ?? 疵前 ?柯穿府 器? 弊?? ??包 ????促 唱厚? 固府? 固悔促 厚唱府 喊? ?腔磐 ?苞 抗弊府唱 促? 疵前 固府? 弊?? ?腔磐 ?柯穿府 喊蝴 ?柯穿府 ??合 疵前 喊? 家? ?苞 官唱唱 ?柯穿府 厚唱府 氓? 官唱唱 ?柯秦 快府? ?福? ?? ?? 官唱唱 固悔促 ?快喊 唱? ????促 抗弊府唱 救崇 崔撥.

官唱唱 酒府酒 魂甸覆 崔撥 ?腔磐 固悔促 救崇 唱? 魂甸覆 快府? 喊? ?快厚 ?福? 唱? ?柯秦 ?福? 肺款 肺款 官唱唱 ???? 疵前 ???? 厚唱府 酒? ?柯穿府 固悔促 ?苞 酒? ?苞 磅促? 官恩采 ????促 酒府酒 喊? 家? ??合 器? 慷?? ????促 喊蝴 器? 崔撥 喊? 官恩采 唱? ??包 ?腔磐 喊蝴 ??包 唱厚?.

喊? 酒?扼 ?快厚 器? 固府? 喊? 家?家? ?腔磐 固府? ?快喊 喊? ??俺 救崇 促? ?柯穿府 酒府酒 快府? 弊?? ????促 ??包 氓? ??合 ??合 救崇 酒??府 酒府酒 疵前 ?快喊 ?苞 ????促 ?柯秦 疵前 ????促 ?快厚 ??包 ??合 ?快喊 慷?? ????促 酒??府 酒??府 ?敲 ?快喊 家?家? 固府? ??俺 家? 官恩采 ????促 崔撥.', 5, '2023-11-10', 'member05');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?府狼 ??? ??秦 林技?!', '酒?扼 官恩采 弊?? ???? ?腔磐 家?家? 快府? 官唱唱 官恩采 磅促? 促? ?柯穿府 酒府酒 弊?? ?快喊 ?柯穿府 ?柯穿府 唱厚? 固府? 酒??府 固府? ??包 ?? ?敲 肺款 官恩采 弊?? ?柯秦 ??俺 厚唱府 ?柯穿府 氓? 家?家? 氓? 崔撥 ?柯秦 官恩采 ??包 ?福? ????促 ?苞 ?快喊 酒? ?快厚 ?柯穿府 官唱唱 ?快厚 ?敲 ????促 家?家?.

喊蝴 ?? ?? ???? 厚唱府 疵前 酒府酒 疵前 官唱唱 慷?? 唱? 酒? ?苞 ???? ?腔磐 肺款 促? 疵前 弊?? ?柯秦 ??包 唱厚? 酒? ?快喊 魂甸覆 ?柯穿府 ?苞 固府? 促? 酒??府 官恩采 抗弊府唱 ?福? ?福? 酒? ????促 抗弊府唱 酒?扼 魂甸覆 酒??府 快府? 肺款 固府? ???? 酒? ?柯穿府 慷?? ?腔磐 固府? 磅促?.

????促 ??合 救崇 慷?? 家? 厚唱府 酒?扼 ?柯秦 固悔促 ????促 ??俺 官唱唱 ???? 喊? 厚唱府 唱厚? 快府? 酒??府 固悔促 ?福? 喊蝴 ??俺 固府? 官唱唱 崔撥 促? ???? 唱? 官唱唱 救崇 魂甸覆 ????促 固府? 家?家? 肺款 快府? 酒?扼 ??合 ?快喊 官恩采 促? 家? ?柯秦 快府? ??包 ???? ?快厚 崔撥 ??俺 ?柯穿府.

快府? ?快厚 酒府酒 喊蝴 氓? 酒??府 促? 唱厚? ?快厚 厚唱府 抗弊府唱 弊?? 磅促? 厚唱府 喊? 唱? 酒府酒 救崇 家? 促? ?福? ?腔磐 快府? 快府? ?? 酒??府 酒? 唱厚? 氓? 固悔促 疵前 厚唱府 ???? 固府? ????促 酒府酒 抗弊府唱 ??合 ?柯秦 厚唱府 酒?扼 官恩采 喊? 官唱唱 氓? 唱? ?腔磐 酒府酒 酒?扼 ?苞.', 6, '2022-12-16', 'member06');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '固匙客 公?狼 ???扁', '魂甸覆 ?快厚 抗弊府唱 ??合 酒?扼 ?柯秦 ???? 喊? ?福? ?快厚 喊蝴 喊? 氓? 肺款 厚唱府 酒府酒 ???? 家?家? 官唱唱 家? ???? ?? 酒府酒 快府? 家?家? ?柯秦 魂甸覆 快府? ?柯秦 厚唱府 喊蝴 崔撥 弊?? 家?家? 家?家? 固悔促 官唱唱 ?快厚 家? 酒府酒 官唱唱 厚唱府 厚唱府 ??合 固府? 酒??府 ?快喊 抗弊府唱 唱厚? ????.

官恩采 ??包 崔撥 唱厚? 肺款 ?? ??包 氓? 氓? 酒?扼 快府? ?快厚 家?家? 家?家? 磅促? 促? 酒府酒 抗弊府唱 肺款 慷?? 酒?扼 磅促? ??俺 疵前 ??包 喊? ??合 ???? 喊? 家? 魂甸覆 ?福? 氓? ?? ?? ?福? 救崇 ?柯穿府 厚唱府 ??包 酒??府 氓? 魂甸覆 喊? 抗弊府唱 慷?? ?? 唱厚? ????促 家?.

慷?? 磅促? ??合 崔撥 家?家? 弊?? 喊蝴 家?家? ?苞 弊?? 家?家? 固府? 固府? 魂甸覆 ?腔磐 磅促? 酒?扼 ?敲 家? 官唱唱 酒? ????促 快府? 崔撥 肺款 弊?? 弊?? ?柯秦 疵前 ?? 喊蝴 慷?? 唱? 救崇 疵前 家? ????促 官唱唱 ?腔磐 磅促? ?福? ????促 ????促 ?? 家? 酒??府 促? ????促 快府? 唱厚?.

魂甸覆 唱? 固悔促 肺款 魂甸覆 官恩采 ?柯穿府 磅促? ??合 喊蝴 氓? 家?家? 抗弊府唱 ?柯穿府 ??俺 促? 家? ?福? ????促 喊? 快府? 家?家? 器? 救崇 磅促? 疵前 固悔促 酒? 固府? 慷?? ?柯穿府 肺款 促? ?苞 喊? 促? 崔撥 器? ?? 氓? ???? 官恩采 厚唱府 抗弊府唱 固悔促 ?苞 厚唱府 氓? 酒? ?敲.', 7, '2023-07-15', 'member07');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '快府?柯瘤 6斥? :) ?? 8混? 等 酒?客 墨?!!', '弊?? 促? ?柯穿府 酒??府 固府? 慷?? 肺款 固府? 唱? 固悔促 ?福? 厚唱府 崔撥 ?柯穿府 崔撥 唱? 抗弊府唱 ??合 快府? ???? 家? 固悔促 弊?? 喊蝴 官唱唱 家? 酒?扼 固府? 崔撥 氓? 固府? ?快厚 肺款 ?苞 ?快厚 官恩采 魂甸覆 ?福? ?柯秦 ??包 酒??府 肺款 ?福? 酒府酒 ??合 ??俺 酒府酒 酒??府 ?福? 喊蝴.

??合 ???? 快府? ????促 ?福? 固府? ?柯秦 ?快厚 ??合 厚唱府 ?福? 固悔促 弊?? 肺款 器? 家? 固府? ?快喊 酒??府 器? 喊? 固府? 喊? 崔撥 酒??府 ??包 疵前 ?腔磐 酒??府 唱? ?柯秦 磅促? 厚唱府 慷?? ?柯穿府 厚唱府 器? ?柯穿府 疵前 固悔促 ??俺 官恩采 ?快厚 救崇 唱厚? ?腔磐 ???? 抗弊府唱 ??合 喊蝴.

磅促? 酒? 磅促? 唱? 唱? ?快喊 ??俺 ????促 喊? 酒??府 固府? ?福? ?快喊 酒府酒 唱厚? 器? ??合 氓? ?敲 官唱唱 ?福? 唱厚? 唱? 喊蝴 家? ?柯秦 氓? 慷?? 酒府酒 ?柯穿府 救崇 固悔促 ????促 厚唱府 器? 磅促? 家? 唱厚? ??俺 快府? ?敲 ????促 ?苞 ?快喊 酒??府 魂甸覆 抗弊府唱 ?柯秦 ?福? 疵前.

?快喊 ??包 ?福? 快府? ?快喊 ?腔磐 ??合 促? 酒?扼 慷?? ?? ?? 固府? 酒? 肺款 快府? 唱厚? ?腔磐 酒?扼 抗弊府唱 喊? 家? ????促 官恩采 酒?扼 ?苞 疵前 官唱唱 ?快喊 器? 官唱唱 ?柯秦 磅促? 喊? 酒? ????促 唱? 酒?扼 固悔促 磅促? ??包 肺款 喊蝴 固悔促 ?快喊 魂甸覆 ?柯穿府 酒府酒 酒?扼 ??.', 8, '2022-11-29', 'member08');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '迹吩 ???扁', '弊?? 官唱唱 ?快厚 快府? ??俺 喊? ?快喊 家? 器? 崔撥 喊蝴 ???? 魂甸覆 魂甸覆 ??俺 ?柯秦 ?敲 魂甸覆 救崇 ?柯秦 ???? 疵前 ????促 ?? 家? 快府? 酒??府 魂甸覆 唱? 崔撥 肺款 喊蝴 酒?扼 ?柯秦 ?福? 固府? 官唱唱 ?快厚 唱厚? 酒??府 肺款 ?柯秦 固府? 弊?? 喊? 固悔促 救崇 崔撥 ?腔磐 固悔促.

抗弊府唱 促? 酒?扼 酒? 抗弊府唱 固府? 固悔促 ?? 器? ?腔磐 魂甸覆 ?苞 ?快喊 氓? ?腔磐 快府? 促? 官恩采 家?家? 酒?扼 官唱唱 魂甸覆 固府? 酒?扼 快府? ?福? ?敲 ??俺 ???? ?敲 快府? 厚唱府 ?快厚 唱厚? ??俺 ?柯穿府 疵前 ?柯秦 救崇 氓? 家?家? 疵前 ?? ?柯穿府 ??合 ??包 唱厚? 固府? 抗弊府唱 酒?扼.

??俺 ?敲 ?柯秦 魂甸覆 官恩采 固悔促 抗弊府唱 ?福? ????促 ?苞 喊? 磅促? 酒? 唱? 器? ?快喊 ??俺 ?快喊 家?家? 慷?? 肺款 ?腔磐 氓? ?快厚 弊?? 家?家? 促? ?快厚 氓? 厚唱府 酒?扼 ????促 ??合 酒?扼 唱厚? 酒? ?敲 ??合 弊?? 酒??府 ??包 喊? 酒??府 ?苞 崔撥 ??俺 快府? ?敲 肺款 ??.

器? 酒??府 ???? ?柯秦 官恩采 疵前 喊? 唱? 唱厚? ???? 唱厚? ?腔磐 ????促 固府? 快府? ?快厚 快府? ?快厚 ??俺 抗弊府唱 酒府酒 家? 喊蝴 ??合 ????促 ????促 厚唱府 喊蝴 ?敲 ??俺 固府? ????促 肺款 厚唱府 家? 氓? 固悔促 唱? 固悔促 酒? 喊蝴 肺款 肺款 肺款 固悔促 唱? ?快喊 魂甸覆 喊? ?苞.', 9, '2023-01-12', 'member09');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '??? ???扁', '?苞 ?? ?? 喊蝴 抗弊府唱 酒? 酒??府 固府? 肺款 ???? 厚唱府 ?柯穿府 酒?扼 氓? 抗弊府唱 ????促 厚唱府 氓? 抗弊府唱 固悔促 ??合 崔撥 ??俺 ?腔磐 酒? 崔撥 魂甸覆 ????促 抗弊府唱 抗弊府唱 ?福? 抗弊府唱 ?快厚 酒? 喊蝴 酒??府 固悔促 厚唱府 ??俺 固悔促 快府? ??俺 家?家? ????促 ?苞 ?快厚 唱厚? 喊? 酒? 唱厚?.

喊? 促? 氓? 唱厚? ????促 ?快厚 魂甸覆 酒??府 促? 促? 官恩采 ?? 家?家? 喊? ????促 疵前 快府? 快府? 固悔促 ?苞 ?柯秦 喊? 肺款 ?腔磐 弊?? 厚唱府 ????促 ????促 酒? ??合 ??包 ???? ?福? 促? 氓? 魂甸覆 疵前 酒府酒 固悔促 ?快喊 固悔促 慷?? 救崇 抗弊府唱 ??俺 氓? 固悔促 官恩采 ?? ??包.

救崇 抗弊府唱 酒? 抗弊府唱 喊蝴 快府? 促? 抗弊府唱 ?? 崔撥 ?? 崔撥 ?? ??包 肺款 ?敲 喊? 促? 固府? 氓? ?快厚 家? 崔撥 官恩采 魂甸覆 ?柯秦 疵前 ???? 唱厚? 弊?? 疵前 磅促? ?福? 抗弊府唱 厚唱府 唱厚? 疵前 ?快喊 器? 救崇 家? 喊蝴 ????促 厚唱府 ?福? ?敲 固悔促 ??合 固府? 家?.

魂甸覆 家? 酒? 魂甸覆 促? 崔撥 救崇 酒? 喊? 官恩采 ???? ??俺 魂甸覆 磅促? 快府? ????促 促? ?快厚 固悔促 ????促 ????促 唱厚? 家? 固府? ????促 ?快喊 酒府酒 ??俺 ???? 器? 酒??府 氓? 家?家? ?敲 ??合 肺款 ?快厚 ?柯秦 磅促? ????促 ?苞 弊?? ?快厚 抗弊府唱 ?快喊 官恩采 酒??府 ?苞 磅促? ?快厚.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?肺 ???扁', '?苞 ?? ?? 喊蝴 抗弊府唱 酒? 酒??府 固府? 肺款 ???? 厚唱府 ?柯穿府 酒?扼 氓? 抗弊府唱 ????促 厚唱府 氓? 抗弊府唱 固悔促 ??合 崔撥 ??俺 ?腔磐 酒? 崔撥 魂甸覆 ????促 抗弊府唱 抗弊府唱 ?福? 抗弊府唱 ?快厚 酒? 喊蝴 酒??府 固悔促 厚唱府 ??俺 固悔促 快府? ??俺 家?家? ????促 ?苞 ?快厚 唱厚? 喊? 酒? 唱厚?.

喊? 促? 氓? 唱厚? ????促 ?快厚 魂甸覆 酒??府 促? 促? 官恩采 ?? 家?家? 喊? ????促 疵前 快府? 快府? 固悔促 ?苞 ?柯秦 喊? 肺款 ?腔磐 弊?? 厚唱府 ????促 ????促 酒? ??合 ??包 ???? ?福? 促? 氓? 魂甸覆 疵前 酒府酒 固悔促 ?快喊 固悔促 慷?? 救崇 抗弊府唱 ??俺 氓? 固悔促 官恩采 ?? ??包.

救崇 抗弊府唱 酒? 抗弊府唱 喊蝴 快府? 促? 抗弊府唱 ?? 崔撥 ?? 崔撥 ?? ??包 肺款 ?敲 喊? 促? 固府? 氓? ?快厚 家? 崔撥 官恩采 魂甸覆 ?柯秦 疵前 ???? 唱厚? 弊?? 疵前 磅促? ?福? 抗弊府唱 厚唱府 唱厚? 疵前 ?快喊 器? 救崇 家? 喊蝴 ????促 厚唱府 ?福? ?敲 固悔促 ??合 固府? 家?.

魂甸覆 家? 酒? 魂甸覆 促? 崔撥 救崇 酒? 喊? 官恩采 ???? ??俺 魂甸覆 磅促? 快府? ????促 促? ?快厚 固悔促 ????促 ????促 唱厚? 家? 固府? ????促 ?快喊 酒府酒 ??俺 ???? 器? 酒??府 氓? 家?家? ?敲 ??合 肺款 ?快厚 ?柯秦 磅促? ????促 ?苞 弊?? ?快厚 抗弊府唱 ?快喊 官恩采 酒??府 ?苞 磅促? ?快厚.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '官官 ???扁', '?苞 ?? ?? 喊蝴 抗弊府唱 酒? 酒??府 固府? 肺款 ???? 厚唱府 ?柯穿府 酒?扼 氓? 抗弊府唱 ????促 厚唱府 氓? 抗弊府唱 固悔促 ??合 崔撥 ??俺 ?腔磐 酒? 崔撥 魂甸覆 ????促 抗弊府唱 抗弊府唱 ?福? 抗弊府唱 ?快厚 酒? 喊蝴 酒??府 固悔促 厚唱府 ??俺 固悔促 快府? ??俺 家?家? ????促 ?苞 ?快厚 唱厚? 喊? 酒? 唱厚?.

喊? 促? 氓? 唱厚? ????促 ?快厚 魂甸覆 酒??府 促? 促? 官恩采 ?? 家?家? 喊? ????促 疵前 快府? 快府? 固悔促 ?苞 ?柯秦 喊? 肺款 ?腔磐 弊?? 厚唱府 ????促 ????促 酒? ??合 ??包 ???? ?福? 促? 氓? 魂甸覆 疵前 酒府酒 固悔促 ?快喊 固悔促 慷?? 救崇 抗弊府唱 ??俺 氓? 固悔促 官恩采 ?? ??包.

救崇 抗弊府唱 酒? 抗弊府唱 喊蝴 快府? 促? 抗弊府唱 ?? 崔撥 ?? 崔撥 ?? ??包 肺款 ?敲 喊? 促? 固府? 氓? ?快厚 家? 崔撥 官恩采 魂甸覆 ?柯秦 疵前 ???? 唱厚? 弊?? 疵前 磅促? ?福? 抗弊府唱 厚唱府 唱厚? 疵前 ?快喊 器? 救崇 家? 喊蝴 ????促 厚唱府 ?福? ?敲 固悔促 ??合 固府? 家?.

魂甸覆 家? 酒? 魂甸覆 促? 崔撥 救崇 酒? 喊? 官恩采 ???? ??俺 魂甸覆 磅促? 快府? ????促 促? ?快厚 固悔促 ????促 ????促 唱厚? 家? 固府? ????促 ?快喊 酒府酒 ??俺 ???? 器? 酒??府 氓? 家?家? ?敲 ??合 肺款 ?快厚 ?柯秦 磅促? ????促 ?苞 弊?? ?快厚 抗弊府唱 ?快喊 官恩采 酒??府 ?苞 磅促? ?快厚.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '努肺? ???扁', '?苞 ?? ?? 喊蝴 抗弊府唱 酒? 酒??府 固府? 肺款 ???? 厚唱府 ?柯穿府 酒?扼 氓? 抗弊府唱 ????促 厚唱府 氓? 抗弊府唱 固悔促 ??合 崔撥 ??俺 ?腔磐 酒? 崔撥 魂甸覆 ????促 抗弊府唱 抗弊府唱 ?福? 抗弊府唱 ?快厚 酒? 喊蝴 酒??府 固悔促 厚唱府 ??俺 固悔促 快府? ??俺 家?家? ????促 ?苞 ?快厚 唱厚? 喊? 酒? 唱厚?.

喊? 促? 氓? 唱厚? ????促 ?快厚 魂甸覆 酒??府 促? 促? 官恩采 ?? 家?家? 喊? ????促 疵前 快府? 快府? 固悔促 ?苞 ?柯秦 喊? 肺款 ?腔磐 弊?? 厚唱府 ????促 ????促 酒? ??合 ??包 ???? ?福? 促? 氓? 魂甸覆 疵前 酒府酒 固悔促 ?快喊 固悔促 慷?? 救崇 抗弊府唱 ??俺 氓? 固悔促 官恩采 ?? ??包.

救崇 抗弊府唱 酒? 抗弊府唱 喊蝴 快府? 促? 抗弊府唱 ?? 崔撥 ?? 崔撥 ?? ??包 肺款 ?敲 喊? 促? 固府? 氓? ?快厚 家? 崔撥 官恩采 魂甸覆 ?柯秦 疵前 ???? 唱厚? 弊?? 疵前 磅促? ?福? 抗弊府唱 厚唱府 唱厚? 疵前 ?快喊 器? 救崇 家? 喊蝴 ????促 厚唱府 ?福? ?敲 固悔促 ??合 固府? 家?.

魂甸覆 家? 酒? 魂甸覆 促? 崔撥 救崇 酒? 喊? 官恩采 ???? ??俺 魂甸覆 磅促? 快府? ????促 促? ?快厚 固悔促 ????促 ????促 唱厚? 家? 固府? ????促 ?快喊 酒府酒 ??俺 ???? 器? 酒??府 氓? 家?家? ?敲 ??合 肺款 ?快厚 ?柯秦 磅促? ????促 ?苞 弊?? ?快厚 抗弊府唱 ?快喊 官恩采 酒??府 ?苞 磅促? ?快厚.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '喉扼 ???扁', '?苞 ?? ?? 喊蝴 抗弊府唱 酒? 酒??府 固府? 肺款 ???? 厚唱府 ?柯穿府 酒?扼 氓? 抗弊府唱 ????促 厚唱府 氓? 抗弊府唱 固悔促 ??合 崔撥 ??俺 ?腔磐 酒? 崔撥 魂甸覆 ????促 抗弊府唱 抗弊府唱 ?福? 抗弊府唱 ?快厚 酒? 喊蝴 酒??府 固悔促 厚唱府 ??俺 固悔促 快府? ??俺 家?家? ????促 ?苞 ?快厚 唱厚? 喊? 酒? 唱厚?.

喊? 促? 氓? 唱厚? ????促 ?快厚 魂甸覆 酒??府 促? 促? 官恩采 ?? 家?家? 喊? ????促 疵前 快府? 快府? 固悔促 ?苞 ?柯秦 喊? 肺款 ?腔磐 弊?? 厚唱府 ????促 ????促 酒? ??合 ??包 ???? ?福? 促? 氓? 魂甸覆 疵前 酒府酒 固悔促 ?快喊 固悔促 慷?? 救崇 抗弊府唱 ??俺 氓? 固悔促 官恩采 ?? ??包.

救崇 抗弊府唱 酒? 抗弊府唱 喊蝴 快府? 促? 抗弊府唱 ?? 崔撥 ?? 崔撥 ?? ??包 肺款 ?敲 喊? 促? 固府? 氓? ?快厚 家? 崔撥 官恩采 魂甸覆 ?柯秦 疵前 ???? 唱厚? 弊?? 疵前 磅促? ?福? 抗弊府唱 厚唱府 唱厚? 疵前 ?快喊 器? 救崇 家? 喊蝴 ????促 厚唱府 ?福? ?敲 固悔促 ??合 固府? 家?.

魂甸覆 家? 酒? 魂甸覆 促? 崔撥 救崇 酒? 喊? 官恩采 ???? ??俺 魂甸覆 磅促? 快府? ????促 促? ?快厚 固悔促 ????促 ????促 唱厚? 家? 固府? ????促 ?快喊 酒府酒 ??俺 ???? 器? 酒??府 氓? 家?家? ?敲 ??合 肺款 ?快厚 ?柯秦 磅促? ????促 ?苞 弊?? ?快厚 抗弊府唱 ?快喊 官恩采 酒??府 ?苞 磅促? ?快厚.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '俊唱? ???扁', '?苞 ?? ?? 喊蝴 抗弊府唱 酒? 酒??府 固府? 肺款 ???? 厚唱府 ?柯穿府 酒?扼 氓? 抗弊府唱 ????促 厚唱府 氓? 抗弊府唱 固悔促 ??合 崔撥 ??俺 ?腔磐 酒? 崔撥 魂甸覆 ????促 抗弊府唱 抗弊府唱 ?福? 抗弊府唱 ?快厚 酒? 喊蝴 酒??府 固悔促 厚唱府 ??俺 固悔促 快府? ??俺 家?家? ????促 ?苞 ?快厚 唱厚? 喊? 酒? 唱厚?.

喊? 促? 氓? 唱厚? ????促 ?快厚 魂甸覆 酒??府 促? 促? 官恩采 ?? 家?家? 喊? ????促 疵前 快府? 快府? 固悔促 ?苞 ?柯秦 喊? 肺款 ?腔磐 弊?? 厚唱府 ????促 ????促 酒? ??合 ??包 ???? ?福? 促? 氓? 魂甸覆 疵前 酒府酒 固悔促 ?快喊 固悔促 慷?? 救崇 抗弊府唱 ??俺 氓? 固悔促 官恩采 ?? ??包.

救崇 抗弊府唱 酒? 抗弊府唱 喊蝴 快府? 促? 抗弊府唱 ?? 崔撥 ?? 崔撥 ?? ??包 肺款 ?敲 喊? 促? 固府? 氓? ?快厚 家? 崔撥 官恩采 魂甸覆 ?柯秦 疵前 ???? 唱厚? 弊?? 疵前 磅促? ?福? 抗弊府唱 厚唱府 唱厚? 疵前 ?快喊 器? 救崇 家? 喊蝴 ????促 厚唱府 ?福? ?敲 固悔促 ??合 固府? 家?.

魂甸覆 家? 酒? 魂甸覆 促? 崔撥 救崇 酒? 喊? 官恩采 ???? ??俺 魂甸覆 磅促? 快府? ????促 促? ?快厚 固悔促 ????促 ????促 唱厚? 家? 固府? ????促 ?快喊 酒府酒 ??俺 ???? 器? 酒??府 氓? 家?家? ?敲 ??合 肺款 ?快厚 ?柯秦 磅促? ????促 ?苞 弊?? ?快厚 抗弊府唱 ?快喊 官恩采 酒??府 ?苞 磅促? ?快厚.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?? ???扁', '?苞 ?? ?? 喊蝴 抗弊府唱 酒? 酒??府 固府? 肺款 ???? 厚唱府 ?柯穿府 酒?扼 氓? 抗弊府唱 ????促 厚唱府 氓? 抗弊府唱 固悔促 ??合 崔撥 ??俺 ?腔磐 酒? 崔撥 魂甸覆 ????促 抗弊府唱 抗弊府唱 ?福? 抗弊府唱 ?快厚 酒? 喊蝴 酒??府 固悔促 厚唱府 ??俺 固悔促 快府? ??俺 家?家? ????促 ?苞 ?快厚 唱厚? 喊? 酒? 唱厚?.

喊? 促? 氓? 唱厚? ????促 ?快厚 魂甸覆 酒??府 促? 促? 官恩采 ?? 家?家? 喊? ????促 疵前 快府? 快府? 固悔促 ?苞 ?柯秦 喊? 肺款 ?腔磐 弊?? 厚唱府 ????促 ????促 酒? ??合 ??包 ???? ?福? 促? 氓? 魂甸覆 疵前 酒府酒 固悔促 ?快喊 固悔促 慷?? 救崇 抗弊府唱 ??俺 氓? 固悔促 官恩采 ?? ??包.

救崇 抗弊府唱 酒? 抗弊府唱 喊蝴 快府? 促? 抗弊府唱 ?? 崔撥 ?? 崔撥 ?? ??包 肺款 ?敲 喊? 促? 固府? 氓? ?快厚 家? 崔撥 官恩采 魂甸覆 ?柯秦 疵前 ???? 唱厚? 弊?? 疵前 磅促? ?福? 抗弊府唱 厚唱府 唱厚? 疵前 ?快喊 器? 救崇 家? 喊蝴 ????促 厚唱府 ?福? ?敲 固悔促 ??合 固府? 家?.

魂甸覆 家? 酒? 魂甸覆 促? 崔撥 救崇 酒? 喊? 官恩采 ???? ??俺 魂甸覆 磅促? 快府? ????促 促? ?快厚 固悔促 ????促 ????促 唱厚? 家? 固府? ????促 ?快喊 酒府酒 ??俺 ???? 器? 酒??府 氓? 家?家? ?敲 ??合 肺款 ?快厚 ?柯秦 磅促? ????促 ?苞 弊?? ?快厚 抗弊府唱 ?快喊 官恩采 酒??府 ?苞 磅促? ?快厚.', 10, '2023-04-23', 'member10');

insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Apt 1628', '2023-11-22', 1, 'member01');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Room 1329', '2023-10-23', 2, 'member02');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, '13th Floor', '2022-10-28', 3, 'member03');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 2037', '2024-01-27', 4, 'member04');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Room 1779', '2023-03-20', 5, 'member05');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 18663', '2022-02-21', 6, 'member06');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Suite 82', '2023-12-02', 7, 'member07');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, '8th Floor', '2023-01-16', 8, 'member08');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 80950', '2023-09-27', 9, 'member09');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 29822', '2022-05-31', 10, 'member10');

--?奠?????

CREATE TABLE noticeBoard (
	nboard_id	number		NOT NULL,
	nboard_title	varchar2(80)		NOT NULL,
	nboard_content	varchar2(2000)		NOT NULL,
	nboard_date	date	DEFAULT sysdate	NOT NULL,
	nboard_cnt	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);

create sequence noticeBoard_seq
start with 1
increment by 1
nocycle
nocache;

insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '? ?扁斑??季磐 ???? ?扁斑盒?季磐 ?? ?', '救崇?技? ?扁斑??季磐??促.^^

???措 ???? ?扁悼拱 烹?匙??? ??袍狼,
?扁斑??季磐 ???? ??登菌嚼?促.

?扁斑??季磐狼 俺汲? ???? ?扁悼拱 茫扁甫 ??烹??肺,
?促 ??狐福? 犬牢?角 ? ???? 巴? 格利?哥,
?扁斑父? 酒?扼 ?扁功 棺 阿? ?扁悼拱俊 措茄 ?? ??磐?
犬牢?角 ? ?? 力傍???嚼?促.

?茄 救?? 棺 犁?扁 ?瘤甫 困茄 ?扁悼拱 盒? 棺 盒?罐扁 目孤?萍 ?呈? 俺汲登???? 腹? ???寂?,
???? ?妨悼拱俊? ?利狼 券版? 力傍秦林?辨 官而?促.

腹? ?? 何??府?嚼?促. ????促. ^^', '2013-01-31', 4248, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '	救???瘤! ?扁悼拱? ?斑?????~≠', '?? ??肺 ?扁斑,?扁功,?扁悼拱? ???? ??角 版快,
溜? "?扁悼拱 ??吝??促" ?呈俊 ?妨林?扁 官而?促.

弊府? 寸厘 ??且 ??? 救登角 版快,
秦寸 角?瘤?狼 ?扁悼拱??家俊 楷??? ?扁?? 登瘤父,
( http://www.zooseyo.or.kr/Yu_board/safecenter.html )

?扁悼拱??家俊 ?扁角 版快 1林~2林悼救 林牢? 茫酒?瘤 臼?? 救??甫 ?虐? 版快? 措何盒?骨肺,
?凡 版快 家吝茄 ??? 困秦急 ?扼府 酒?狼 公?盒??春甫 ???? 公?盒?? 秦林?? 巴? ? 炒嚼?促.

? 版快 盒???配府? 巢扁??俊 唱吝俊 林牢? ?? 版肺甫 烹秦 茫酒? ?? ??哥, 混酒?? 惑?肺 父巢? ?逢 ? ??? ??家俊 ?扁?巴?促 公?盒?? ??林?辨 寸何???促.

( http://www.zooseyo.or.kr/Yu_board/freesale.html?ty=1 )
', '2013-02-13', 6969, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '??季磐 葛官老 昆? ??登菌嚼?促~*', '	
"?扁斑??季磐 ?????扁斑盒?季磐"狼 祈府茄 ??? 困秦

?? 葛官老 昆? ???看嚼?促.

葛官老肺 立加? 官肺 葛官老券版?肺 立加?登哥,

Pc?扁 ?券? 烹秦 Pc???肺? ?角 ? ?嚼?促.

菊?肺? ?扁悼拱 ?瘤甫 困秦 ?急? 促秦 ???? 季磐? 登?? ??嚼?促.^^

腹? ??苞 ?膊, 林困俊? 澄府澄府 舅妨林?扁 官而?促~*', '2013-06-29', 8922, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '	[傍?]???扁斑??季磐 聚? 免?登菌嚼?促.', '	
? 腹? ??磊盒甸? 埃祈? 茫酒?? ?扁斑??? 曼??角 ? ??,
[傍?]???扁斑??季磐 救?肺?? 聚? 免??看嚼?促.

?犁 ?扁???肺? 酒流 ?厚登瘤 臼?巴? 腹??,
角?悼拱狼 殿? 棺 悼拱??包府??袍狼 ?扁悼拱茫扁, ??瘤?赴? 殿苞 包?茄救?利牢 ??? 扁粮苞 鞍? "???扁斑??季磐 Pc昆???"甫 ??秦林?扁 官而?促.

?茄 聚促款肺? 其?瘤俊 立加???,
聚扁瓷? 何???扼? 腹? 舅副 ? ???, 怖 亮? ?扁 何????促.

?扁悼拱俊 措茄 包? 棺 腹? ??苞 己?, ?惑 ?????促~*', '2013-12-24', 5582, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '???扁斑??季磐 惑??狼 包? 傍瘤', '	

救崇?技?, ???措 ???扁斑??季磐 ??促.

粱 ? 唱? 惑?? 困秦 惑??狼? ??? ???狼 惑??狼甫

烹秦 惑??角 ? ?嚼?促.

???扁斑??季磐? ?? ?扁斑 棺 ??季磐 烹???甫 力傍??

柯扼牢 ?? 季磐?骨肺 ??俊 曼?秦林?扁 官而?促.

????促~*', '2014-03-03', 2730, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '	磊?豪? ???? ?呈? 俺汲登菌嚼?促~?', '救崇?技? ???扁斑??季磐 ??促.

???扁斑??季磐? 堡?困茄 ?? 匙????? 烹秦
?努腐?肺 角?等 酒?甸? 狐福? 茫酒?府? ?厚?甫
柳??? ?嚼?促.
弊繁 搬苞肺, ?老鞍? 腹? 盒甸? 茫疽促? 臂? ?妨林?哥
?拜秦??? 葛嚼? ?? ?富肺 腹? ?恩? 蠢?翠?促~

?犁 Pc昆 俊?父 ?厚?? ?瓷??, 葛官老? ?肺款 府春?苞 ?膊 ?呈? 俺汲 ? 巴???, 磊?豪? ???? ?呈俊 腹? 包? 何????促~*

??俊 ?扁斑? ?扼瘤? 弊朝?瘤,
???扁斑??季磐? ?惑 ?膊??嚼?促. ????促!', '2017-08-08', 8976, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '???扁斑盒?季磐狼 ? 葛官老昆 ?敲? 免?登菌嚼?促.', '葛官老狼 ??祈狼 碍拳甫 困?? ?肺款 葛官老昆 ?敲? 免?登菌嚼?促.

葛官老昆?肺 立加? 官肺 葛官老 券版?肺 立加? 登哥,

?敲 ??? ?臂?配?狼 救?肺?? 棺 IOS 聚?配?俊?

"???扁斑??季磐 V2"肺 八???? 促款肺? ?角 ? ?嚼?促.

? ??俊?? 磊?豪? 脚? 棺 吝家 ?扁斑??季磐狼 ???? 棺 ??? ?瓷?哥, 悼拱??包府??袍苞狼 楷悼?肺 阿 瘤? ?扁斑??季磐俊 ?家等 ?扁斑甸? 老格?楷?? 八? ?莫?角 ? ?嚼?促.

菊?肺? ?扁悼拱 ?瘤甫 困秦 ?急? 促秦 ???? 季磐? 登?? ??嚼?促.^^

腹? ??苞 ?膊, 林困俊? 澄府澄府 舅妨林?扁 官而?促~*', '2018-10-06', 933, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '?扁悼拱甸? 困茄 "???? 付南"俊 曼?秦林技?~', '悼拱? ???? 蝶舵茄 付?? ?膊 唱穿? 官磊雀 ‘???? 付南’? 悼拱???刮?眉 墨扼狼 ???? 季磐俊? ???促!

 

?妨瘤扁? ??, ??甸狼 何林狼肺 酪??府扁? ??ˇ

 

?? ??俊?牢瘤 隔扼? 芭府俊? 混酒?? ??悼拱甸? 烹判? 快府? 如? ‘?扁悼拱’?扼? ??促. ?繁 ?扁悼拱甸? 悼拱甸? 背烹??, ?恩甸狼 切措, ??, 困?茄 ?汲拱俊狼 ?? 殿殿狼 困? 加俊? ????甫 混酒癌?促. ???悼? 救?利?瘤 ??? 厚困?利牢 券版俊? 儡多 ?厘茄 盲 混酒?促?? ?碍? 亮? 府? ?嚼?促. 摹?甫 罐?促? 肯摹? ? ?? ?涵款 ???唱 惑?? 塞? 芭府??? ?? 悼拱甸俊?? 格?? 困??? 摹?利牢 刀? ? ? ?嚼?促.


 

悼拱???刮?眉 墨扼? 酒? ?扁悼拱甸? 困茄 扁陛 付?俊 塞? ???磊 ‘???? 付南’? ?嚼?促.

"???? 付南"? ??盒? 扁何秦林脚 拱前甸肺 厘磐甫 盲快?,

弊 拱前甸? 魄?秦 ??茄 ??陛? ?扁悼拱甸? 摹??? 到? ?俊 ????促.

仟?茄 厘磐? 登扁 困秦 亮?(?恩?, ?妨悼拱?)甸? ??林技?~', '2022-12-13', 1871, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '"酒?前"俊? ???烙?肺 老秦林角 盒? 葛??促.', '墨扼 ????季磐俊? ???烙?肺 老秦林角 盒? 葛??促.
 
立?扁埃 : 2015斥 4? 14老 (拳) ~ 2015斥 4? 21老 (拳)
 
?公?老 : ?林 ?, 拳, 格, 陛 (林 4老)
?公?埃 : ?? 1?何磐 ?? 7??瘤 (6?埃)
?公?? : 季磐 ? 悼拱 包府 棺 ?家
?公厘家 : 墨扼 ???? 季磐(?匡 付器? 儡促府肺 122?瘤)
?鞭 : 6,000?', '2023-12-18', 5264, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '6? 豪? 老? 楷扁 救?', '吝悼??扁??焙(?福? ?肺唱官???, MERS-CoV) 犬魂 ?瘤甫 困秦
葛? ?刮? ??? 扁匡?? ?嚼?促.

?客 鞍? 惑?? ?妨秦 墨扼豪?措狼 6? 豪? 老?? 楷扁??促.

惑?? 救?? 等促? 7?俊 2雀 豪?甫 且 抗???促.
狐弗 ?埃 ?俊 救?登? ?恩? 悼拱? 祈救茄 老惑? 穿府? 登扁甫 官而?促.', '2015-06-15', 6883, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '?汗?甫 捌?秦 林?? 盒甸膊 ?府? 富靖', '己巢?俊 ??登? 混酒?? ?? "?汗?"甫 酒?唱??
?? 墨扼俊? ?汗?? 混? 腹? 狐廉 捌?秦 林?? 盒甸狼 ?拳? 腹? ?妨可?促.

墨扼? 混? 腹? 狐柳 ?汗?狼 葛嚼? ?斑?? 己巢?客 措拳甫 沁???,
?汗?? 距 3俺?埃 ?雀拳背?? 罐??? 脚眉?悼? ??? ??, 舅?瘤 ???? ?? 苞?俊? 混? 狐?瘤父 ?碍狼 ?惑? 酒?扼? ??促.

?? ??狼 悼拱??俊? ?崔 ?碍八柳? 罐? ?扁俊 ?付 ?俊? ??? 促赤???
酒? ?促 磊技? 富靖?府?瘤父 酒林 ?碍?促? ??促.

?汗?甫 捌?秦 林?? 盒甸苞 ?促 磊技茄 惑?? 傍???, ?汗?狼 ?汗? 困秦 何??府? 酵? 巴? ?? ? 臂? ???促.
', '2015-08-25', 19843, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '家吝茄 版? 唱串?肺 悼拱??甫 角?秦 林技?!', '茄 秦 ?恩甸肺何磐 ?妨瘤? ?? ?何 ?拌 ?扁悼拱 ?? 2014斥 扁霖 茄 秦 8父1?147付府肺 角力 ?扁等 悼拱? ? 腹? 巴?肺 眠???促.

第蝶福? 氓烙俊 措茄 ?刮 ?? ?何肺 悼拱? ??, ?固? ??瘤芭唱 屈祈? ?妨?瘤? ?? 悼拱? ?府? ?角? 呈公 救??款??,

?妨悼拱殿?力? 狼?利牢 悼拱 ?扁甫 固楷俊 ?瘤?? 家?林狼 氓烙狼?? 碍拳?? 茄祈, ?狼狼 ??肺 ?妨牢? 悼拱苞 ??瘤? 登?扼? 家?林 犬牢? 烹秦 悼拱? 促? ??狼 前?肺 倒妨?? ? ??? ??磊 ??登菌嚼?促.

?扁悼拱 ??家狼 悼拱甸? 林牢? ? 茫?? 措何盒 ??俊 ?福? 登?, "俺 ??"?扼? ?粮?? 困?? ?? 惑?俊? ?妨悼拱殿?力? ??俊 ??府? ?? 阿? 困??肺何磐 唱狼 ?妨悼拱? 瘤虐扁 困茄 ?家茄狼 救?厘摹牢 巴??促.

 

?妨悼拱殿?力? ??俊 2013斥 1?1老何磐 ??登菌?哥 2014斥 1?1老何磐? 俺甫 措惑?肺 狼公?? 登? ?? 殿? 措惑? 菊?肺 ???俊?肺 犬措? ????促. 2014斥 ?何狼 傍? 烹拌惑 俺狼 ?妨悼拱 殿?伏? 距 55.1%牢??, 公盒喊茄 ???苞 魄? 殿 烹拌俊 ??瘤 臼? 殿?措惑? ?? ?角? ?救?? 角力 殿?伏? 弊?促 任? 撤? 巴?肺 ???促.

  

', '2015-12-03', 5750, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '2016 墨扼 ??-?悼? ??? 促赤?嚼?促', '墨扼? 悼拱??客 悼拱鼻, 汗瘤, ??粮吝 殿? ?膊 ?刮?? ?悼?客 ??,
弊府? 弊繁 ?悼? 瘤瘤秦林? 雀?甸? ?膊 父甸??? ?眉??促.
?斥?? 悼拱???刮?眉 墨扼? ?悼茄瘤? 15林斥? 登???.
 
悼拱???刮?眉 墨扼狼 ?其?瘤, 喉肺弊俊 茫酒客林?芭唱,
趣? 其??合?唱 ?困磐 鞍? SNS俊? ?? 墨扼甫 立?? 盒甸膊??
墨扼狼 ?繁 ?繁 家?? ????? 墨扼 ?悼?甸? ?陛??瘤 臼??唱?? :)

瘤抄 6? 11老~6? 12老 1冠 2老肺 墨扼 ?悼?客 ??甸? ?膊?? ???? 柳??看嚼?促.
?? ???俊? ?公?何磐 悼拱??, 酒?前?其?瘤 墨扼 ????季磐狼 阿 摸? ?寸?? ?悼?甸苞
阿 盒具俊? 官悔? ?悼 吝?脚 ???甸膊?? ?埃? ?? 曼?秦林?嚼?促.

墨扼狼 救破俊? ??? ?刮?哥 ?悼?? ?恩甸狼 ?具扁甫 佃?
菊?肺狼 悼拱??甫 困茄 墨扼狼 吝厘扁 厚?? 葛?秦??,
弊府? ?悼?客 ??? 家加?? 蠢?? 楷措甫 父甸? 埃
2016 墨扼 ??-?悼? ???狼 ?厘? 茄 ? 混旗??? 且??? 
', '2016-06-16', 2770, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '墨扼 款康困??肺 曼??角 措狼??? 葛??促', '墨扼 ?包俊? 技 ?瘤 吝?茄 雀狼? ?嚼?促. ?雀, ??雀, 款康困?雀??促. 款康困?雀? ?? 1雀 葛? ?? ?悼? ??罐?, ??狼 吝?茄 ?救? 八配?? 牢霖??促.

?犁 款康困?雀? 款康困?厘?肺 措?? ??, 惑烙?? 2牢(?柳版, ??鄂), 厚惑烙?? 2牢(??局, ???), ?公?厘(???), 措狼? 3牢(碍康?, 脚固酒, ??厚) 殿 ? 9???促. ?包俊 蝶福? 款康困?雀? 15牢 ?寇肺 ?己?? 登? ?嚼?促. 面? ??? ?? ?秦 款康困?雀? 措狼? 款康困?? ?陛 ? 疵妨 雀??甸狼 狼斑? ?促 腹? ?康登?? 犬措?扁肺 ?看嚼?促.

措狼??甸狼 腹? 包?苞 曼? 何????促.', '2017-07-12', 2426, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '5? 13老(配), ???柳? 迷康秦林角 盒? 扁促??促!', '?? 5? 13老(配) ?府? "Thanks Family Day ??? 登??? ?付?"狼 ???柳? 迷康秦林角 盒? 茫嚼?促.



2017 Thanks Familiy Day ?? 俺? ???扁



墨扼狼 ????甸? 茄? 葛?? ? ??狼 ??茄 扁?苞 ?汗茄 ?妨悼拱, ????狼 葛嚼? ?柳俊 ?酒林?? ??促.

犁瓷扁何 曼? ??? 促?苞 鞍嚼?促.

    *?牢 厘厚肺 ?柳迷康? ?瓷?脚 盒

    *迷康茄 ?柳 ?樊狼 ??? 5? 16老(拳) ?? 9??瘤 ?老肺 ?价?瓷茄 盒

    *?? 寸老(13老) ??厘 ?厘(版扁? 己巢? 盒寸? ??俺肺 242 "促刀促刀")?肺 流立 ?角 ? ?? 盒

    *?? 寸老 ?? 10:30~?? 2:00 悼救 ?柳 迷康? 秦林角 ? ?? 盒

    *?朝 迷康茄 葛? ?柳狼 ?累鼻? 墨扼俊 ??? 悼狼??? 盒



?朝 ?柳迷康俊 ??林角 盒? [??, 楷??(?措?拳), 迷康厘厚 扁?, ?牢狼 ?柳? 杭 ? ?? SNS 林家(SNS? ?? 版快俊? 流立 迷康茄 ?柳 梅何)]甫 5? 7老(老)?瘤 ?老(info@ekara.org)肺 ??林技?.

?老力格? ??? [?柳迷康- OOO(?牢 ??)]?肺 利?林寂具 ??促!



? 2? ?惑狼 ?柳迷康 犁瓷扁何磊盒? 葛角 抗??哥, 曼? ?何? 俺喊楷? ?府?嚼?促.



?? ?柳? ??具 ??瘤 肋 葛福角 巴 鞍酒 瘤抄 3斥 悼救狼 ?? ?柳甸 吝 老何甫 酒?俊 梅何??促.

曼?秦林技?~', '2017-04-26', 2871, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '??累??肺 牢茄 ?其?瘤 ?? 救? (2018.03.23~25)', '墨扼 ?其?瘤 ?? 累??肺 酒? 扁埃悼救 ?其?瘤 立加 棺 ??? ?救?且 ? ?嚼?促.



?累?老? : 2018.03.23 23? ~ 2018.03.25 24?



??俊 ?祈 ?府? 痢 ?秦 何????促', '2018-03-20', 1493, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '?其?瘤 俺祈苞 ?林季磐 其?瘤 ??? 舅妨???促.', '墨扼 ?其?瘤? 7? 茄崔悼救 俺祈 累?? ????嚼?促. ?促 腹? 墨扼 ?悼狼 ?脚 家?? ?牢俊? 犬牢且 ? ?嚼?促. 措何葛 搬楷? 1:1搬楷?肺 ?莫 函版登菌嚼?促. 敲肺? ?春俊? 磊林 茫??? ?春牢 ?? / ?? / 1:1搬楷 / ??瘤?俊 ?? 立?且 ? ?嚼?促.


??? ?? ?肺璃? ?? 其?瘤甫 ????促.
?林季磐 ??? 霖厚?? ?具扁客 ?林季磐 肯傍 ?鼓??? ?柳? 力傍?? 笛??扁, ?? 救?客 ?? ??, 家? 殿? 力傍??促. 

', '2018-08-08', 2289, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '力肺捧? ?肺璃? - 寒倒 祈, 10父厘狼 函拳', '悼拱? 困茄 ?悼, ??利牢 函拳? ????促. 
2002斥 惑??悼? 1牢俊? ?累秦? 悼拱??, ???老 悼拱????包, ?? ?? ???其 酒?前? 款康?扁?瘤 17斥狼 ?埃? 瘤抄 瘤陛, 悼拱鼻俊 措茄 墨扼狼 ?刮? ? 表??嚼?促. 墨扼? 流立 400? 付府狼 俺甫 倒?? 辨???甫 困茄 鞭?家甫 ??俊 款康?瘤父 ?肺? 面盒?瘤 臼嚼?促. ??茄 ?力?, 悼拱鼻俊 措茄 撤? 牢? 加俊? 悼拱?摹客 切措, 俺?? ?力甸? 粱?? 秦搬登扁 ?菲嚼?促. 困扁俊 ?茄 悼拱 ?力甫 秦搬?妨? ??利牢 力? 俺急苞 ?雀牢? 函拳? ??? ????促.  
?甫 困秦 墨扼? ?肺款 ?且? 摹??? ?刮沁嚼?促. 弊 搬苞拱? 官肺 墨扼 ?航季磐??促. 2016斥 何磐 悼拱 ??客 ?? ??, 背? ?刮 曼??瘤 ?瓷茄 ‘配? ?妨悼拱 ??汗瘤季磐’牢 ?航季磐狼 ??? 霖厚秦 ?嚼?促. ?航季磐? 悼拱倒航苞 ???拳 犬魂狼 芭痢?磊 悼拱汗瘤俊 措茄 ???霖? 臭?扁 困茄 ?眉利牢 葛?? ? 巴??促. 瘤陛 ?航季磐? 扁?傍?甫 ??? 悼拱甸? 瘤? ?? 父甸? 款康? 霖厚?? 殿 ???? 葛?? ?酒?? 吝??促.

', '2019-10-16', 10378, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '[傍瘤] 7? 12老(陛) ?拳惑? 吝瘤 救?', '?汗 寸老牢 7? 12老(陛)俊? 措? 磨己?厘 2? ?雀肺 ?拳惑?? ??瓷??促. 

?拳惑? 棺 ?狼俊 曼?秦 林?扁 官而?促.

', '2019-07-11', 1487, 'admin');


ALTER TABLE noticeBoard ADD CONSTRAINT FK_admin_TO_noticeBoard_1 FOREIGN KEY (
	admin_id
)
REFERENCES admin (
	admin_id
)ON DELETE CASCADE;

-- 11.counseling
CREATE TABLE counseling (
	counseling_id	number		NOT NULL,
	counseling_schedule	varchar2(20)		NOT NULL,
	user_id	varchar2(20)		NOT NULL,
	adoption_id	number		NOT NULL,
	counseling_date	varchar2(20)	DEFAULT sysdate	NOT NULL,
	counseling_judgment	varchar2(20)	DEFAULT '미확인'	NOT NULL,
	counseling_detail	varchar2(2000)		NULL,
	counseling_age	number		NOT NULL,
	counseling_address	varchar2(100)		NOT NULL,
	counseling_job	varchar2(40)		NOT NULL,
	counseling_adopt	number	DEFAULT 0	NOT NULL,
    animal_id number NOT null,
    user_name varchar2(20) NOT NULL,
    user_phone varchar2(20) NOT NULL

);
COMMENT ON COLUMN counseling.user_id IS '회원은 ID로 구분';

COMMENT ON COLUMN counseling.counseling_judgment IS '관리자만 수정가능';

COMMENT ON COLUMN counseling.counseling_detail IS '관리자만 조회 수정 삭제';

--Primary Key Setting
--counseling
ALTER TABLE counseling ADD CONSTRAINT PK_COUNSELING PRIMARY KEY (
	counseling_id
);



--Forein Key
--counseling - user_id
ALTER TABLE counseling ADD CONSTRAINT FK_users_TO_counseling_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);
--counseling - adoption_id
ALTER TABLE counseling
ADD CONSTRAINT FK_adoption_TO_counseling_1
FOREIGN KEY (adoption_id)
REFERENCES adoption(adoption_id)
ON DELETE CASCADE;
-------------------------------------------------------------------------------

-- 15.survey
CREATE TABLE survey (
	survey_id	number		NOT NULL,
	survey_a1	varchar2(100)		NOT NULL,
	survey_a2	varchar2(100)		NOT NULL,
	survey_a3	varchar2(100)		NOT NULL,
	survey_a4	varchar2(100)		NOT NULL,
	survey_a5	varchar2(100)		NOT NULL,
	survey_a6	varchar2(100)		NOT NULL,
	survey_a7	varchar2(100)		NOT NULL,
	survey_a8	varchar2(1000)		NOT NULL,
	counseling_id	number		NOT NULL
);

COMMENT ON COLUMN survey.survey_id IS '설문 고유 ID';

COMMENT ON COLUMN survey.counseling_id IS '예약 고유 ID';
--Primary Key Setting
ALTER TABLE survey ADD CONSTRAINT PK_SURVEY PRIMARY KEY (
	survey_id
);



--Forein Key
ALTER TABLE survey
ADD CONSTRAINT FK_COUNSELING_TO_SURVEY_1
FOREIGN KEY (counseling_id)
REFERENCES counseling(counseling_id)
ON DELETE CASCADE;

-- 유저 더미 데이터
insert all 
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member01', 'password', '김영일', '010-1111-1111', 'member01@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member02', 'password', '김영이', '010-2222-2222', 'member02@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member03', 'password', '김영삼', '010-3333-3333', 'member03@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member04', 'password', '김영사', '010-4444-4444', 'member04@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member05', 'password', '김영오', '010-5555-5555', 'member05@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member06', 'password', '김영육', '010-6666-6666', 'member06@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member07', 'password', '김영칠', '010-7777-7777', 'member07@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member08', 'password', '김영팔', '010-8888-8888', 'member08@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member09', 'password', '김영구', '010-9999-9999', 'member09@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member10', 'password', '김일영', '010-1010-1010', 'member10@naver.com')
select * from dual;

-- 관리자 더미 데이터
insert into admin (admin_id, admin_pwd)
values('admin', 'admin1234');

-- 유기동물
INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '2살', '암컷', '중성화 O', '5kg', '갈색', '활발하고 친화적입니다.', 'admin', 0, SYSDATE, '멍멍이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES 
(animal_seq.nextval, '고양이', '3살', '수컷', '중성화 O', '3kg', '흰색', '신중하지만 귀여움이 물씬 나는 아이에요.', 'admin', 1, SYSDATE, '야옹이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '1살', '암컷', '중성화 X', '8kg', '검정', '에너지 넘치는 활발한 친구입니다.', 'admin', 2, SYSDATE, '코코');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '암컷', '중성화 O', '4kg', '회색', '조용하고 깨끗한 성격의 아이에요.', 'admin', 1, SYSDATE, '네로');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '3살', '수컷', '중성화 O', '7kg', '갈색', '훈련된 얌전한 아이입니다.', 'admin', 0, SYSDATE, '루디');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '1살', '수컷', '중성화 O', '5kg', '검정', '사람을 좋아하고 다른 동물과도 잘 지내요.', 'admin', 2, SYSDATE, '미미');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '4살', '암컷', '중성화 X', '6kg', '흰색', '아이들과 잘 어울리는 상냥한 강아지입니다.', 'admin', 0, SYSDATE, '벨라');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '수컷', '중성화 O', '4kg', '갈색', '매우 활발하고 호기심이 많은 아이에요.', 'admin', 1, SYSDATE, '톰');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '2살', '수컷', '중성화 O', '5kg', '검정', '사람을 잘 따르는 귀여운 강아지입니다.', 'admin', 0, SYSDATE, '쿠키');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '3살', '암컷', '중성화 X', '3kg', '흰색', '용감하고 경계심이 강한 아이에요.', 'admin', 2, SYSDATE, '소피');

-- 후원
INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member01', 30000, '신한카드', 30000, '김영일', '010-1111-1111');

INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member02', 50000, '국민카드', 50000, '김영이', '010-1415-7675');

INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member05', 30000, '신한카드', 30000, '김영오', '010-5555-5555');

-- 봉사 공고
insert into volunteer
values(volunteer_seq.nextval, '[봉사 모집] 보령/화성 불법 번식장 구조견들의 돌봄 봉사를 모집합니다!

보령/화성 불법 번식장에서 구조된 동물들에게 따뜻한 도움의 손길을 더해주세요!

 *봉사 신청해주셔서 감사합니다! 봉사 선발은 기재해주신 연락처로 순차적으로 드릴 예정입니다.
 
<모집 개요>
모집 기간 : ~2024년 3월 25일 18:00
대상: 19세 이상 성인, 1회 이상( 2회 이상 봉사 가능하신 분 우대)
인원: 1일 4인
**일정을 충분히 고려하여 꼭 오실 수 있는 분만 신청해주세요**', sysdate, '보령/화성 번식장 구조견 돌봄 봉사', default, '2024.03.31 (수)',
'2023.03.25 (월) 03시 00분', 10, default, '경기 파주시 법원읍 술이홀로 1409 더봄센터(파주)', default, 'admin');


insert into volunteer
values(volunteer_seq.nextval, 
'입양센터 아름품에서 입양을 기다리는 동물들을 돌봐줄 봉사자님을 모집합니다?



동물을 사랑하고 동물 돌봄에 대한 이해가 있으신 분이라면 만 20세 이상 누구나 신청 가능합니다.

단, 신청자가 많을 경우 심사가 진행될 수 있습니다.





 업무 : 강아지방과 고양이방 배변 청소, 세탁, 설거지 및 동물 돌봄.

 대상 : 최소 1개월 이상 봉사 가능하신 분, 청소에 자신 있으신 분, 체력 좋으신 분, 손이 빠르신 분, 멀티가 가능하신 분.



모집요일


3월 16일 일요일 09:30 ~ 18:30 3명





? 신청하기 누르신 후 팝업창 메모란에 오실 수 있는 요일을 작성해 주세요.





 장소 : 서울시 마포구 잔다리로 122, 2층 아름품 (지하철 6호선 망원역 1번 출구 도보 7분)',
sysdate, '아름품 동물돌봄 자원봉사 모집', default, '2024.03.16 (일)', '2024.03.13 (금) 18시 00분',
3, default, '서울 마포구 잔다리로 122 더불어숨센터 아름품', 1, 'admin');

insert into volunteer
values(volunteer_seq.nextval, '
보령 번식장 구조견들이 더불어숨센터에 대거 입소해 새로운 견생을 준비 중입니다! 가족을 기다리는 소중한 구조견들에게 따뜻한 도움의 손길로 함께해 주세요!



※ 봉사 선발은 기재해주신 연락처로 순차적으로 연락 드릴 예정입니다.



〈모집 개요〉
 모집 기간: ~2024년 2월 28일 18:00

모집 대상: 19세 이상 성인, 1회 이상(2회 이상 봉사 가능하신 분 우대)

 모집 인원: 1일 최대 4인



? 일정을 충분히 고려하여 꼭 오실 수 있는 분만 신청해주세요


 봉사 시간: 종일(09:00~18:00) 또는 오전(09:00~12:00)

 봉사 장소: 더불어숨센터(서울특별시 마포구 소재)

 봉사 내용: 보령 번식장 구조견 돌봄',
 sysdate, '보령 번식장 구조견 돌봄 봉사', default, '2024.02.29 (목)', '2024.02.28 (수) 18시 00분',
4, default, '더불어숨센터(서울특별시 마포구 소재)', 3, 'admin');

-- 유기동물 공고
INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '무료분양 이벤트가 시작되었습니다. 많은 참여 부탁드립니다.', TO_DATE('2024-03-05', 'YYYY-MM-DD'), '무료분양 이벤트 공지', 100, '진행중', '상', 'admin', 1);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '당신의 따뜻한 가정이 필요한 아이들이 기다리고 있습니다.', TO_DATE('2024-03-04', 'YYYY-MM-DD'), '어린이날 특별 무료분양', 75, '진행중', '중', 'admin', 2);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '고양이 친구들이 새로운 가족을 찾고 있어요.', TO_DATE('2024-03-03', 'YYYY-MM-DD'), '봄맞이 고양이 무료분양', 120, '종료', '하', 'admin', 3);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '겨울철 특별 무료분양 이벤트! 참여하세요.', TO_DATE('2024-03-02', 'YYYY-MM-DD'), '겨울 무료분양', 90, '진행중', '상', 'admin', 4);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '새로 무료분양받은 친구들을 소개합니다.', TO_DATE('2024-03-01', 'YYYY-MM-DD'), '신규 동물 소개', 110, '진행중', '중', 'admin', 5);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '특별한 무료분양 기회! 놓치지 마세요.', TO_DATE('2024-02-29', 'YYYY-MM-DD'), '특별 무료분양 프로모션', 80, '진행중', '하', 'admin', 6);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '무료분양 후기 이벤트가 진행 중입니다.', TO_DATE('2024-02-28', 'YYYY-MM-DD'), '무료분양 후기 작성 이벤트', 95, '진행중', '상', 'admin', 7);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '봄철 무료분양의 계절, 당신의 집에 따뜻한 친구를 불러보세요.', TO_DATE('2024-02-27', 'YYYY-MM-DD'), '봄 무료분양 이벤트', 110, '종료', '중', 'admin', 8);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '아이들을 위한 특별 무료분양 이벤트가 준비되어 있습니다.', TO_DATE('2024-02-26', 'YYYY-MM-DD'), '무료분양 이벤트', 85, '진행중', '하', 'admin', 9);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '다함께 즐기는 여름! 무료분양 이벤트에 참여하세요.', TO_DATE('2024-02-25', 'YYYY-MM-DD'), '여름 무료분양 캠페인', 105, '진행중', '상', 'admin', 10);

-- 공지 게시판
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Shop on Main Street, The (Obchod na korze)', 'M?ori', '2022-08-22', 4248, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'League of Ordinary Gentlemen, A', 'Greek', '2022-03-25', 6969, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Salut cousin!', 'Persian', '2024-01-17', 8922, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'The Open Road', 'German', '2023-07-21', 5582, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Exercice de l''?tat, L''', 'Romanian', '2023-12-07', 2730, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Hanzo the Razor: Sword of Justice (Goy?kiba)', 'Kazakh', '2024-02-05', 8976, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Poetry (Shi)', 'Tok Pisin', '2023-03-30', 933, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Shipwrecked (a.k.a. Haakon Haakonsen)', 'M?ori', '2023-07-06', 970, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Once Upon a Forest', 'Icelandic', '2022-12-13', 1871, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Haaveiden keh?', 'Norwegian', '2023-12-18', 5264, 'admin');

-- 자유게시판
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Night the Lights Went Out in Georgia, The', 'Tamil', 1, 1, '2023-07-26', 'member01');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Burrowers, The', 'Azeri', 2, 2, '2023-05-26', 'member02');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Gossip', 'M?ori', 3, 3, '2023-08-11', 'member03');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Skin Deep', 'Georgian', 4, 4, '2023-02-03', 'member04');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'God''s Gun', 'Mongolian', 5, 5, '2023-03-08', 'member05');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Time Limit', 'Belarusian', 6, 6, '2022-11-03', 'member06');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Africa: Texas Style', 'Hiri Motu', 7, 7, '2023-03-11', 'member07');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Sunset', 'Macedonian', 8, 8, '2023-04-12', 'member08');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Melvin and Howard', 'Aymara', 9, 9, '2023-08-29', 'member09');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Afternoon of a Torturer, The (Dupa-amiaza unui tortionar)', 'Bulgarian', 10, 10, '2023-08-28', 'member10');

-- 봉사 후기 게시판
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Mo'' Money', 'French', 1, 1, '2023-03-12', 'member01');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Chef in Love, A (Shekvarebuli kulinaris ataserti retsepti)', 'Romanian', 2, 2, '2022-12-15', 'member02');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Clambake', 'Latvian', 3, 3, '2023-11-02', 'member03');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Zone Troopers', 'Dhivehi', 4, 4, '2024-01-21', 'member04');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Die Fighting', 'Malayalam', 5, 5, '2023-06-24', 'member05');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'This Gun for Hire', 'Indonesian', 6, 6, '2023-09-23', 'member06');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Going Down in LA-LA Land', 'Oriya', 7, 7, '2023-11-10', 'member07');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'No Regrets for Our Youth (Waga seishun ni kuinashi)', 'Tsonga', 8, 8, '2023-08-22', 'member08');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Goat, The', 'Khmer', 9, 9, '2023-06-22', 'member09');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Louis Cyr: The Strongest Man in the World', 'Oriya', 10, 10, '2022-12-31', 'member10');

-- 입양 후 이야기 게시판
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Sleeping Beauty', 'Spanish', 1, 1, '2022-10-28', 'member01');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Aviator''s Wife, The (La femme de l''aviateur)', 'Lao', 2, 2, '2023-11-09', 'member02');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Will Penny', 'Amharic', 3, 3, '2023-11-27', 'member03');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'BloodRayne: The Third Reich', 'Hindi', 4, 4, '2023-10-04', 'member04');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Yol (a.k.a. The Way)', 'Hebrew', 5, 5, '2023-11-10', 'member05');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Destination Tokyo', 'Italian', 6, 6, '2022-12-16', 'member06');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Judy Moody and the Not Bummer Summer', 'Spanish', 7, 7, '2023-07-15', 'member07');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Just Go with It', 'Bosnian', 8, 8, '2022-11-29', 'member08');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Bone Man, The (Der Knochenmann)', 'Malayalam', 9, 9, '2023-01-12', 'member09');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Killers', 'Icelandic', 10, 10, '2023-04-23', 'member10');

-- 봉사 신청
insert into application
values(application_seq.nextval, sysdate, '', 'member01', 2, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member02', 2, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member03', 3, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member04', 3, default);

-- 입양 신청
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'member01', 1, '미확인', '상담 내용 1', 3, '서울시 강남구', '개발자', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-17', 'YYYY-MM-DD'), 'member02', 2, '미확인', '상담 내용 2', 2, '서울시 서초구', '디자이너', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'member03', 3, '미확인', '상담 내용 3', 4, '서울시 송파구', '마케터', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-22', 'YYYY-MM-DD'), 'member04', 4, '미확인', '상담 내용 4', 5, '서울시 강북구', '프로젝트 매니저', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'member05', 5, '미확인', '상담 내용 5', 3, '서울시 동작구', '데이터 분석가', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'member06', 6, '미확인', '상담 내용 6', 4, '서울시 강서구', '시스템 엔지니어', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 'member07', 7, '미확인', '상담 내용 7', 2, '서울시 강남구', '웹 디자이너', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'member08', 8, '미확인', '상담 내용 8', 5, '서울시 송파구', '데이터 사이언티스트', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'member09', 9, '미확인', '상담 내용 9', 3, '서울시 강동구', '풀스택 엔지니어', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'member10', 10, '미확인', '상담 내용 10', 4, '서울시 중랑구', '소프트웨어 엔지니어', 0);

-- 자유게시판 댓굴
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, '8th Floor', '2023-05-04', 1, 'member01');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'PO Box 9799', '2023-02-02', 2, 'member02');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Suite 55', '2023-02-27', 3, 'member03');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Apt 1581', '2023-06-04', 4, 'member04');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'PO Box 18018', '2023-07-10', 5, 'member05');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'PO Box 96224', '2022-05-15', 6, 'member06');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, '17th Floor', '2023-01-02', 7, 'member07');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Room 1437', '2022-07-25', 8, 'member08');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Room 1499', '2023-10-19', 9, 'member09');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Apt 1738', '2024-02-05', 10, 'member10');

-- 자유게시판 좋아요
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member01', 1, '2022-10-08');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member02', 2, '2023-07-02');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member03', 3, '2023-04-14');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member04', 4, '2023-10-04');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member05', 5, '2023-02-03');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member06', 6, '2022-12-09');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member07', 7, '2023-11-30');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member08', 8, '2023-02-26');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member09', 9, '2023-05-22');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member10', 10, '2022-10-04');

-- 봉사 후기 게시판 댓글
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 719', '2022-05-27', 1, 'member01');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 418', '2024-02-02', 2, 'member02');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Suite 35', '2023-03-21', 3, 'member03');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 1251', '2022-04-04', 4, 'member04');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'PO Box 97750', '2023-06-23', 5, 'member05');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 1171', '2022-03-08', 6, 'member06');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, '17th Floor', '2023-11-07', 7, 'member07');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Room 167', '2022-06-10', 8, 'member08');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Room 1216', '2023-12-24', 9, 'member09');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Room 306', '2023-02-03', 10, 'member10');

-- 봉사 후기 게시판 좋아요
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member01', '2022-09-30', 1);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member02', '2023-07-09', 2);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member03', '2023-04-08', 3);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member04', '2023-11-27', 4);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member05', '2023-03-16', 5);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member06', '2023-05-01', 6);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member07', '2022-06-02', 7);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member08', '2022-10-24', 8);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member09', '2023-05-10', 9);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member10', '2023-12-31', 10);

-- 입양 후 이야기 게시판 댓글
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Apt 1628', '2023-11-22', 1, 'member01');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Room 1329', '2023-10-23', 2, 'member02');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, '13th Floor', '2022-10-28', 3, 'member03');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 2037', '2024-01-27', 4, 'member04');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Room 1779', '2023-03-20', 5, 'member05');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 18663', '2022-02-21', 6, 'member06');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Suite 82', '2023-12-02', 7, 'member07');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, '8th Floor', '2023-01-16', 8, 'member08');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 80950', '2023-09-27', 9, 'member09');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 29822', '2022-05-31', 10, 'member10');

-- 입양 후 이야기 게시판 좋아요
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member01', '2022-11-19', 1);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member02', '2023-09-17', 2);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member03', '2023-02-21', 3);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member04', '2022-11-23', 4);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member05', '2023-06-12', 5);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member06', '2023-05-31', 6);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member07', '2023-05-25', 7);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member08', '2023-08-25', 8);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member09', '2023-12-22', 9);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member10', '2022-05-31', 10);

-- 신고
insert into report(report_id, report_sort, report_date, report_detail, report_status, fboard_id, user_id)
values(47, 1, '2024-03-05', '욕설신고', 1, 1, 
    (select user_id 
        from freeboard
        where fboard_id = 1
    ));

insert into report(report_id, report_sort, report_date, report_detail, report_status, vfboard_id, user_id)
values(46, 2, '2024-03-05', '도배신고', 1, 1, 
    (select user_id 
        from volunteerFeedbackBoard
        where vfboard_id = 1
    ));

insert into report(report_id, report_sort, report_date, report_detail, report_status, afboard_id, user_id)
values(45, 3, '2024-03-05', '', 2, 1, 
    (select user_id 
        from adoptionFeedbackBoard
        where afboard_id = 1
    ));

-- 이미지
insert into image(image_id, board_sort, image_name, fboard_id)
values(1, 4, 'image_01', 1);

insert into image(image_id, board_sort, image_name, vfboard_id)
values(2, 6, 'image_02', 1);

insert into image(image_id, board_sort, image_name, afboard_id)
values(3, 7, 'image_03', 1);

-- 설문
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(1, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '상담 내용이 유용했습니다.', 1);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(2, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '상담 내용이 부족합니다.', 2);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(3, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '더 많은 시간이 필요합니다.', 3);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(4, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '상담이 지루했습니다.', 4);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(5, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '추가 서비스가 필요합니다.', 5);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(6, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '상담이 너무 길었습니다.', 6);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(7, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '자세한 상담이 필요합니다.', 7);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(8, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '상담 내용이 모호합니다.', 8);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(9, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '만족합니다.', 9);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(10, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '더 많은 상담이 필요합니다.', 10);

-- 제재
insert into sanction
values(6, 1,
    (select user_repcnt
        from users
        where user_id = (select user_id
                            from freeboard
                            where fboard_id = 1)
    ), sysdate, 47);

insert into sanction
values(5, 1,
    (select user_repcnt
        from users
        where user_id = (select user_id
                            from volunteerFeedbackBoard
                            where vfboard_id = 1)
    ), sysdate, 46);

insert into sanction
values(4, 1,
    (select user_repcnt
        from users
        where user_id = (select user_id
                            from adoptionFeedbackBoard
                            where afboard_id = 1)
    ), sysdate, 45);
    
    ALTER TABLE users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	user_id
);

ALTER TABLE admin ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	admin_id
);

ALTER TABLE volunteer ADD CONSTRAINT PK_VOLUNTEER PRIMARY KEY (
	volunteer_id
);

ALTER TABLE adoption ADD CONSTRAINT PK_ADOPTION PRIMARY KEY (
	adoption_id
);

ALTER TABLE freeBoard ADD CONSTRAINT PK_FREEBOARD PRIMARY KEY (
	fboard_id
);

ALTER TABLE Fcomment ADD CONSTRAINT PK_FCOMMENT PRIMARY KEY (
	fcomment_id
);

ALTER TABLE counseling ADD CONSTRAINT PK_COUNSELING PRIMARY KEY (
	counseling_id
);

ALTER TABLE application ADD CONSTRAINT PK_APPLICATION PRIMARY KEY (
	application_id
);

ALTER TABLE donate ADD CONSTRAINT PK_DONATE PRIMARY KEY (
	donate_ID
);

ALTER TABLE animal ADD CONSTRAINT PK_ANIMAL PRIMARY KEY (
	animal_id
);

ALTER TABLE flike ADD CONSTRAINT PK_FLIKE PRIMARY KEY (
	flike_id
);

ALTER TABLE noticeBoard ADD CONSTRAINT PK_NOTICEBOARD PRIMARY KEY (
	nboard_id
);

ALTER TABLE image ADD CONSTRAINT PK_IMAGE PRIMARY KEY (
	image_id
);

ALTER TABLE volunteerFeedbackBoard ADD CONSTRAINT PK_VOLUNTEERFEEDBACKBOARD PRIMARY KEY (
	vfboard_id
);

ALTER TABLE adoptionFeedbackBoard ADD CONSTRAINT PK_ADOPTIONFEEDBACKBOARD PRIMARY KEY (
	afboard_id
);

ALTER TABLE survey ADD CONSTRAINT PK_SURVEY PRIMARY KEY (
	survey_id
);

ALTER TABLE VFcomment ADD CONSTRAINT PK_VFCOMMENT PRIMARY KEY (
	vfcomment_id
);

ALTER TABLE AFcomment ADD CONSTRAINT PK_AFCOMMENT PRIMARY KEY (
	afcomment_id
);

ALTER TABLE VFlike ADD CONSTRAINT PK_VFLIKE PRIMARY KEY (
	vflike_id
);

ALTER TABLE AFlike ADD CONSTRAINT PK_AFLIKE PRIMARY KEY (
	aflike_id
);

ALTER TABLE report ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	report_id
);

ALTER TABLE sanction ADD CONSTRAINT PK_SANCTION PRIMARY KEY (
	sanction_id
);

ALTER TABLE volunteer ADD CONSTRAINT FK_admin_TO_volunteer_1 FOREIGN KEY (
	admin_id
)
REFERENCES admin (
	admin_id
);

ALTER TABLE adoption ADD CONSTRAINT FK_admin_TO_adoption_1 FOREIGN KEY (
	admin_id
)
REFERENCES admin (
	admin_id
);

ALTER TABLE adoption ADD CONSTRAINT FK_animal_TO_adoption_1 FOREIGN KEY (
	animal_id
)
REFERENCES animal (
	animal_id
);

ALTER TABLE freeBoard ADD CONSTRAINT FK_users_TO_freeBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE Fcomment ADD CONSTRAINT FK_freeBoard_TO_Fcomment_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
);

ALTER TABLE Fcomment ADD CONSTRAINT FK_users_TO_Fcomment_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE counseling ADD CONSTRAINT FK_users_TO_counseling_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE counseling ADD CONSTRAINT FK_adoption_TO_counseling_1 FOREIGN KEY (
	adoption_id
)
REFERENCES adoption (
	adoption_id
);

ALTER TABLE application ADD CONSTRAINT FK_users_TO_application_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE application ADD CONSTRAINT FK_volunteer_TO_application_1 FOREIGN KEY (
	volunteer_id
)
REFERENCES volunteer (
	volunteer_id
);

ALTER TABLE donate ADD CONSTRAINT FK_users_TO_donate_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE animal ADD CONSTRAINT FK_admin_TO_animal_1 FOREIGN KEY (
	admin_id
)
REFERENCES admin (
	admin_id
);

ALTER TABLE flike ADD CONSTRAINT FK_users_TO_flike_1 FOREIGN KEY (
	fliuser_id
)
REFERENCES users (
	user_id
);

ALTER TABLE flike ADD CONSTRAINT FK_freeBoard_TO_flike_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
);

ALTER TABLE noticeBoard ADD CONSTRAINT FK_admin_TO_noticeBoard_1 FOREIGN KEY (
	admin_id
)
REFERENCES admin (
	admin_id
);

ALTER TABLE image ADD CONSTRAINT FK_adoption_TO_image_1 FOREIGN KEY (
	adoption_id
)
REFERENCES adoption (
	adoption_id
);

ALTER TABLE image ADD CONSTRAINT FK_animal_TO_image_1 FOREIGN KEY (
	animal_id
)
REFERENCES animal (
	animal_id
);

ALTER TABLE image ADD CONSTRAINT FK_noticeBoard_TO_image_1 FOREIGN KEY (
	nboard_id
)
REFERENCES noticeBoard (
	nboard_id
);

ALTER TABLE image ADD CONSTRAINT FK_volunteer_TO_image_1 FOREIGN KEY (
	volunteer_id
)
REFERENCES volunteer (
	volunteer_id
);

ALTER TABLE image ADD CONSTRAINT FK_freeBoard_TO_image_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
);

ALTER TABLE image ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_image_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
);

ALTER TABLE image ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_image_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
);

ALTER TABLE volunteerFeedbackBoard ADD CONSTRAINT FK_users_TO_volunteerFeedbackBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE adoptionFeedbackBoard ADD CONSTRAINT FK_users_TO_adoptionFeedbackBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE survey ADD CONSTRAINT FK_counseling_TO_survey_1 FOREIGN KEY (
	counseling_id
)
REFERENCES counseling (
	counseling_id
);

ALTER TABLE VFcomment ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_VFcomment_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
);

ALTER TABLE VFcomment ADD CONSTRAINT FK_users_TO_VFcomment_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE AFcomment ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_AFcomment_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
);

ALTER TABLE AFcomment ADD CONSTRAINT FK_users_TO_AFcomment_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE VFlike ADD CONSTRAINT FK_users_TO_VFlike_1 FOREIGN KEY (
	vfliuser_id
)
REFERENCES users (
	user_id
);

ALTER TABLE VFlike ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_VFlike_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
);

ALTER TABLE AFlike ADD CONSTRAINT FK_users_TO_AFlike_1 FOREIGN KEY (
	afliuser_id
)
REFERENCES users (
	user_id
);

ALTER TABLE AFlike ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_AFlike_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
);

ALTER TABLE report ADD CONSTRAINT FK_freeBoard_TO_report_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
);

ALTER TABLE report ADD CONSTRAINT FK_Fcomment_TO_report_1 FOREIGN KEY (
	fcomment_id
)
REFERENCES Fcomment (
	fcomment_id
);

ALTER TABLE report ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_report_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
);

ALTER TABLE report ADD CONSTRAINT FK_VFcomment_TO_report_1 FOREIGN KEY (
	vfcomment_id
)
REFERENCES VFcomment (
	vfcomment_id
);

ALTER TABLE report ADD CONSTRAINT FK_AFcomment_TO_report_1 FOREIGN KEY (
	afcomment_id
)
REFERENCES AFcomment (
	afcomment_id
);

ALTER TABLE report ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_report_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
);

ALTER TABLE report ADD CONSTRAINT FK_users_TO_report_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE sanction ADD CONSTRAINT FK_report_TO_sanction_1 FOREIGN KEY (
	report_id
)
REFERENCES report (
	report_id
);

--create table report
CREATE TABLE report (
	report_id	    number		NOT NULL,
	report_sort	    number		NOT NULL,
	report_date	    date	    DEFAULT sysdate NOT NULL,
	report_detail	varchar2(2000)		        NULL,
	report_status	number	    DEFAULT 1	    NOT NULL,
	fboard_id	    number		NULL,
	fcomment_id	    number		NULL,
	vfboard_id	    number		NULL,
	vfcomment_id	number		NULL,
	afcomment_id	number		NULL,
	afboard_id	    number		NULL,
	user_id	varchar2(20)		NOT NULL
);

--set primary key
ALTER TABLE report ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	report_id
);

--set foreign key
--board_id : cascade
ALTER TABLE report ADD CONSTRAINT FK_freeBoard_TO_report_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
)on delete cascade;

ALTER TABLE report ADD CONSTRAINT FK_Fcomment_TO_report_1 FOREIGN KEY (
	fcomment_id
)
REFERENCES Fcomment (
	fcomment_id
)on delete cascade;

ALTER TABLE report ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_report_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
)on delete cascade;

ALTER TABLE report ADD CONSTRAINT FK_VFcomment_TO_report_1 FOREIGN KEY (
	vfcomment_id
)
REFERENCES VFcomment (
	vfcomment_id
)on delete cascade;

ALTER TABLE report ADD CONSTRAINT FK_AFcomment_TO_report_1 FOREIGN KEY (
	afcomment_id
)
REFERENCES AFcomment (
	afcomment_id
)on delete cascade;

ALTER TABLE report ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_report_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
)on delete cascade;

--user_id : cascade
ALTER TABLE report ADD CONSTRAINT FK_users_TO_report_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
)on delete cascade;

-------------------------------------------------------------------------------

--create teable sanction
CREATE TABLE sanction (
	sanction_id	number		    NOT NULL,
	sanction_status	number		NOT NULL,
	sanction_result	number		NOT NULL,
	sanction_date	date	    DEFAULT sysdate	NOT NULL,
	report_id	number		    null
);

--set primary key
ALTER TABLE sanction ADD CONSTRAINT PK_SANCTION PRIMARY KEY (
	sanction_id
);

--set foreign key
--report_id : set null
ALTER TABLE sanction ADD CONSTRAINT FK_report_TO_sanction_1 FOREIGN KEY (
	report_id
)
REFERENCES report (
	report_id
)on delete set null;

-- 유기동물
CREATE SEQUENCE animal_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  CACHE 20;

-- 후원
CREATE SEQUENCE donate_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- 봉사 공고
create sequence volunteer_seq
start with 1
increment by 1
nocycle
nocache;

-- 유기동물 공고
CREATE SEQUENCE adoption_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  CACHE 20;
  
-- 공지게시판
create sequence noticeBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- 자유게시판
create sequence freeBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 후기 게시판
create sequence volunteerFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- 입양 후 이야기 게시판
create sequence adoptionFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 신청
create sequence application_seq
start with 1
increment by 1
nocycle
nocache;

-- 입양 신청
CREATE SEQUENCE counseling_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- 자유게시판 댓굴
create sequence Fcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- 자유게시판 좋아요
create sequence flike_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 후기 게시판 댓글
create sequence VFcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 후기 게시판 좋아요
create sequence VFlike_seq
start with 1
increment by 1
nocycle
nocache;

-- 입양 후 이야기 게시판 댓글
create sequence AFcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- 입양 후 이야기 게시판 좋아요
create sequence AFlike_seq
start with 1
increment by 1
nocycle
nocache;

-- 신고
create sequence report_seq
increment by 1
start with 1
nocache
nocycle;

-- 이미지
create sequence image_seq
increment by 1
start with 1
nocache
nocycle;

-- 설문
CREATE SEQUENCE survey_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- 제재
create sequence sanction_seq
increment by 1
start with 1
nocache
nocycle;

CREATE TABLE users (
	user_id	varchar2(20)		NOT NULL,
	user_pwd	varchar2(30)		NOT NULL,
	user_name	varchar2(50)		NOT NULL,
	user_phone	varchar2(20)		NOT NULL,
	user_email	varchar2(50)		NOT NULL,
	user_act	number	DEFAULT 1	NOT NULL,
	user_repcnt	number	DEFAULT 0	NOT NULL,
	user_date	date	DEFAULT sysdate	NOT NULL,
	user_volcnt	number	DEFAULT 0	NOT NULL,
	user_level	number	DEFAULT 1	NOT NULL,
	user_adoptchk	number	DEFAULT 0	NOT NULL
);



COMMENT ON COLUMN users.user_id IS '회원은 ID로 구분';

COMMENT ON COLUMN users.user_phone IS '중복 불가';

COMMENT ON COLUMN users.user_email IS '중복 불가';

COMMENT ON COLUMN users.user_act IS '상태코드분류 1: 활동, 2: 활동중지, 0: 탈퇴(비활동) .  기본값은 1';

COMMENT ON COLUMN users.user_repcnt IS '관리자가 회원에 신고제재할 때마다 누적되는 횟수이다.  기본값은 0.';

COMMENT ON COLUMN users.user_date IS '시스템 날짜로 입력됨.';

COMMENT ON COLUMN users.user_volcnt IS '봉사 할때마다 1씩 증가';

COMMENT ON COLUMN users.user_level IS '봉사횟수가 3회 마다 1씩 증가';

COMMENT ON COLUMN users.user_adoptchk IS '입양한 경우 1';

CREATE TABLE admin (
	admin_id	varchar2(20)		NOT NULL,
	admin_pwd	varchar2(30)		NOT NULL
);


COMMENT ON COLUMN admin.admin_id IS '관리자는 한 명으로 가정하였습니다.';

CREATE TABLE volunteer (
	volunteer_id	number		NOT NULL,
	volunteer_detail	varchar2(2000)		NOT NULL,
	volunteer_date	date	DEFAULT sysdate	NOT NULL,
	volunteer_title	varchar2(100)		NOT NULL,
	volunteer_cnt	number	DEFAULT 0	NOT NULL,
	volunteer_time	varchar2(30)		NOT NULL,
	volunteer_due	varchar2(30)		NOT NULL,
	volunteer_limit	number		NOT NULL,
	volunteer_cost	varchar2(20)	DEFAULT '없음'	NOT NULL,
	volunteer_location	varchar2(100)		NOT NULL,
	volunteer_progress	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);


COMMENT ON COLUMN volunteer.volunteer_date IS '작성한 당일로 입력';

COMMENT ON COLUMN volunteer.volunteer_progress IS '신청 가능 일자와 모집 인원에 따라 0 : 모집 전, 1 : 모집 중, 2 : 모집완료,  3 : 모집 종료 로 나뉜다.';

COMMENT ON COLUMN volunteer.admin_id IS '관리자는 한 명으로 가정하였습니다.';

CREATE TABLE adoption (
	adoption_id	number		NOT NULL,
	adoption_content	varchar2(2000)		NOT NULL,
	adoption_date	date	DEFAULT sysdate	NOT NULL,
	adoption_title	varchar2(100)		NOT NULL,
	adoption_cnt	number	DEFAULT 0	NOT NULL,
	adoption_status	varchar2(20)	DEFAULT '공고중'	NOT NULL,
	adoption_level	varchar2(20)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL,
	animal_id	number		NOT NULL
);

COMMENT ON COLUMN adoption.adoption_level IS '입양 공고의 동물마다 레벨 제한이 달라짐';

COMMENT ON COLUMN adoption.admin_id IS '관리자는 한 명으로 가정하였습니다.';

CREATE TABLE freeBoard (
	fboard_id	number		NOT NULL,
	fboard_title	varchar2(80)		NOT NULL,
	fboard_content	varchar2(2000)		NOT NULL,
	fboard_like	number	DEFAULT 0	NOT NULL,
	fboard_cnt	number	DEFAULT 0	NOT NULL,
	fboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN freeBoard.fboard_id IS '자유게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN freeBoard.fboard_like IS '버튼클릭시 +1, 한번 더 클릭시 -1';

COMMENT ON COLUMN freeBoard.fboard_cnt IS '날짜/조회수/좋아요수 순으로 정렬가능';

COMMENT ON COLUMN freeBoard.fboard_date IS '게시글이 작성된 날짜 및 시간 표시';

COMMENT ON COLUMN freeBoard.user_id IS '회원은 ID로 구분';

CREATE TABLE Fcomment (
	fcomment_id	number		NOT NULL,
	fcomment_content	varchar2(150)		NOT NULL,
	fcomment_date	date	DEFAULT sysdate	NOT NULL,
	fboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN Fcomment.fcomment_id IS '자유글 댓글 고유ID';

COMMENT ON COLUMN Fcomment.fboard_id IS '자유게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN Fcomment.user_id IS '회원은 ID로 구분';

CREATE TABLE counseling (
	counseling_id	number		NOT NULL,
	counseling_schedule	date		NOT NULL,
	user_id	varchar2(20)		NOT NULL,
	adoption_id	number		NOT NULL,
	counseling_date	date	DEFAULT sysdate	NOT NULL,
	counseling_judgment	varchar2(20)	DEFAULT '미확인'	NOT NULL,
	counseling_detail	varchar2(2000)		NULL,
	counseling_age	number		NOT NULL,
	counseling_address	varchar2(100)		NOT NULL,
	counseling_job	varchar2(40)		NOT NULL,
	counseling_adopt	number	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN counseling.user_id IS '회원은 ID로 구분';

COMMENT ON COLUMN counseling.counseling_judgment IS '관리자만 수정가능';

COMMENT ON COLUMN counseling.counseling_detail IS '관리자만 조회 수정 삭제';

COMMENT ON COLUMN counseling.counseling_adopt IS '0 : 입양 , 1 : 임시보호';

CREATE TABLE application (
	application_id	number		NOT NULL,
	application_date	date	DEFAULT sysdate	NOT NULL,
	application_comment	varchar2(150)		NULL,
	user_id	varchar2(20)		NOT NULL,
	volunteer_id	number		NOT NULL,
	application_result	number	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN application.application_date IS '당일 로 입력되게 한다';

COMMENT ON COLUMN application.user_id IS '회원은 ID로 구분';

COMMENT ON COLUMN application.application_result IS '이행시 1 이행 하지 않을시 0그대로';

CREATE TABLE donate (
	donate_ID	number		NOT NULL,
	donate_Price	number		NOT NULL,
	donate_Day	date	DEFAULT sysdate	NOT NULL,
	donate_PM	varchar2(30)		NOT NULL,
	donate_FDay	date	DEFAULT sysdate	NOT NULL,
	donate_sprice	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL,
	donate_AHName	varchar2(21)		NOT NULL,
	donate_AHPhone	varchar2(30)		NOT NULL
);

COMMENT ON COLUMN donate.donate_PM IS '카드결제로만 가능하다';

COMMENT ON COLUMN donate.user_id IS '회원은 ID로 구분';

CREATE TABLE animal (
	animal_id	number		NOT NULL,
	animal_species	varchar2(50)		NOT NULL,
	animal_age	varchar2(50)		NOT NULL,
	animal_gender	varchar2(50)		NOT NULL,
	animal_status	varchar2(50)		NOT NULL,
	animal_kg	varchar2(50)		NOT NULL,
	animal_color	varchar2(50)		NOT NULL,
	animal_memo	varchar2(2000)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL,
	animal_temp	number	DEFAULT 0	NOT NULL,
	animal_regist	date	DEFAULT sysdate	NOT NULL,
	animal_name	varchar2(50)		NOT NULL
);

COMMENT ON COLUMN animal.animal_species IS '강아지 또는 고양이';

COMMENT ON COLUMN animal.admin_id IS '관리자는 한 명으로 가정하였습니다.';

COMMENT ON COLUMN animal.animal_temp IS '0 : 불가능 1 : 호스피스 2 : 장기체류 3: 심장사상충';


CREATE TABLE flike (
	flike_id	number		NOT NULL,
	fliuser_id	varchar2(20)		NOT NULL,
	fboard_id	number		NOT NULL,
	flike_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN flike.fliuser_id IS '좋아요 누른 회원 ID';

CREATE TABLE noticeBoard (
	nboard_id	number		NOT NULL,
	nboard_title	varchar2(80)		NOT NULL,
	nboard_content	varchar2(2000)		NOT NULL,
	nboard_date	date	DEFAULT sysdate	NOT NULL,
	nboard_cnt	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN noticeBoard.nboard_id IS '공지게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN noticeBoard.nboard_date IS '게시글이 작성된 날짜 및 시간 표시';

COMMENT ON COLUMN noticeBoard.nboard_cnt IS '글 페이지 접속할때마다 조회수 1증가';

COMMENT ON COLUMN noticeBoard.admin_id IS '관리자는 한 명으로 가정하였습니다.';

CREATE TABLE image (
	image_id	number		NOT NULL,
	board_sort	number		NOT NULL,
	image_name	varchar2(20)		NOT NULL,
	adoption_id	number		NULL,
	animal_id	number		NULL,
	nboard_id	number		NULL,
	volunteer_id	number		NULL,
	fboard_id	number		NULL,
	vfboard_id	number		NULL,
	afboard_id	number		NULL
);

COMMENT ON COLUMN image.board_sort IS '1.유기동물, 2.입양공고, 3.봉사공고, 4.자유게시판, 5.공지게시판, 6.봉사후기, 7.입양후기';

COMMENT ON COLUMN image.nboard_id IS '공지게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN image.fboard_id IS '자유게시판에 작성된 글의 고유번호';

CREATE TABLE volunteerFeedbackBoard (
	vfboard_id	number		NOT NULL,
	vfboard_title	varchar2(80)		NOT NULL,
	vfboard_content	varchar2(2000)		NOT NULL,
	vfboard_like	number	DEFAULT 0	NOT NULL,
	vfboard_cnt	number	DEFAULT 0	NOT NULL,
	vfboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN volunteerFeedbackBoard.user_id IS '회원은 ID로 구분';

CREATE TABLE adoptionFeedbackBoard (
	afboard_id	number		NOT NULL,
	afboard_title	varchar2(80)		NOT NULL,
	afboard_content	varchar2(2000)		NOT NULL,
	afboard_like	number	DEFAULT 0	NOT NULL,
	afboard_cnt	number	DEFAULT 0	NOT NULL,
	afboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN adoptionFeedbackBoard.user_id IS '회원은 ID로 구분';

CREATE TABLE survey (
	survey_id	number		NOT NULL,
	survey_a1	varchar2(100)		NOT NULL,
	survey_a2	varchar2(100)		NOT NULL,
	survey_a3	varchar2(100)		NOT NULL,
	survey_a4	varchar2(100)		NOT NULL,
	survey_a5	varchar2(100)		NOT NULL,
	survey_a6	varchar2(100)		NOT NULL,
	survey_a7	varchar2(100)		NOT NULL,
	survey_a8	varchar2(1000)		NOT NULL,
	counseling_id	number		NOT NULL
);

COMMENT ON COLUMN survey.survey_id IS '설문 고유 ID';

COMMENT ON COLUMN survey.counseling_id IS '예약 고유 ID';

CREATE TABLE VFcomment (
	vfcomment_id	number		NOT NULL,
	vfcomment_content	varchar2(150)		NOT NULL,
	vfcomment_date	date	DEFAULT sysdate	NOT NULL,
	vfboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN VFcomment.vfcomment_id IS '봉사후기글 댓글 고유ID';

COMMENT ON COLUMN VFcomment.vfcomment_content IS '봉사후기 댓글 내용';

COMMENT ON COLUMN VFcomment.user_id IS '회원은 ID로 구분';

CREATE TABLE AFcomment (
	afcomment_id	number		NOT NULL,
	afcomment_content	varchar2(150)		NOT NULL,
	afcomment_date	date	DEFAULT sysdate	NOT NULL,
	afboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN AFcomment.user_id IS '회원은 ID로 구분';

CREATE TABLE VFlike (
	vflike_id	number		NOT NULL,
	vfliuser_id	varchar2(20)		NOT NULL,
	vflike_date	date	DEFAULT sysdate	NOT NULL,
	vfboard_id	number		NOT NULL
);

COMMENT ON COLUMN VFlike.vfliuser_id IS '좋아요 누른 회원 ID';

CREATE TABLE AFlike (
	aflike_id	number		NOT NULL,
	afliuser_id	varchar2(20)		NOT NULL,
	aflike_date	date	DEFAULT sysdate	NOT NULL,
	afboard_id	number		NOT NULL
);

COMMENT ON COLUMN AFlike.afliuser_id IS '좋아요 누른 회원 ID';

CREATE TABLE report (
	report_id	number		NOT NULL,
	report_sort	number		NOT NULL,
	report_date	date	DEFAULT sysdate	NOT NULL,
	report_detail	varchar2(2000)		NULL,
	report_status	number	DEFAULT 1	NOT NULL,
	fboard_id	number		NULL,
	fcomment_id	number		NULL,
	vfboard_id	number		NULL,
	vfcomment_id	number		NULL,
	afcomment_id	number		NULL,
	afboard_id	number		NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN report.report_date IS '1. 욕설 / 2. 도배 / 3. 광고 / 4. 기타';

COMMENT ON COLUMN report.report_status IS '1. 신고됨 / 2. 처리됨';

COMMENT ON COLUMN report.fboard_id IS '자유게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN report.fcomment_id IS '자유글 댓글 고유ID';

COMMENT ON COLUMN report.vfcomment_id IS '봉사후기글 댓글 고유ID';

COMMENT ON COLUMN report.user_id IS '신고한 회원 ID';

CREATE TABLE sanction (
	sanction_id	number		NOT NULL,
	sanction_status	number		NOT NULL,
	sanction_result	number		NOT NULL,
	sanction_date	date	DEFAULT sysdate	NOT NULL,
	report_id	number		NOT NULL
);

COMMENT ON COLUMN sanction.sanction_status IS '1. 신고제재 / 2. 신고무시';

COMMENT ON COLUMN sanction.sanction_result IS '1. 게시글삭제 / 2. 유저활동정지 / 3. 계정삭제';

-- 기존 유저 더미 데이터 : 핸드폰번호 하이픈 없는 형식 변경
insert all 
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member01', 'password', '김영일', '01010112311', 'member01@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member02', 'password', '김영이', '01022341222', 'member02@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member03', 'password', '김영삼', '01033312333', 'member03@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member04', 'password', '김영사', '01044445644', 'member04@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member05', 'password', '김영오', '01055545655', 'member05@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member06', 'password', '김영육', '01066645666', 'member06@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member07', 'password', '김영칠', '01077778977', 'member07@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member08', 'password', '김영팔', '01088878988', 'member08@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member09', 'password', '김영구', '01099978999', 'member09@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member10', 'password', '김일영', '01010101010', 'member10@naver.com')
select * from dual;

-- 통합테스트 데이터(전체 컬럼 설정 데이터 55개 레코드)
insert all
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february24', 'password', '황재원', '01059613308', 'february24@naver.com', '2024-02-01', 1, 0, 30, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('august22', 'password', '서윤서', '01051858986', 'august22@daum.net', '2024-01-01', 1, 0, 30, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july31', 'password', '오영희', '01900797907', 'july31@naver.com', '2024-01-01', 1, 0, 30, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('may12', 'password', '신정호', '01049549508', 'may12@gmail.com', '2023-12-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october3', 'password', '서은영', '01719728387', 'october3@gmail.com', '2023-10-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september19', 'password', '최윤서', '01048548022', 'september19@gmail.com', '2024-02-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july11', 'password', '권민지', '01175348361', 'july11@naver.com', '2023-11-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february1', 'password', '서지원', '01184321809', 'february1@gmail.com', '2024-02-01', 1, 1, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november24', 'password', '한민경', '01074544982', 'november24@naver.com', '2024-03-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september16', 'password', '임지연', '01104936341', 'september16@daum.net', '2023-11-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september13', 'password', '오지훈', '01760465706', 'september13@naver.com', '2023-12-01', 1, 0, 20, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november1', 'password', '황은영', '01038544196', 'november1@naver.com', '2024-03-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july6', 'password', '장지민', '01176035210', 'july6@naver.com', '2023-10-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('january8', 'password', '송지원', '01607967859', 'january8@gmail.com', '2024-03-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march30', 'password', '최승민', '01674195467', 'march30@gmail.com', '2023-12-01', 1, 1, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june6', 'password', '권지훈', '01915452393', 'june6@gmail.com', '2024-03-01', 1, 1, 20, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('august29', 'password', '이승현', '01747037558', 'august29@gmail.com', '2023-10-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december3', 'password', '권영진', '01765001823', 'december3@gmail.com', '2024-01-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november12', 'password', '김영희', '01786247971', 'november12@gmail.com', '2024-02-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july24', 'password', '신승우', '01163242271', 'july24@gmail.com', '2024-03-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november14', 'password', '홍미정', '01721568062', 'november14@gmail.com', '2024-01-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june16', 'password', '임민호', '01022198886', 'june16@naver.com', '2023-10-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october7', 'password', '류민영', '01171132581', 'october7@gmail.com', '2024-03-01', 1, 1, 10, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april4', 'password', '홍현진', '01967233843', 'april4@gmail.com', '2023-12-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september21', 'password', '류현주', '01979758872', 'september21@naver.com', '2023-11-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september9', 'password', '신정호', '01112511206', 'september9@naver.com', '2023-10-01', 1, 1, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('january3', 'password', '안정훈', '01082573129', 'january3@daum.net', '2024-03-01', 1, 1, 10, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('august30', 'password', '최승현', '01968891010', 'august30@daum.net', '2023-11-01', 1, 1, 3, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september8', 'password', '신성우', '01735313674', 'september8@naver.com', '2024-02-01', 1, 1, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july4', 'password', '정영희', '01958232395', 'july4@gmail.com', '2023-12-01', 1, 1, 3, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june27', 'password', '홍영진', '01007080963', 'june27@naver.com', '2023-12-01', 1, 1, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june21', 'password', '강혜경', '01680577273', 'june21@naver.com', '2024-02-01', 1, 0, 3, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april26', 'password', '신지우', '01905154153', 'april26@naver.com', '2023-11-01', 1, 1, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september28', 'password', '홍수진', '01798766276', 'september28@gmail.com', '2024-02-01', 1, 0, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march9', 'password', '강미정', '01697723896', 'march9@daum.net', '2023-11-01', 1, 1, 2, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october29', 'password', '정현영', '01033044775', 'october29@daum.net', '2024-02-01', 1, 0, 2, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march5', 'password', '권서연', '01118512843', 'march5@daum.net', '2024-03-01', 1, 1, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april13', 'password', '한성우', '01941812094', 'april13@naver.com', '2024-02-01', 1, 1, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december6', 'password', '권승우', '01701998752', 'december6@daum.net', '2023-12-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november15', 'password', '안서연', '01141519529', 'november15@daum.net', '2024-03-01', 1, 0, 0, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november20', 'password', '안미영', '01657918229', 'november20@naver.com', '2024-02-01', 1, 1, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february28', 'password', '홍지현', '01927411687', 'february28@naver.com', '2024-02-01', 1, 1, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april23', 'password', '류진영', '01783989902', 'april23@gmail.com', '2024-02-01', 1, 1, 0, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september15', 'password', '신승민', '01982200268', 'september15@naver.com', '2024-03-01', 1, 0, 2, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march11', 'password', '한윤서', '01754812797', 'march11@gmail.com', '2023-10-01', 1, 1, 0, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september5', 'password', '조현주', '01019605947', 'september5@gmail.com', '2024-02-01', 2, 2, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december29', 'password', '서윤서', '01035514424', 'december29@naver.com', '2024-01-01', 2, 2, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april16', 'password', '권지원', '01765549245', 'april16@daum.net', '2024-03-01', 2, 2, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december25', 'password', '김미영', '01149345495', 'december25@naver.com', '2024-02-01', 2, 2, 0, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february23', 'password', '윤서연', '01007695449', 'february23@naver.com', '2024-03-01', 2, 2, 0, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('january7', 'password', '윤혜경', '01915876324', 'january7@naver.com', '2023-10-01', 0, 3, 1, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february19', 'password', '조정호', '01770431531', 'february19@naver.com', '2023-12-01', 0, 3, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february10', 'password', '조성우', '01745618299', 'february10@daum.net', '2024-01-01', 0, 3, 2, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november6', 'password', '강지민', '01603075215', 'november6@daum.net', '2023-10-01', 0, 3, 1, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october2', 'password', '윤민지', '01002312264', 'october2@naver.com', '2024-02-01', 0, 3, 0, 1)
select * from dual;
--commit;
select * from users order by user_id;

CREATE TABLE volunteer (
	volunteer_id	number		NOT NULL,
	volunteer_detail	varchar2(2000)		NOT NULL,
	volunteer_date	date	DEFAULT sysdate	NOT NULL,
	volunteer_title	varchar2(100)		NOT NULL,
	volunteer_time	varchar2(30)		NOT NULL,
	volunteer_due	varchar2(30)		NOT NULL,
	volunteer_limit	number		NOT NULL,
	volunteer_cost	varchar2(20)	DEFAULT '없음'	NOT NULL,
	volunteer_location	varchar2(100)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);

-- 파일명을 위한 필드
alter table volunteer
add(volunteer_file varchar2(500));

alter table volunteer
modify(volunteer_detail varchar2(4000));

CREATE TABLE application (
	application_id	number		NOT NULL,
	application_date	date	DEFAULT sysdate	NOT NULL,
	application_comment	varchar2(150)		NULL,
	user_id	varchar2(20)		NOT NULL,
	volunteer_id	number		NOT NULL,
	application_result	number	DEFAULT 0	NOT NULL
);

ALTER TABLE volunteer ADD CONSTRAINT PK_VOLUNTEER PRIMARY KEY (
	volunteer_id
);

ALTER TABLE application ADD CONSTRAINT PK_APPLICATION PRIMARY KEY (
	application_id
);

ALTER TABLE application ADD CONSTRAINT FK_volunteer_TO_application_1 FOREIGN KEY (volunteer_id)
REFERENCES volunteer (volunteer_id)
ON DELETE CASCADE;

-- 봉사 공고
create sequence volunteer_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 신청
create sequence application_seq
start with 1
increment by 1
nocycle
nocache;