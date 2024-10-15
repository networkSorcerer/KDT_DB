-----------------------------------------------------------------------------------------
--Animal º¯°æ »çÇ× 
alter table animal
add(readcnt number default 0);

alter table animal
add(animal_passwd number default 0);

alter table animal
add(animal_file varchar2(500));

--½æ³×ÀÏÀ» À§ÇÑ ÇÊµå
alter table animal
add(animal_thumb varchar2(500));



-- 1. Å×ÀÌºí ±¸Á¶ º¯°æ (»õ·Î¿î ÄÃ·³ Ãß°¡) --animal_temp¸¦ select ·Î º¯°æÇß½À´Ï´Ù
ALTER TABLE animal
ADD (animal_temp_new VARCHAR2(100));

-- 2. »õ·Î¿î ÄÃ·³¿¡ ±âÁ¸ µ¥ÀÌÅÍ º¹»ç
UPDATE animal
SET animal_temp_new = TO_CHAR(animal_temp);

-- 3. ±âÁ¸ ÄÃ·³ »èÁ¦
ALTER TABLE animal
DROP COLUMN animal_temp;

-- 4. »õ·Î¿î ÄÃ·³ ÀÌ¸§ º¯°æ
ALTER TABLE animal
RENAME COLUMN animal_temp_new TO animal_temp;




-- ÀÌ¹ÌÁö Å×ÀÌºíÀÇ animal_id ¿Ü·¡ Å° Á¦¾à Á¶°Ç »èÁ¦
ALTER TABLE image
DROP CONSTRAINT FK_animal_TO_image_1;

-- ÀÌ¹ÌÁö Å×ÀÌºíÀÇ adoption_id ¿Ü·¡ Å° Á¦¾à Á¶°Ç »èÁ¦
ALTER TABLE image
DROP  CONSTRAINT FK_adoption_TO_image_1;

-- »ó´ã Å×ÀÌºíÀÇ adoption_id ¿Ü·¡ Å° Á¦¾à Á¶°Ç »èÁ¦
ALTER TABLE counseling
DROP CONSTRAINT FK_adoption_TO_counseling_1;

-- ÀÔ¾ç Å×ÀÌºíÀÇ animal_id ¿Ü·¡ Å° Á¦¾à Á¶°Ç »èÁ¦
ALTER TABLE adoption
DROP CONSTRAINT FK_animal_TO_adoption_1;

ALTER TABLE survey
DROP CONSTRAINT FK_COUNSELING_TO_SURVEY_1;



--animalÀ» Áö¿ì¸é image Áö¿ì±â
ALTER TABLE image
ADD CONSTRAINT FK_animal_TO_image_1
FOREIGN KEY (animal_id)
REFERENCES adoption(animal_id)
ON DELETE CASCADE;

--adoption Áö¿ì¸é image Áö¿ì±â
ALTER TABLE image
ADD CONSTRAINT FK_adoption_TO_image_1
FOREIGN KEY (adoption_id)
REFERENCES adoption(adoption_id)
ON DELETE CASCADE;

--adoption Áö¿ì¸é counseling Áö¿ì±â
ALTER TABLE counseling
ADD CONSTRAINT FK_adoption_TO_counseling_1
FOREIGN KEY (adoption_id)
REFERENCES adoption(adoption_id)
ON DELETE CASCADE;

--animal Áö¿ì¸é adoption Áö¿ì±â 
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



--Adoption º¯°æ»çÇ×

alter table adoption
add(adoption_passwd number default 0);

alter table adoption
add(adoption_file varchar2(500));

--½æ³×ÀÏÀ» À§ÇÑ ÇÊµå
alter table adoption
add(adoption_thumb varchar2(500));



ALTER TABLE animal DROP COLUMN animal_passwd;
ALTER TABLE adoption DROP COLUMN adoption_passwd;



--img ÆÄÀÏ ¹®Á¦ ÇØ°á 
--UPDATE animal
--SET animal_file = NULL;




-- Å×ÀÌºíÀÇ ±¸Á¶ È®ÀÎ
DESCRIBE animal;
DESCRIBE adoption;
DESCRIBE image;


-- Å×ÀÌºíÀÇ ¸ğµç µ¥ÀÌÅÍ Á¶È¸

select * from animal;
select * from adoption;
select * from admin;
select * from image;






-- °³ Ãß°¡
INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '2»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ O', '5kg', '°¥»ö', 'È°¹ßÇÏ°í Ä£È­ÀûÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '¸Û¸ÛÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '1»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '6kg', 'Èò»ö', 'Àç¹ÌÀÖ´Â °³ÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '´ó´óÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '6kg', '°ËÁ¤', 'È°¹ßÇÑ °³ÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '¿ĞÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '1»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ O', '3kg', '°¥»ö', '¼øÇÑ °³ÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, 'Àá¸¸º¸');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '4kg', 'Èò»ö', 'È°¹ßÇÑ °³ÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, 'ÇÇÄ«Ãò');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '5kg', 'Èò»ö', '¾äÀüÇÑ °³ÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, 'Áøµ¹');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '3kg', 'Èò»ö', 'Àå³­ÀÌ ¸¹Àº °³ÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, 'ºÏÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '2»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ O', '4kg', 'Èò»ö', 'È°¹ßÇÑ °³ÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, 'ºêÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '5kg', 'Èò»ö', '¼øÇÑ °³ÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, 'µÎºñ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°­¾ÆÁö', '2»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ O', '6kg', 'Èò»ö', '¼øÇÑ °³ÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '¼øÀÌ');

-- °í¾çÀÌ Ãß°¡
INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '3»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ O', '4kg', '°ËÀº»ö', '¾Æ¸§´Ù¿î °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '¾çÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '2»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ X', '5kg', '°¥»ö', '¾Ö±³ ¸¹Àº °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '³É³ÉÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '1»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ X', '3kg', 'Èò»ö', 'ÀáÀÌ Àº °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '¹Â');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ X', '5kg', '°¥»ö', 'È°¹ßÇÑ °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '¹ÂÃ÷');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ X', '5kg', '°¥»ö', 'ÃàÇÏµå·Á¿ä ¼ö¼Ó¼º °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '°í¶óÆÄ´ö');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '3»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ O', '4kg', '°ËÀº»ö', '¾Æ¸§´Ù¿î °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '³×¸®');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '2»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ X', '5kg', '°¥»ö', '¾Ö±³ ¸¹Àº °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '³ë·®ÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '1»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ X', '3kg', 'Èò»ö', 'ÀáÀÌ Àº °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '±ÖÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ X', '5kg', '°¥»ö', 'È°¹ßÇÑ °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, 'È²°ÇÀû');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ X', '5kg', '°¥»ö', 'ÃàÇÏµå·Á¿ä ¼ö¼Ó¼º °í¾çÀÌÀÔ´Ï´Ù.', 'admin', '1.ÀÔ¾ç°¡´É', SYSDATE, '³ª¹«');




INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '¹«·áºĞ¾ç ÀÌº¥Æ®°¡ ½ÃÀÛµÇ¾ú½À´Ï´Ù. ¸¹Àº Âü¿© ºÎÅ¹µå¸³´Ï´Ù.', TO_DATE('2024-03-05', 'YYYY-MM-DD'), '¹«·áºĞ¾ç ÀÌº¥Æ® °øÁö', 100, 'ÁøÇàÁß', '»ó', 'admin', 11);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '´ç½ÅÀÇ µû¶æÇÑ °¡Á¤ÀÌ ÇÊ¿äÇÑ ¾ÆÀÌµéÀÌ ±â´Ù¸®°í ÀÖ½À´Ï´Ù.', TO_DATE('2024-03-04', 'YYYY-MM-DD'), '¾î¸°ÀÌ³¯ Æ¯º° ¹«·áºĞ¾ç', 75, 'ÁøÇàÁß', 'Áß', 'admin', 12);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '°í¾çÀÌ Ä£±¸µéÀÌ »õ·Î¿î °¡Á·À» Ã£°í ÀÖ¾î¿ä.', TO_DATE('2024-03-03', 'YYYY-MM-DD'), 'º½¸ÂÀÌ °í¾çÀÌ ¹«·áºĞ¾ç', 120, 'Á¾·á', 'ÇÏ', 'admin', 13);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '°Ü¿ïÃ¶ Æ¯º° ¹«·áºĞ¾ç ÀÌº¥Æ®! Âü¿©ÇÏ¼¼¿ä.', TO_DATE('2024-03-02', 'YYYY-MM-DD'), '°Ü¿ï ¹«·áºĞ¾ç', 90, 'ÁøÇàÁß', '»ó', 'admin', 14);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '»õ·Î ¹«·áºĞ¾ç¹ŞÀº Ä£±¸µéÀ» ¼Ò°³ÇÕ´Ï´Ù.', TO_DATE('2024-03-01', 'YYYY-MM-DD'), '½Å±Ô µ¿¹° ¼Ò°³', 110, 'ÁøÇàÁß', 'Áß', 'admin', 15);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, 'Æ¯º°ÇÑ ¹«·áºĞ¾ç ±âÈ¸! ³õÄ¡Áö ¸¶¼¼¿ä.', TO_DATE('2024-02-29', 'YYYY-MM-DD'), 'Æ¯º° ¹«·áºĞ¾ç ÇÁ·Î¸ğ¼Ç', 80, 'ÁøÇàÁß', 'ÇÏ', 'admin', 16);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '¹«·áºĞ¾ç ÈÄ±â ÀÌº¥Æ®°¡ ÁøÇà ÁßÀÔ´Ï´Ù.', TO_DATE('2024-02-28', 'YYYY-MM-DD'), '¹«·áºĞ¾ç ÈÄ±â ÀÛ¼º ÀÌº¥Æ®', 95, 'ÁøÇàÁß', '»ó', 'admin', 17);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, 'º½Ã¶ ¹«·áºĞ¾çÀÇ °èÀı, ´ç½ÅÀÇ Áı¿¡ µû¶æÇÑ Ä£±¸¸¦ ºÒ·¯º¸¼¼¿ä.', TO_DATE('2024-02-27', 'YYYY-MM-DD'), 'º½ ¹«·áºĞ¾ç ÀÌº¥Æ®', 110, 'Á¾·á', 'Áß', 'admin', 18);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '¾ÆÀÌµéÀ» À§ÇÑ Æ¯º° ¹«·áºĞ¾ç ÀÌº¥Æ®°¡ ÁØºñµÇ¾î ÀÖ½À´Ï´Ù.', TO_DATE('2024-02-26', 'YYYY-MM-DD'), '¹«·áºĞ¾ç ÀÌº¥Æ®', 85, 'ÁøÇàÁß', 'ÇÏ', 'admin', 19);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '´ÙÇÔ²² Áñ±â´Â ¿©¸§! ¹«·áºĞ¾ç ÀÌº¥Æ®¿¡ Âü¿©ÇÏ¼¼¿ä.', TO_DATE('2024-02-25', 'YYYY-MM-DD'), '¿©¸§ ¹«·áºĞ¾ç Ä·ÆäÀÎ', 105, 'ÁøÇàÁß', '»ó', 'admin', 20);
INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '¹«·áºĞ¾ç ÀÌº¥Æ®°¡ ½ÃÀÛµÇ¾ú½À´Ï´Ù. ¸¹Àº Âü¿© ºÎÅ¹µå¸³´Ï´Ù.', TO_DATE('2024-03-05', 'YYYY-MM-DD'), '¹«·áºĞ¾ç ÀÌº¥Æ® °øÁö', 100, 'ÁøÇàÁß', '»ó', 'admin', 21);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '´ç½ÅÀÇ µû¶æÇÑ °¡Á¤ÀÌ ÇÊ¿äÇÑ ¾ÆÀÌµéÀÌ ±â´Ù¸®°í ÀÖ½À´Ï´Ù.', TO_DATE('2024-03-04', 'YYYY-MM-DD'), '¾î¸°ÀÌ³¯ Æ¯º° ¹«·áºĞ¾ç', 75, 'ÁøÇàÁß', 'Áß', 'admin', 22);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '°í¾çÀÌ Ä£±¸µéÀÌ »õ·Î¿î °¡Á·À» Ã£°í ÀÖ¾î¿ä.', TO_DATE('2024-03-03', 'YYYY-MM-DD'), 'º½¸ÂÀÌ °í¾çÀÌ ¹«·áºĞ¾ç', 120, 'Á¾·á', 'ÇÏ', 'admin', 23);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '°Ü¿ïÃ¶ Æ¯º° ¹«·áºĞ¾ç ÀÌº¥Æ®! Âü¿©ÇÏ¼¼¿ä.', TO_DATE('2024-03-02', 'YYYY-MM-DD'), '°Ü¿ï ¹«·áºĞ¾ç', 90, 'ÁøÇàÁß', '»ó', 'admin', 24);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '»õ·Î ¹«·áºĞ¾ç¹ŞÀº Ä£±¸µéÀ» ¼Ò°³ÇÕ´Ï´Ù.', TO_DATE('2024-03-01', 'YYYY-MM-DD'), '½Å±Ô µ¿¹° ¼Ò°³', 110, 'ÁøÇàÁß', 'Áß', 'admin', 25);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, 'Æ¯º°ÇÑ ¹«·áºĞ¾ç ±âÈ¸! ³õÄ¡Áö ¸¶¼¼¿ä.', TO_DATE('2024-02-29', 'YYYY-MM-DD'), 'Æ¯º° ¹«·áºĞ¾ç ÇÁ·Î¸ğ¼Ç', 80, 'ÁøÇàÁß', 'ÇÏ', 'admin', 26);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '¹«·áºĞ¾ç ÈÄ±â ÀÌº¥Æ®°¡ ÁøÇà ÁßÀÔ´Ï´Ù.', TO_DATE('2024-02-28', 'YYYY-MM-DD'), '¹«·áºĞ¾ç ÈÄ±â ÀÛ¼º ÀÌº¥Æ®', 95, 'ÁøÇàÁß', '»ó', 'admin', 27);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, 'º½Ã¶ ¹«·áºĞ¾çÀÇ °èÀı, ´ç½ÅÀÇ Áı¿¡ µû¶æÇÑ Ä£±¸¸¦ ºÒ·¯º¸¼¼¿ä.', TO_DATE('2024-02-27', 'YYYY-MM-DD'), 'º½ ¹«·áºĞ¾ç ÀÌº¥Æ®', 110, 'Á¾·á', 'Áß', 'admin', 28);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '¾ÆÀÌµéÀ» À§ÇÑ Æ¯º° ¹«·áºĞ¾ç ÀÌº¥Æ®°¡ ÁØºñµÇ¾î ÀÖ½À´Ï´Ù.', TO_DATE('2024-02-26', 'YYYY-MM-DD'), '¹«·áºĞ¾ç ÀÌº¥Æ®', 85, 'ÁøÇàÁß', 'ÇÏ', 'admin', 29);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '´ÙÇÔ²² Áñ±â´Â ¿©¸§! ¹«·áºĞ¾ç ÀÌº¥Æ®¿¡ Âü¿©ÇÏ¼¼¿ä.', TO_DATE('2024-02-25', 'YYYY-MM-DD'), '¿©¸§ ¹«·áºĞ¾ç Ä·ÆäÀÎ', 105, 'ÁøÇàÁß', '»ó', 'admin', 30);




CREATE TABLE volunteer (
	volunteer_id	number		NOT NULL,
	volunteer_detail	varchar2(2000)		NOT NULL,
	volunteer_date	date	DEFAULT sysdate	NOT NULL,
	volunteer_title	varchar2(100)		NOT NULL,
	volunteer_time	varchar2(30)		NOT NULL,
	volunteer_due	varchar2(30)		NOT NULL,
	volunteer_limit	number		NOT NULL,
	volunteer_cost	varchar2(20)	DEFAULT '¾øÀ½'	NOT NULL,
	volunteer_location	varchar2(100)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);

-- ÆÄÀÏ¸íÀ» À§ÇÑ ÇÊµå
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

-- ºÀ»ç °ø°í
create sequence volunteer_seq
start with 1
increment by 1
nocycle
nocache;

-- ºÀ»ç ½ÅÃ»
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


insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'äôñĞ×»? ??ÛÕÜË ???!', 'ÕôÌ« øÉğÂøË ªĞ ??? äôñĞ×»? äÓ? ×»?? ???ÕÉ ??ÛÕ? ?ÖïÕÉ ??ÛÕ?
Ù¹öáÛª? ?? ?×»ÙÃ??? ÓúÏ­ñÕ? ùÜ? ??? áşì¼? ××? ???

??õµ ?? ??ÛÕ ?î½? Ôô????? (??Ù¹öáäù?? ñĞ?äù Ù¹öáÛª? Êµ ? ÛŞ ??ñÕ ?? ?÷ôóİ øÉÛå ÷úöáñÕ?!)
???×³ Ï­?? ×»?İ«ûÆ? Ôô?×» ?øÎòÚ?', 1, '2023-07-26', 'member01');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '? ı§?Ü©? ?ÖÕÊµ Ü©??äù?! / òÚÏ¨ ?Óúûß? Êç?', 'Êç? ?Î¾? ??? Î¸×» ñĞ??Ê¨, Ïİ?ûã Öğø·ñÕ? ?İ¤Êµ ×³?? äô?õ»?×» ñĞ?Êµõµ. ??×àÛŞÊ«ñÕ? ?ÜÑÕÉ Íİ?Úæ?, éäĞÖÕÉ Úæ?, ?õ»òÚûëÕÉ Úæ? ?? ??Ê«?ñÕ øĞÊµ Öï?Úæ?? ó¦ ?ñÕ? ×àÛŞøĞ 6Öï ?ûãÕÉ ?Ğù? ??Îı Êµõµ.

?×«Öğ¡¤???¡¤øâï·ø·?ÖğËÔ ù÷??ÕÉ Ş¬İ¤? ?ÜÑøË? ??Êµõµ. ?ÍëÍİ?? ?Íë?İ¤ÕÉ Õô??øË ğÂø²?? Õ§?Êµõµ. ?øËÎ³ íÍÚåú¬?? åï?? ??×» ù÷ûëÏ­? ÕÉÚæÔô×» ?Êµ ?ñÕ? ?ù¼? ?íÍñÕ? ù÷ûëÏ­? ÕÉÚæ? ??×» õµ?ÕÉ Ì«××? ÍİÊµ ÷úı§? ?ô®? ù÷ûëñÕ ×ı?? ??ó¦ ? ?õµ.

ğÂø²?? Õô3?øâ Õô4?ÕÉ ??ÜË ×»Ú¶?? Û¨Ğï??Îı Êµõµ. Û¨Íë?ÕÉ ÊÅùìøâ ?Ù¹×× ×ğ?Ğù? ?ÜÑ? ??? Î¯ñÕ ÕÉ?? ?×ØÔõõµ. ?íÍ? ÕÉ×Ø 1Öïøâ ù¼ÕÉ×Ø 2Öï? ĞáØóÊµõµ.

ğÂø²?¡¤?Íë?İ¤¡¤?ÍëÍİ?¡¤??ä¹ù¼ÕÉ ×Ø¡¤??×àÛŞÊ« ×àÛŞøĞ¡¤?øĞ¡¤×ğËÜĞá÷ôøĞİ¤Íİ?íÍ Íİ?¡¤???×Ø¡¤??Íİ? ø·? ?ÜÑ? ?Êµ Û¨Íë?? øÉ ×µÍë??ñÕ ??? ???óİ ?ÜÑ? ÍİĞ©Êµ ?ñÕ? ?íÍ? éäĞÖÕÉ Ê«ØùÜË ÕÉÚæó¦ ? ?õµ.

?ÛÎ? Öï?Ôô×» ñĞ??Ê¨, ?ÛÎËÔ ?Ù¹? ùìİ¤Ôõõµ. ğÂø²?? İïÍİÔô÷ôóİ ??øË Öï?? ×µÍëÜË ??ó¦ ? ?? ?ñÕ? ?Íë?İ¤, ?ÜÑ? ?Êµ ?ÍëÍİ?ÕÉ ??øË øÉ Ş¬Êµ? ğÂ?Êµõµ.

ğÂø²?? õ©Õ§ñÕ Öµ??? õµ?ÕÉ Ğá?ÜË Êµõµ. Êç? ?Î¾? ÊÅÚ¶ÕÉ Öğ?ÜË ?×³õµ. ô¾??×» ?ÜÑñÕ ÕÉ?×» ñĞ???? Ú¶Ğï¡¤?Ê¥¡¤Ï¬?¡¤?? ?? ??? Î¸×» ñĞ??Ê¨, ?ÜÑøâ ××?Êµ ÖÇ?ñÕ ÕÉ?×» ñĞ???? ??¡¤?Ï­?ùì ?? äôÕô??? Î¸×» ñĞ?Êµõµ.', 2, '2023-05-26', 'member02');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '??ÕÉ ? óİ? ??ÜË ÍİòÚ ??òÚ ×ùĞü?.', 'ğÂø²?? ?ÜÑ? ??? Î¯ñÕ ÕÉ?? ?×Ø ø·?ÕÉ Ë¬?? ??Êµõµ. ??åï?? ?íÍ×à××ÕÉ? øâ?? ?? ğÂø²?ÕÉ ?ÕÉøË ÕôÏ­Ôõõµ. ğÂ??×Ø? ?íÍÕÉ ÓúÕÉÜË ÏŞ? ğÂø²?? Õ§?Êµõµ.

ğÂø²?? Õ§?íÍÕÉ ?íÍÜË ??ó¦ ?ñÕ? ø·äïøâ ?íÍ??ÕÉ ??ÜË ????Îı Êµõµ. ???Û¨Öğ¡¤ûã?ÛÌ÷ú Î² ?Ì°ÛÌ÷úÕÉ ???? ?ÜÑ? ??? Î¯ñÕ ÕÉ?? öáĞá××?øË ?øËÕÉ ø·íÍÜË ù¼?Î¸?õµ.

?ù¼? ù÷ûëñÕ ùŞ÷ú? ?ó¦ ??? ?? ?ñÕ? Øù?÷ú?ù÷ûëÏ­? Ñ·Ğù?? ?íÍñÕ ÕôØóó¦ ? ?õµ. ?íÍÕÉ?ÕÉ ?? ?ÜÑøË ??Ôô, 200Öï ?ûã?øË Êµõµ.

ğÂø²?ÕÉ Õ§ø·? İ«?Ôô? ?ñÕ? Õ§ø·İ«? 70ÖÕ ?×» 40ÖÕ?ñÕ ?Õ§ÖğÜË Ğá÷ôÊµõµ. Êç? ?Î¾? ÊÅÊ¥Êµ ×àÛŞ? Î¸? Ş¬İ¤ÜË ?×³õµ. Ïİ???Öï? ûãõ»Êµ ??? ?? Êµ ×»Ú¶?? Û¨åï×àÛŞ? Î¸? Ş¬İ¤ÜË ?×³õµ.

ğÂø²?? ?ÜÑÏ­ÕÉ ÖÕù¼ñÕ ğÂ?? ?? ?ÜÑÏ­? ???? ×àÕÉÜË ??ó¦ ? ?õµ. ?øĞ? ??øâ ?ÜÑñÕ ÕÉ?? øÉ ??ñÕ ïÊäù Óï??? ?ÛŞÊµõµ. Ë÷Ïëø²ÖÕ?ØìÕÉ ??ñÕ øĞÊµ ğÂø²?ÕÉ Öğ?ñÕ ??ø· Íİ?? Î¾×ùË÷Ïëø²ÖÕÖğ?íÍÕÉÜË îŞ ? ?õµ.

ô¾??×» Ú¶Ğï ?? ?Ê¥ÕÉ ??ËÔ ùŞ?ÖïÕÉ ??? Î¸? Ş¬İ¤? ??? ?×»Î¸×» ñĞ???? Ú¶Ğï ?? ?Ê¥? õ»?×» ñĞ?Êµõµ. Ú¶Ğï ?? ?Ê¥? õ»Êµ ÖğÕÉ ??îü ?ÜÑ? ??? ÖğñÕ?? øÉ ??ËÔ ÖÕ?¡¤×ØÊ«? ×»Ú¶?? ø²×»Ôô?Îı Êµõµ.', 3, '2023-08-11', 'member03');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '?? ?? ??×Ø ??Úè ?Òù?, ?? ?÷ù??.', '?ÛÕËÔ Öğ?? ??ÕÉ ??ÜË Î¸?Ê¨, ??? øÉ ?Ïİ?? åï?øâ ??? Íİ?? ??Êµ ÚåÏÙ? ??Êµõµ. ?íÍ? Ğá?Ğï?, ?ÛÌÕÉ Ï¨?ñÕÕÉ ?Úè ?? Ï¨?ÛÌğÂÕÉ ğÂÊµÎ¾? Ë¬?Ï­ñÕ?ÕÉ ×ùøëñÕ ğÂÊµ ÓúÕÉŞ¬? ?×³õµ.

?ù¼? íÍÚåú¬?Üõõµ ù÷ûëÏ­? Ñ·Ğù?? íÍÚåú¬? åï? 90ÖÕ??×» ?íÍñÕ ÕôØó??, ?íÍ? íÍÚåú¬? åï? 30ÖÕ??×» ?ÜË ÕÉÚæ??Îı Êµõµ. Õô2?øâ Õô3?ÕÉ ?ùìñÕ ğÂ??? ??ñÕ ÕôÊ«ó¦ ? ?õµ.

??×àÛŞÊ«? ?ÜÑñÕ ?ØïÔô×» ñĞ??? ?ÍİÏ­ñÕ? ?ÛŞñÕ øĞÊµ ÖÇ?, ?ù¼??øâ ?Íë?İ¤ñÕ øĞÊµ ??? Õô?ó¦ ? ?õµ. ?íÍÕÉ?? ?ÜÑ? ??? ×µ? ?ó¦ ? ?õµ.

ú¬Ê«ÖğÕÉ ?øË? ø÷ùâÊµ ??ÜË Î¸?õµ. ?õ»ÕÉ Ğã?? Öğ??Ê¨, ùÒ??õ»Õô? ?×ØÔõõµ. ğÂÊµÎ¾?ÕÉ ?Î¾? Ôô? ??? ?ÜÑøË ?Êµõµ. Êç? ?Î¾? ø²ÊÅÕÉ ı§?? ØªòÚÎ¸×» ñĞ?Êµõµ.

? ???? õ»?ÕÉ ğÂ??×Øøâ ğÂ??ÛŞ?? ñĞ? ?øĞ? Õô1? ??ÕÉ ??ñÕ ???? ? ??ñÕ ÕÉ?? Õ§?Ôõ ÷é?øË ?õµ. Õô2?ÕÉ ×àÛŞøĞ×ğ 3Öï? ?íÍñÕ? ĞáØó?? ÖğÜË, 3Öï? ğÂ??×Ø? ×»??? ÖğÜË Õ§?Êµõµ.

ÕÉ?? Õô??Ûª? ?íÍ×à××ÕÉ? 3ùìÕÉ 2 ?ûãÕÉ ?Ğù? ??Îı Êµõµ. Ïİ??ÕÉÖğ ?? Ïİ???Öï?øË? ?øÎÔôĞ¶? Öğ? ?ÜÑ? ??? ?ø·Ê«?ùì? Î¸÷ôóİ ÍëÖõÛŞÚæ? Î¸? ?ñÕ? ?ÜÑ? ??? Î¯ñÕ ÕÉ?? ??ñÕ ?õ»Êµ ?ûã? ??ó¦ ? ?õµ.', 4, '2023-02-03', 'member04');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '?? 9åï?İ«..! Õ§???ñÕ ÓúØºòÚ×ùĞü?!', '?ÍëíÍÕÉ? ?ù¼ÕÉ Ş¬ÊµñÕ Ê¥?? ×ğ?Êµ ?Øì? ?ÕÉÊµõµ. ?íÍ? ÕÉ?ÕÉ ÖğÛÈ? ???Ê¨, ÕÉ?? ×ÌÚåó¦ ? ?õµ. Êç? ?Î¾? Öïäï?øË?ÕÉ ÕÛ?øâ ?Ù¹ÜË ?×»Ê¨, ?ùÒ? Øù?ó¦ Ş¬İ¤ÜË ?×³õµ. ??? åïÖï? ?×»? ??ØªÕÉ ø·?×× ÖïŞ¬? Ì³Öï?? ?ÜË ?×Øó¦ ÕÉÍëÜË ×³õµ.

Ğá÷ôËÔ ?Î¾Üé?ÕÉ Û¨?Êµ øĞİ¤ Î² ?õ»ñÕ øĞÊµ ?ÍëÜË ?İ¤?ø· Íİ?? Ğá÷ôøĞİ¤Íİ?íÍÜË ?õµ. ğÂø²?? ?ÜÑ? ??? Î¯ñÕ ÕÉ?? ?×Ø ø·?ÕÉ Ë¬?? ??Êµõµ.

ğÂø²?? ???õµ? Öï?ó¦ ?ñÕ? Ï¨ÛÎ¡¤??¡¤ø²ÖÕ ø·? ??Ï­ÍİñÕ øĞÊµ ×ğ??Øì? ?Î¾Üé?ñÕ ?ÖÕ ? ?õµ. Êç? ?Î¾? ?ÛÎÕÉ Öğ?ÜË ?×³õµ. ??? ×»?äïÕÉ ?Ïİ?? ??? Íİ?? ×»?÷úÕôÜË ?Ğùó¦ ÕÉÍëÜË ×³õµ.

ğÂø²?? ?ÜÑ? ??? Î¯ñÕ ÕÉ?? ??¡¤?Ïİ ?? ùÒŞ¬? ?ó¦ ? ?õµ. ??¡¤?? ?? ?ùì? ???óİ ?ÜÑñÕ Íİ?Ôô? ?ù¼? ×àÛŞÕÉ ?Õô? Ôõ ÷úöáñÕ? ğÂ??? ?ÜË ??××?øË ??ó¦ Ş¬Êµ? ?×³õµ.

??×àÛŞÊ«ñÕ? ?ÜÑÕÉ Íİ?Úæ?, éäĞÖÕÉ Úæ?, ?õ»òÚûëÕÉ Úæ? ?? ??Ê«?ñÕ øĞÊµ Öï?Úæ?? ó¦ ?ñÕ? ×àÛŞøĞ 6Öï ?ûãÕÉ ?Ğù? ??Îı Êµõµ. ğÂÊµÎ¾?ÕÉ ÷úÕô??? åïÖïøâ ø·?ÕÉ ÷úÕôûãÕÉ Öğ?ËÔ ØÓÕÉÜË ÕÛ×ğ?? ø·??øË Êµõµ.

Êç? ?Î¾? ??? Î¸×» ñĞ??Ê¨, Ïİ?ûã Öğø·ñÕ? ?İ¤Êµ ×³?? äô?õ»?×» ñĞ?Êµõµ. ??? ?íÍ?×Ø¡¤?íÍùÒ×»ÕÉ ?×³ñÕ ??ó¦ ÕÉÍëÜË ×³õµ. Û¨Û¨??ñÕ ÕÉÊµ ×àûëŞ¬ÕÉ ??¡¤?? ?? ÕôÊµ Î² øÉñÕ ğÂÊµ ?ûã? ?ÜÑøË? ?Ôô, ?õ»Êµ ?ûã? ×»ø½??Îı Êµõµ.', 5, '2023-03-08', 'member05');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '4? ?ø· ûß?øË ?ÚÛó¦ "? óİ? ûß??"? Êç???õµ!', 'ñĞ??İ¤ ???? ù÷øÉİ¤óİ ñĞ??İ¤ ????õµ Ë¯?? øÉ?? ùâ? ??ùê Øì? ?öáı§ ???? óİ? õµ? ñĞ? ùâ? ù÷øÉİ¤óİ ?Í».

óİ? ñĞ? ùâûİ ñĞ? Ê«? í·îñ ?ÜØ? ñĞ??İ¤ ?ÜØ? ?øâ ????õµ ????õµ Øì? ??ùê ñĞ? óİı§? Û¶õµ? ?? Í³İ¤? í·îñ Î¯óİóİ Ê«? ???? í·îñ ??åï ????õµ ????õµ ????õµ øÉ?? ?Ê¯ô¾İ¤ ?öáùâ ùâûİ ûëï¤Üİ ?øâ ?ÜØ? Û¶õµ? öáİ¤? í·îñ ?Í» Û¶õµ? ?? øËÎ³ øËÎ³ ?? óİı§? ?ÜØ? ????õµ ñĞ??İ¤ ?öáı§ Î¯ëÚóú.

Ï­âı ûëï¤Üİ ?ÜØ? ûëï¤Üİ Ê«?Ê«? Ë¯?? Ê«? Øì? Î¯óİóİ óİ? ?öáı§ ??øĞ ûëï¤Üİ õµ? øÉ?? ?Ê¯òÚ Î¯ëÚóú ?Ë·Úñ Øì? ?Ê¯ô¾İ¤ øËÎ³ ñĞ? Î¯ëÚóú ?Í» Î¯óİóİ ñĞİ¤ñĞ ?ÜØ? õµ? ????õµ Û¶õµ?.

õËÚü ??ùê ?øâ ñĞİ¤ñĞ õµ? ñĞ? ñĞ??İ¤ Í³üâõµ Ë¯?? õµ? õµ? Î¯óİóİ ñĞ? ùâ? Í³İ¤? ?Ê¯ô¾İ¤ Ë¯?? ????õµ ??øĞ ûëï¤Üİ Û¶õµ? ı§óİİ¤ øÉ?? ı§óİİ¤ ??ùê ñĞ??İ¤ öáİ¤? ???? ?öáı§ ù÷øÉİ¤óİ øÉ?? ?? óİ? ?Ê¯ô¾İ¤ ùâ? õµ? Ï­âı Ê«?Ê«? Û¶õµ? Î¯ëÚóú Ğï? ????õµ ??øĞ ı§óİİ¤ í·îñ ?öáı§ ?? Øì? ı§óİİ¤ ù÷øÉİ¤óİ.

ù÷øÉİ¤óİ ñĞ? ?Ê¯ô¾İ¤ ñĞİ¤ñĞ í·îñ ??øĞ õËÚü õµ? Û¶õµ? ???? øËÎ³ ?Ë·Úñ õµ? óİı§? øÉ?? ????õµ ?Ë·Úñ ??ùê ñĞİ¤ñĞ ?ÜØ? Ï­âı ?Ë·Úñ ñĞİ¤ñĞ õËÚü ?Ë·Úñ ûëï¤Üİ ñĞ??İ¤ ?öáùâ ?Ê¯òÚ ùâûİ ?öáı§ øÉ?? Ë¯?? ñĞİ¤ñĞ ?Ë·Úñ ???? ñĞ??İ¤ Û¶õµ? Í³üâõµ Î¯ëÚóú.', 6, '2022-11-03', 'member06');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '??????×Ø ??Úè "äùÎ³?"? ùâ? ÔôĞ¶íÄ?õµ.', 'øËÎ³ ù÷øÉİ¤óİ ?Ê¯ô¾İ¤ øËÎ³ ?ÜØ? ùâûİ ??ùê ñĞ??İ¤ í·îñ Î¯ëÚóú ?? ñĞ? ?øâ ?öáı§ óİ? Ê«?Ê«? í·îñ ?Ë·Úñ ?? í·îñ ?öáı§ ?Ê¯òÚ ñĞ??İ¤ Î¯óİóİ ?ÜØ? ùâûİ ?ÜØ? ?öáùâ óİ? ûëï¤Üİ ????õµ í·îñ ñĞİ¤ñĞ ?øâ ı§óİİ¤ Ï­âı ?Ê¯ô¾İ¤ Ê«? ùâ? ùâûİ Û¶õµ? ?? ñĞ??İ¤ ??åï ı§óİİ¤ ?öáı§ øÉ?? ?Í» ù÷øÉİ¤óİ øÉ??.

??øĞ Ê«? Øì? ùâ? óİı§? ?öáı§ ????õµ ñĞİ¤ñĞ øÉ?? Í³üâõµ øËÎ³ Øì? ?ÜØ? ?øâ ???? Î¯óİóİ óİı§? Î¯óİóİ ñĞ?äù ùâûİ ñĞİ¤ñĞ Û¶õµ? ûëï¤Üİ óİ? ??åï ?öáùâ ?Í» Ï­âı óİ? ?öáùâ ????õµ ùâûİ Î¯óİóİ ??åï ñĞ??İ¤ øÉ?? Ï­âı ñĞİ¤ñĞ ı§óİİ¤ ?Ê¯òÚ õËÚü Ğï? ?Í» ????õµ ñĞ??İ¤ ?Ê¯ô¾İ¤ Øì? Û¶õµ? ?ÜØ? ??åï.

Øì? ùâûİ øËÎ³ Î¯óİóİ ?Ë·Úñ ?Ê¯ô¾İ¤ ı§óİİ¤ Ê«? ùâûİ óİ? Í³İ¤? ù÷øÉİ¤óİ Í³üâõµ ûëï¤Üİ Û¶õµ? ùâûİ ùâ? ?öáı§ Î¯ëÚóú ñĞ? Ï­âı øÉ?? ????õµ ???? ?Ë·Úñ ?øâ øËÎ³ ????õµ ??åï óİı§? óİı§? ?? õµ? ?Ë·Úñ ?Ë·Úñ Î¯ëÚóú Í³İ¤? ñĞ? ñĞ?äù Û¶õµ? ñĞ?äù ?öáùâ øËÎ³ óİı§? ???? ?öáı§ ùâ? Í³üâõµ ñĞ??İ¤ Í³İ¤?.

?öáı§ Ê«? ????õµ ?ÜØ? Î¯óİóİ öáİ¤? öáİ¤? ??åï ?ÜØ? öáİ¤? ?öáı§ ?Ê¯òÚ ????õµ ùâ? Ë¯?? ?Ë·Úñ ñĞ??İ¤ ?Í» ???? ?øâ ?Í» øÉ?? Øì? ?Ë·Úñ Î¯óİóİ Í³İ¤? ùâûİ ?Ê¯ô¾İ¤ ùâûİ ñĞİ¤ñĞ Ï­âı ??åï Í³İ¤? ????õµ ûëï¤Üİ ?? õËÚü Î¯óİóİ Î¯ëÚóú ?Ê¯ô¾İ¤ ?öáı§ ?öáı§ Ë¯?? ??åï öáİ¤? ???? ?öáı§ õËÚü ùâûİ øÉ??.', 7, '2023-03-11', 'member07');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '?????×ØñÕ? ??Ôõ "???"? ??? ø·õµ??õµ', '?øâ óİı§? Ê«? óİı§? ?? ??øĞ ñĞ?äù ùâ? ??åï ù÷øÉİ¤óİ Øì? Í³İ¤? ??øĞ í·îñ Û¶õµ? ñĞİ¤ñĞ ûëï¤Üİ õËÚü ?Ë·Úñ ????õµ óİı§? ñĞ??İ¤ Û¶õµ? ????õµ ?Ë·Úñ Û¶õµ? Í³üâõµ öáİ¤? Ê«? Ï­âı õµ? Øì? Î¯óİóİ ?øâ öáİ¤? Í³üâõµ ?öáùâ Í³İ¤? ı§óİİ¤ ????õµ Î¯ëÚóú ??åï ñĞİ¤ñĞ óİ? ûëï¤Üİ ???? ?öáùâ ????õµ õËÚü óİı§?.

??åï ?Ê¯òÚ ñĞİ¤ñĞ Î¯ëÚóú ù÷øÉİ¤óİ Ë¯?? ûëï¤Üİ õµ? Î¯ëÚóú Î¯ëÚóú õËÚü ?? í·îñ Ê«?Ê«? ùâ? Ë¯?? ?öáùâ í·îñ õµ? ùâûİ øÉ?? ?öáùâ ?Ê¯òÚ Ï­âı ùâ? øËÎ³ õËÚü Ï­âı ?Ë·Úñ Î¯ëÚóú Ï­âı óİ? ??ùê ??ùê ?öáùâ õËÚü Í³üâõµ Ğï? Í³üâõµ ı§óİİ¤ ñĞİ¤ñĞ Í³üâõµ ?Ë·Úñ ?ÜØ? ?ÜØ? ñĞ??İ¤ óİı§? Í³üâõµ ?öáı§ ù÷øÉİ¤óİ.

øËÎ³ Î¯óİóİ ù÷øÉİ¤óİ ñĞİ¤ñĞ ùâ? Øì? óİ? öáİ¤? Î¯óİóİ óİı§? öáİ¤? ?ÜØ? ????õµ Øì? í·îñ ?Í» Ğï? ùâ? ñĞ??İ¤ óİ? õµ? Î¯ëÚóú ù÷øÉİ¤óİ ñĞİ¤ñĞ ?öáùâ ????õµ Ë¯?? ?Ê¯ô¾İ¤ ?? ñĞİ¤ñĞ ?öáı§ Ê«?Ê«? Øì? Î¯óİóİ øËÎ³ ?Í» øÉ?? øÉ?? Í³İ¤? Ê«? Ê«? øÉ?? Ê«? ????õµ Ê«?Ê«? Ê«? ñĞ?äù ?Ê¯ô¾İ¤ ı§óİİ¤ ûëï¤Üİ.

?öáı§ ?öáı§ ?öáı§ Î¯ëÚóú õËÚü Øì? ??øĞ ????õµ ??åï ñĞ?äù ?öáı§ ñĞ?äù õµ? öáİ¤? Ï­âı Î¯ëÚóú ??øĞ öáİ¤? ı§óİİ¤ õµ? ???? ??åï ?Ê¯ô¾İ¤ Û¶õµ? ù÷øÉİ¤óİ øËÎ³ ????õµ ?Ë·Úñ ?Í» ?öáı§ öáİ¤? øÉ?? ?Ê¯ô¾İ¤ ??ùê øËÎ³ øÉ?? ????õµ í·îñ öáİ¤? Û¶õµ? ùâ? ?öáùâ øÉ?? ???? ùâ? Î¯óİóİ ?Í» ?öáı§ ?Ë·Úñ ?Ê¯òÚ.', 8, '2023-04-12', 'member08');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Ë÷éä?ËÔ ?Óú?? Î¯?ñÕ ğÂÖğøË ü¸? ??', 'ñĞ? ı§óİİ¤ ûëï¤Üİ õµ? ???? ????õµ Ğï? Ï­âı ?Ë·Úñ ùâûİ Í³üâõµ öáİ¤? Ê«?Ê«? ùâ? ?øâ ????õµ Û¶õµ? Ë¯?? öáİ¤? ùâûİ Ğï? ùâ? ù÷øÉİ¤óİ ?Ê¯òÚ ûëï¤Üİ ?? Ê«? ı§óİİ¤ ?Ë·Úñ Ï­âı ùâûİ Ê«? ????õµ Í³üâõµ Ê«? Ğï? ñĞ??İ¤ óİ? ñĞ?äù ??ùê ñĞ? Í³İ¤? Ï­âı Í³İ¤? ?? ?? ñĞ??İ¤ ?? ?ÜØ? Øì?.

Ê«? ?ÜØ? ?Ê¯òÚ ñĞİ¤ñĞ ????õµ í·îñ óİ? Ğï? Ê«?Ê«? Î¯ëÚóú Øì? ?øâ öáİ¤? Í³İ¤? ?ÜØ? ùâ? Ğï? Ë¯?? õµ? Û¶õµ? óİ? ?Ê¯ô¾İ¤ Ğï? ñĞ??İ¤ ñĞ?äù Ê«? Øì? Í³üâõµ ?Ê¯òÚ ?Í» Ê«? ı§óİİ¤ ????õµ ???? óİ? öáİ¤? ?Ê¯ô¾İ¤ óİı§? ?Í» õµ? ñĞ?äù ñĞİ¤ñĞ ñĞ??İ¤ Í³üâõµ øÉ?? ı§óİİ¤ ?Ê¯òÚ ı§óİİ¤ Ë¯?? ?ÜØ?.

Ë¯?? ı§óİİ¤ ?Ê¯ô¾İ¤ ?? ??ùê Øì? Î¯ëÚóú öáİ¤? Ï­âı ?Ê¯ô¾İ¤ õËÚü Ë¯?? ?Ê¯òÚ ?öáı§ ?Ë·Úñ ???? ?Ê¯ô¾İ¤ øËÎ³ Î¯óİóİ ñĞ??İ¤ ??øĞ í·îñ ?øâ ûëï¤Üİ Ï­âı óİı§? ?Ë·Úñ öáİ¤? ?Ê¯òÚ Ï­âı öáİ¤? ?ÜØ? ?Í» Ë¯?? ?öáı§ ùâûİ ı§óİİ¤ óİ? ?Ê¯ô¾İ¤ Ê«?Ê«? ?ÜØ? ??øĞ ??åï ùâûİ Ê«?Ê«? ??åï øËÎ³ ñĞİ¤ñĞ Î¯ëÚóú ????õµ.

ñĞ??İ¤ ?Ê¯ô¾İ¤ Û¶õµ? ùâûİ ?Ê¯ô¾İ¤ ?? ?öáùâ ?? ????õµ ùâûİ Ë¯?? ??åï óİı§? õËÚü ı§óİİ¤ ñĞ?äù Ë¯?? Øì? Û¶õµ? øËÎ³ Î¯ëÚóú ????õµ ??ùê ûëï¤Üİ Ğï? ?? Î¯óİóİ Í³üâõµ ?Ê¯òÚ óİı§? ñĞİ¤ñĞ ?Ë·Úñ Í³İ¤? ñĞ? ûëï¤Üİ ????õµ Û¶õµ? ?Ë·Úñ Øì? ñĞ?äù ????õµ ñĞ?äù ?øâ ñĞİ¤ñĞ ?Í» õËÚü ??øĞ Ğï? ?Ê¯òÚ ù÷øÉİ¤óİ.', 9, '2023-08-29', 'member09');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'ÕôÖğİ¤??? ?ù¼Ê×? ?? ??×Ø ??ÚèÕÉ ? ûëØì Ê«?!', '??øĞ ?ÜØ? ?öáı§ í·îñ õËÚü øËÎ³ ????õµ õµ? óİ? ?Í» ??åï ?ÜØ? Øì? õµ? Í³üâõµ Î¯ëÚóú ?øâ ?öáùâ ??øĞ ?øâ ?öáı§ Ë¯?? ??åï ñĞ? ı§óİİ¤ ùâûİ ????õµ ùâ? Î¯ëÚóú Ê«?Ê«? Í³üâõµ ñĞİ¤ñĞ ñĞ?äù Í³İ¤? õµ? ????õµ ñĞ? ?ÜØ? õµ? õµ? õËÚü õËÚü ??åï ????õµ ?Ê¯òÚ Ê«? ùâûİ õËÚü ????õµ ?öáı§.

ñĞ?äù Û¶õµ? óİ? ı§óİİ¤ óİı§? Ë¯?? Í³İ¤? Î¯óİóİ ?Ê¯ô¾İ¤ Û¶õµ? ??åï ùâûİ Ğï? ñĞ??İ¤ ?Ê¯ô¾İ¤ Î¯óİóİ óİı§? óİı§? Ğï? ?ÜØ? õµ? ñĞ? ûëï¤Üİ í·îñ ?öáùâ ñĞ??İ¤ Í³üâõµ Ï­âı ù÷øÉİ¤óİ ????õµ ?öáùâ Î¯ëÚóú ?øâ ùâ? øÉ?? ûëï¤Üİ Ê«? Ê«? ?öáùâ ?? ùâ? ??øĞ øÉ?? õµ? ?ÜØ? ?øâ Ë¯?? í·îñ ûëï¤Üİ öáİ¤?.

????õµ ?ÜØ? ñĞ? Ê«? ùâûİ ?Í» óİı§? ı§óİİ¤ Û¶õµ? ñĞİ¤ñĞ Ï­âı ûëï¤Üİ ?öáùâ ?Í» ?öáùâ ?Ë·Úñ ñĞ? öáİ¤? ?Ë·Úñ øËÎ³ øÉ?? õËÚü õµ? øÉ?? ????õµ Ğï? ?Ê¯òÚ ?öáùâ Ê«?Ê«? ?öáùâ Ï­âı ñĞİ¤ñĞ ı§óİİ¤ Ê«?Ê«? Î¯óİóİ í·îñ Í³İ¤? ?Ë·Úñ ?ÜØ? ñĞ??İ¤ ?Ê¯òÚ Î¯ëÚóú ñĞ? øÉ?? óİı§? ?Ê¯ô¾İ¤ Û¶õµ? ?Ê¯ô¾İ¤ ??åï ñĞ?.

??åï Ê«?Ê«? ??ùê ñĞ??İ¤ Ê«? ûëï¤Üİ Í³üâõµ Î¯óİóİ ı§óİİ¤ ?? ????õµ ?Ê¯òÚ Ğï? Î¯ëÚóú óİ? ùâ? í·îñ ??ùê õµ? ?öáı§ ??øĞ ????õµ ı§óİİ¤ Û¶õµ? ?Ê¯òÚ Ï­âı í·îñ ?? ?Í» øËÎ³ ?Ê¯ô¾İ¤ öáİ¤? ??åï óİı§? óİ? ñĞİ¤ñĞ Î¯ëÚóú ????õµ ????õµ õËÚü Ê«?Ê«? ñĞ?äù øÉ?? Í³üâõµ õµ? ùâûİ ???? ?öáùâ ?øâ õµ?.', 10, '2023-08-28', 'member10');

insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, '? ÜÙ? ×à??? 5Ù¸ äïÛŞñÕ? ûè? Ôõ ?ú¬', '??øĞ ?ÜØ? ?öáı§ í·îñ õËÚü øËÎ³ ????õµ õµ? óİ? ?Í» ??åï ?ÜØ? Øì? õµ? Í³üâõµ Î¯ëÚóú ?øâ ?öáùâ ??øĞ ?øâ ?öáı§ Ë¯?? ??åï ñĞ? ı§óİİ¤ ùâûİ ????õµ ùâ? Î¯ëÚóú Ê«?Ê«? Í³üâõµ ñĞİ¤ñĞ ñĞ?äù Í³İ¤? õµ? ????õµ ñĞ? ?ÜØ? õµ? õµ? õËÚü õËÚü ??åï ????õµ ?Ê¯òÚ Ê«? ùâûİ õËÚü ????õµ ?öáı§.

ñĞ?äù Û¶õµ? óİ? ı§óİİ¤ óİı§? Ë¯?? Í³İ¤? Î¯óİóİ ?Ê¯ô¾İ¤ Û¶õµ? ??åï ùâûİ Ğï? ñĞ??İ¤ ?Ê¯ô¾İ¤ Î¯óİóİ óİı§? óİı§? Ğï? ?ÜØ? õµ? ñĞ? ûëï¤Üİ í·îñ ?öáùâ ñĞ??İ¤ Í³üâõµ Ï­âı ù÷øÉİ¤óİ ????õµ ?öáùâ Î¯ëÚóú ?øâ ùâ? øÉ?? ûëï¤Üİ Ê«? Ê«? ?öáùâ ?? ùâ? ??øĞ øÉ?? õµ? ?ÜØ? ?øâ Ë¯?? í·îñ ûëï¤Üİ öáİ¤?.

????õµ ?ÜØ? ñĞ? Ê«? ùâûİ ?Í» óİı§? ı§óİİ¤ Û¶õµ? ñĞİ¤ñĞ Ï­âı ûëï¤Üİ ?öáùâ ?Í» ?öáùâ ?Ë·Úñ ñĞ? öáİ¤? ?Ë·Úñ øËÎ³ øÉ?? õËÚü õµ? øÉ?? ????õµ Ğï? ?Ê¯òÚ ?öáùâ Ê«?Ê«? ?öáùâ Ï­âı ñĞİ¤ñĞ ı§óİİ¤ Ê«?Ê«? Î¯óİóİ í·îñ Í³İ¤? ?Ë·Úñ ?ÜØ? ñĞ??İ¤ ?Ê¯òÚ Î¯ëÚóú ñĞ? øÉ?? óİı§? ?Ê¯ô¾İ¤ Û¶õµ? ?Ê¯ô¾İ¤ ??åï ñĞ?.

??åï Ê«?Ê«? ??ùê ñĞ??İ¤ Ê«? ûëï¤Üİ Í³üâõµ Î¯óİóİ ı§óİİ¤ ?? ????õµ ?Ê¯òÚ Ğï? Î¯ëÚóú óİ? ùâ? í·îñ ??ùê õµ? ?öáı§ ??øĞ ????õµ ı§óİİ¤ Û¶õµ? ?Ê¯òÚ Ï­âı í·îñ ?? ?Í» øËÎ³ ?Ê¯ô¾İ¤ öáİ¤? ??åï óİı§? óİ? ñĞİ¤ñĞ Î¯ëÚóú ????õµ ????õµ õËÚü Ê«?Ê«? ñĞ?äù øÉ?? Í³üâõµ õµ? ùâûİ ???? ?öáùâ ?øâ õµ?.', 10, '2023-08-28', 'member10');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Ê¯ÌùÚñ ??äï! ×µ×³?í¶ ÛÕ??ËÔ ÏÑÖÇÊµ Ò¦?', '??øĞ ?ÜØ? ?öáı§ í·îñ õËÚü øËÎ³ ????õµ õµ? óİ? ?Í» ??åï ?ÜØ? Øì? õµ? Í³üâõµ Î¯ëÚóú ?øâ ?öáùâ ??øĞ ?øâ ?öáı§ Ë¯?? ??åï ñĞ? ı§óİİ¤ ùâûİ ????õµ ùâ? Î¯ëÚóú Ê«?Ê«? Í³üâõµ ñĞİ¤ñĞ ñĞ?äù Í³İ¤? õµ? ????õµ ñĞ? ?ÜØ? õµ? õµ? õËÚü õËÚü ??åï ????õµ ?Ê¯òÚ Ê«? ùâûİ õËÚü ????õµ ?öáı§.

ñĞ?äù Û¶õµ? óİ? ı§óİİ¤ óİı§? Ë¯?? Í³İ¤? Î¯óİóİ ?Ê¯ô¾İ¤ Û¶õµ? ??åï ùâûİ Ğï? ñĞ??İ¤ ?Ê¯ô¾İ¤ Î¯óİóİ óİı§? óİı§? Ğï? ?ÜØ? õµ? ñĞ? ûëï¤Üİ í·îñ ?öáùâ ñĞ??İ¤ Í³üâõµ Ï­âı ù÷øÉİ¤óİ ????õµ ?öáùâ Î¯ëÚóú ?øâ ùâ? øÉ?? ûëï¤Üİ Ê«? Ê«? ?öáùâ ?? ùâ? ??øĞ øÉ?? õµ? ?ÜØ? ?øâ Ë¯?? í·îñ ûëï¤Üİ öáİ¤?.

????õµ ?ÜØ? ñĞ? Ê«? ùâûİ ?Í» óİı§? ı§óİİ¤ Û¶õµ? ñĞİ¤ñĞ Ï­âı ûëï¤Üİ ?öáùâ ?Í» ?öáùâ ?Ë·Úñ ñĞ? öáİ¤? ?Ë·Úñ øËÎ³ øÉ?? õËÚü õµ? øÉ?? ????õµ Ğï? ?Ê¯òÚ ?öáùâ Ê«?Ê«? ?öáùâ Ï­âı ñĞİ¤ñĞ ı§óİİ¤ Ê«?Ê«? Î¯óİóİ í·îñ Í³İ¤? ?Ë·Úñ ?ÜØ? ñĞ??İ¤ ?Ê¯òÚ Î¯ëÚóú ñĞ? øÉ?? óİı§? ?Ê¯ô¾İ¤ Û¶õµ? ?Ê¯ô¾İ¤ ??åï ñĞ?.

??åï Ê«?Ê«? ??ùê ñĞ??İ¤ Ê«? ûëï¤Üİ Í³üâõµ Î¯óİóİ ı§óİİ¤ ?? ????õµ ?Ê¯òÚ Ğï? Î¯ëÚóú óİ? ùâ? í·îñ ??ùê õµ? ?öáı§ ??øĞ ????õµ ı§óİİ¤ Û¶õµ? ?Ê¯òÚ Ï­âı í·îñ ?? ?Í» øËÎ³ ?Ê¯ô¾İ¤ öáİ¤? ??åï óİı§? óİ? ñĞİ¤ñĞ Î¯ëÚóú ????õµ ????õµ õËÚü Ê«?Ê«? ñĞ?äù øÉ?? Í³üâõµ õµ? ùâûİ ???? ?öáùâ ?øâ õµ?.', 10, '2023-08-28', 'member10');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'ÊÅù¼? Üé?×ğÖï ???ÜË ??òÚ×ùĞü?', '??øĞ ?ÜØ? ?öáı§ í·îñ õËÚü øËÎ³ ????õµ õµ? óİ? ?Í» ??åï ?ÜØ? Øì? õµ? Í³üâõµ Î¯ëÚóú ?øâ ?öáùâ ??øĞ ?øâ ?öáı§ Ë¯?? ??åï ñĞ? ı§óİİ¤ ùâûİ ????õµ ùâ? Î¯ëÚóú Ê«?Ê«? Í³üâõµ ñĞİ¤ñĞ ñĞ?äù Í³İ¤? õµ? ????õµ ñĞ? ?ÜØ? õµ? õµ? õËÚü õËÚü ??åï ????õµ ?Ê¯òÚ Ê«? ùâûİ õËÚü ????õµ ?öáı§.

ñĞ?äù Û¶õµ? óİ? ı§óİİ¤ óİı§? Ë¯?? Í³İ¤? Î¯óİóİ ?Ê¯ô¾İ¤ Û¶õµ? ??åï ùâûİ Ğï? ñĞ??İ¤ ?Ê¯ô¾İ¤ Î¯óİóİ óİı§? óİı§? Ğï? ?ÜØ? õµ? ñĞ? ûëï¤Üİ í·îñ ?öáùâ ñĞ??İ¤ Í³üâõµ Ï­âı ù÷øÉİ¤óİ ????õµ ?öáùâ Î¯ëÚóú ?øâ ùâ? øÉ?? ûëï¤Üİ Ê«? Ê«? ?öáùâ ?? ùâ? ??øĞ øÉ?? õµ? ?ÜØ? ?øâ Ë¯?? í·îñ ûëï¤Üİ öáİ¤?.

????õµ ?ÜØ? ñĞ? Ê«? ùâûİ ?Í» óİı§? ı§óİİ¤ Û¶õµ? ñĞİ¤ñĞ Ï­âı ûëï¤Üİ ?öáùâ ?Í» ?öáùâ ?Ë·Úñ ñĞ? öáİ¤? ?Ë·Úñ øËÎ³ øÉ?? õËÚü õµ? øÉ?? ????õµ Ğï? ?Ê¯òÚ ?öáùâ Ê«?Ê«? ?öáùâ Ï­âı ñĞİ¤ñĞ ı§óİİ¤ Ê«?Ê«? Î¯óİóİ í·îñ Í³İ¤? ?Ë·Úñ ?ÜØ? ñĞ??İ¤ ?Ê¯òÚ Î¯ëÚóú ñĞ? øÉ?? óİı§? ?Ê¯ô¾İ¤ Û¶õµ? ?Ê¯ô¾İ¤ ??åï ñĞ?.

??åï Ê«?Ê«? ??ùê ñĞ??İ¤ Ê«? ûëï¤Üİ Í³üâõµ Î¯óİóİ ı§óİİ¤ ?? ????õµ ?Ê¯òÚ Ğï? Î¯ëÚóú óİ? ùâ? í·îñ ??ùê õµ? ?öáı§ ??øĞ ????õµ ı§óİİ¤ Û¶õµ? ?Ê¯òÚ Ï­âı í·îñ ?? ?Í» øËÎ³ ?Ê¯ô¾İ¤ öáİ¤? ??åï óİı§? óİ? ñĞİ¤ñĞ Î¯ëÚóú ????õµ ????õµ õËÚü Ê«?Ê«? ñĞ?äù øÉ?? Í³üâõµ õµ? ùâûİ ???? ?öáùâ ?øâ õµ?.', 10, '2023-08-28', 'member10');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Ù¼òÚ×»? Êµ?? õµ?Êµ "ÜõÓú?"', '??øĞ ?ÜØ? ?öáı§ í·îñ õËÚü øËÎ³ ????õµ õµ? óİ? ?Í» ??åï ?ÜØ? Øì? õµ? Í³üâõµ Î¯ëÚóú ?øâ ?öáùâ ??øĞ ?øâ ?öáı§ Ë¯?? ??åï ñĞ? ı§óİİ¤ ùâûİ ????õµ ùâ? Î¯ëÚóú Ê«?Ê«? Í³üâõµ ñĞİ¤ñĞ ñĞ?äù Í³İ¤? õµ? ????õµ ñĞ? ?ÜØ? õµ? õµ? õËÚü õËÚü ??åï ????õµ ?Ê¯òÚ Ê«? ùâûİ õËÚü ????õµ ?öáı§.

ñĞ?äù Û¶õµ? óİ? ı§óİİ¤ óİı§? Ë¯?? Í³İ¤? Î¯óİóİ ?Ê¯ô¾İ¤ Û¶õµ? ??åï ùâûİ Ğï? ñĞ??İ¤ ?Ê¯ô¾İ¤ Î¯óİóİ óİı§? óİı§? Ğï? ?ÜØ? õµ? ñĞ? ûëï¤Üİ í·îñ ?öáùâ ñĞ??İ¤ Í³üâõµ Ï­âı ù÷øÉİ¤óİ ????õµ ?öáùâ Î¯ëÚóú ?øâ ùâ? øÉ?? ûëï¤Üİ Ê«? Ê«? ?öáùâ ?? ùâ? ??øĞ øÉ?? õµ? ?ÜØ? ?øâ Ë¯?? í·îñ ûëï¤Üİ öáİ¤?.

????õµ ?ÜØ? ñĞ? Ê«? ùâûİ ?Í» óİı§? ı§óİİ¤ Û¶õµ? ñĞİ¤ñĞ Ï­âı ûëï¤Üİ ?öáùâ ?Í» ?öáùâ ?Ë·Úñ ñĞ? öáİ¤? ?Ë·Úñ øËÎ³ øÉ?? õËÚü õµ? øÉ?? ????õµ Ğï? ?Ê¯òÚ ?öáùâ Ê«?Ê«? ?öáùâ Ï­âı ñĞİ¤ñĞ ı§óİİ¤ Ê«?Ê«? Î¯óİóİ í·îñ Í³İ¤? ?Ë·Úñ ?ÜØ? ñĞ??İ¤ ?Ê¯òÚ Î¯ëÚóú ñĞ? øÉ?? óİı§? ?Ê¯ô¾İ¤ Û¶õµ? ?Ê¯ô¾İ¤ ??åï ñĞ?.

??åï Ê«?Ê«? ??ùê ñĞ??İ¤ Ê«? ûëï¤Üİ Í³üâõµ Î¯óİóİ ı§óİİ¤ ?? ????õµ ?Ê¯òÚ Ğï? Î¯ëÚóú óİ? ùâ? í·îñ ??ùê õµ? ?öáı§ ??øĞ ????õµ ı§óİİ¤ Û¶õµ? ?Ê¯òÚ Ï­âı í·îñ ?? ?Í» øËÎ³ ?Ê¯ô¾İ¤ öáİ¤? ??åï óİı§? óİ? ñĞİ¤ñĞ Î¯ëÚóú ????õµ ????õµ õËÚü Ê«?Ê«? ñĞ?äù øÉ?? Í³üâõµ õµ? ùâûİ ???? ?öáùâ ?øâ õµ?.', 10, '2023-08-28', 'member10');


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

--??????÷û????? ?????, ????


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




insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'ÏÒ?? ûÏ×»?, ?øÎ?? ?Ğù?Ğù ı§? ?? ¡®??¡¯', 'Øì? ??åï ùâûİ Í³üâõµ ????õµ ??åï ñĞ?äù óİı§? ??øĞ ?? öáİ¤? ùâûİ ?øâ öáİ¤? ??ùê óİ? õµ? ı§óİİ¤ ñĞ?äù Ê«? í·îñ Í³üâõµ Ê«? õËÚü ????õµ õËÚü Øì? ı§óİİ¤ ñĞİ¤ñĞ ?Ê¯òÚ ??øĞ ?Ê¯ô¾İ¤ ı§óİİ¤ õËÚü Ê«? ı§óİİ¤ Ê«?Ê«? ??åï ????õµ Î¯ëÚóú ñĞ?äù ùâ? Î¯óİóİ ùâûİ ?Ë·Úñ óİ? Ê«?Ê«? ?øâ ñĞ? ????õµ.

öáİ¤? ??åï Î¯óİóİ ?øâ ?Ê¯ô¾İ¤ õËÚü Î¯ëÚóú õËÚü Ê«? ùâûİ Í³İ¤? ??øĞ ?öáùâ ??øĞ ?? ?øâ óİı§? øËÎ³ ñĞİ¤ñĞ ñĞİ¤ñĞ ?Ë·Úñ ?Ê¯òÚ Ê«? ????õµ ùâ? Í³üâõµ ùâûİ Û¶õµ? Í³üâõµ ñĞ??İ¤ ?Í» ùâ? ?öáı§ ?Ê¯ô¾İ¤ ??øĞ Ï­âı Ë¯?? ??ùê ?öáı§ ??ùê ??åï ?Ê¯òÚ ?? Øì? Ê«? ùâ? ???? Ê«? ?Ê¯ô¾İ¤ Ë¯??.

?Í» ????õµ ?Ê¯ô¾İ¤ øÉ?? Í³İ¤? ?öáùâ ?ÜØ? ùâûİ ?øâ ?öáı§ õËÚü Û¶õµ? õËÚü ?Ë·Úñ ??øĞ ñĞİ¤ñĞ Í³üâõµ Û¶õµ? õËÚü øÉ?? Û¶õµ? ñĞ? ???? ??åï ı§óİİ¤ ????õµ ?Ë·Úñ ?? ı§óİİ¤ ??åï ????õµ ??øĞ Øì? ù÷øÉİ¤óİ ?Ë·Úñ õËÚü ??øĞ ñĞ?äù öáİ¤? ûëï¤Üİ ?öáùâ Î¯óİóİ ????õµ ûëï¤Üİ ñĞ?äù ????õµ ??øĞ öáİ¤? Ğï? ñĞİ¤ñĞ.

öáİ¤? ????õµ õËÚü í·îñ ?Í» óİ? óİ? Ê«? ı§óİİ¤ Î¯óİóİ ??ùê ?Ê¯òÚ Î¯ëÚóú öáİ¤? ???? ñĞ? ?öáùâ Í³İ¤? ?öáı§ ù÷øÉİ¤óİ ù÷øÉİ¤óİ Û¶õµ? ?øâ ???? øÉ?? öáİ¤? ñĞ? ?øâ õËÚü óİ? øÉ?? ????õµ Ë¯?? ?? Ë¯?? Ï­âı ??øĞ ?öáùâ ??øĞ Ë¯?? ?ÜØ? Í³üâõµ ??ùê õËÚü ñĞ?äù ????õµ ??øĞ Ê«?Ê«? ?öáùâ ûëï¤Üİ.', 1, '2023-03-12', 'member01');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '?? ÕôğÂøË ? ?? ûã?ÜË ?? ?? ¡®ĞÆÊÇ?¡¯', 'óİı§? óİ? öáİ¤? Øì? ûëï¤Üİ ?ÜØ? ?Ê¯ô¾İ¤ Ï­âı ñĞ? õËÚü ñĞ? øÉ?? ñĞİ¤ñĞ ñĞ? ??ùê ?öáı§ Ê«? Î¯ëÚóú ?øâ ñĞ??İ¤ ñĞ?äù Ğï? ??åï ??åï Ê«?Ê«? ?Ê¯ô¾İ¤ Í³İ¤? Ë¯?? ?Ë·Úñ Ë¯?? Û¶õµ? ûëï¤Üİ ?öáı§ ı§óİİ¤ ñĞ?äù ùâ? õËÚü ?Ê¯ô¾İ¤ ?Ê¯ô¾İ¤ Ê«?Ê«? ?Ë·Úñ Û¶õµ? ñĞ?äù õËÚü öáİ¤? ?øâ óİ? ñĞİ¤ñĞ í·îñ õµ?.

?Ê¯òÚ ?Ê¯ô¾İ¤ óİı§? Í³üâõµ Û¶õµ? õËÚü ñĞ?äù ????õµ í·îñ ????õµ ?Í» ı§óİİ¤ Ë¯?? ñĞİ¤ñĞ ??åï ?Ê¯òÚ Ë¯?? ??ùê ñĞİ¤ñĞ ñĞ? ı§óİİ¤ ?Ê¯ô¾İ¤ ùâûİ Ê«?Ê«? ???? Ê«? ?ÜØ? ??øĞ ????õµ öáİ¤? í·îñ Øì? ?öáùâ øÉ?? ?ÜØ? ?Ë·Úñ ?øâ ????õµ õËÚü ñĞ?äù ??ùê ????õµ õµ? Ğï? ?øâ øËÎ³ õËÚü ???? ??ùê Î¯ëÚóú.

Í³üâõµ ù÷øÉİ¤óİ ñĞ??İ¤ Øì? øËÎ³ ??øĞ ?öáùâ Ë¯?? Ï­âı í·îñ Í³üâõµ ùâ? ñĞİ¤ñĞ Î¯ëÚóú Ğï? ñĞ??İ¤ Í³İ¤? ùâ? Ï­âı ????õµ ù÷øÉİ¤óİ øÉ?? ??øĞ Î¯óİóİ ı§óİİ¤ ?Ê¯òÚ ?öáı§ ùâ? ù÷øÉİ¤óİ ı§óİİ¤ ??åï ?ÜØ? ??åï ??åï ?øâ Î¯ëÚóú óİı§? Ê«?Ê«? ????õµ ??åï ñĞ?äù ?øâ ñĞ??İ¤ óİı§? ûëï¤Üİ ù÷øÉİ¤óİ õµ? ñĞİ¤ñĞ Ê«? øËÎ³.

ù÷øÉİ¤óİ ùâ? ñĞ? óİı§? ?Ê¯ô¾İ¤ óİı§? Ï­âı øÉ?? ?Ë·Úñ ûëï¤Üİ Ê«?Ê«? õËÚü Ğï? Í³üâõµ ?Í» Ë¯?? ?Ê¯ô¾İ¤ ùâ? ?öáı§ í·îñ ûëï¤Üİ ñĞ?äù ?öáı§ øËÎ³ Í³İ¤? ?öáùâ ñĞ?äù Í³İ¤? Ï­âı Û¶õµ? ?ÜØ? ?Ê¯òÚ ?Ë·Úñ ùâ? ?Ê¯òÚ öáİ¤? ???? ı§óİİ¤ ?Ê¯òÚ ??ùê õËÚü Û¶õµ? øËÎ³ Ï­âı ñĞ? øËÎ³ Î¯óİóİ óİı§? ûëï¤Üİ õËÚü.', 2, '2022-12-15', 'member02');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'îüñÕ ÏÀ ? ?? ûã?ÜË ?? ?? Ü©??? ¡®à÷İ»¡¯', 'ùâûİ ñĞİ¤ñĞ ?öáùâ ??åï ?öáı§ ?öáùâ øËÎ³ ??ùê ??ùê ??øĞ Í³üâõµ øÉ?? øÉ?? öáİ¤? Í³İ¤? ùâûİ Ë¯?? ?öáùâ Î¯ëÚóú ????õµ ??åï Í³İ¤? ñĞ? ?Ê¯ô¾İ¤ öáİ¤? ı§óİİ¤ ??øĞ ûëï¤Üİ öáİ¤? Ê«? óİ? ñĞ? õËÚü ?Ê¯ô¾İ¤ Û¶õµ? Ë¯?? ù÷øÉİ¤óİ ?Ë·Úñ Ê«?Ê«? øÉ?? Øì? øÉ?? Ë¯?? Í³İ¤? ?öáı§ Í³üâõµ Û¶õµ? Î¯ëÚóú ?öáùâ ??.

ùâûİ Û¶õµ? óİı§? óİ? ùâ? Í³İ¤? í·îñ ??øĞ õµ? Í³İ¤? ùâ? ù÷øÉİ¤óİ ?Ë·Úñ Û¶õµ? Ê«?Ê«? ??ùê Ï­âı ?öáı§ ??ùê óİ? Ê«? ñĞ?äù Ê«? ???? Ê«?Ê«? öáİ¤? ????õµ øËÎ³ Î¯óİóİ í·îñ ñĞ?äù ñĞ??İ¤ ñĞ? Ê«? øËÎ³ Ğï? ?öáı§ ?? öáİ¤? ?ÜØ? ñĞİ¤ñĞ Øì? ??øĞ Ê«? ?Í» ûëï¤Üİ Í³İ¤? öáİ¤? ?Ê¯òÚ ù÷øÉİ¤óİ.

öáİ¤? ?ÜØ? ????õµ ????õµ ?Ê¯ô¾İ¤ ùâ? í·îñ Î¯ëÚóú ı§óİİ¤ Ê«? ?Ê¯òÚ ñĞ?äù óİ? ?öáı§ ?Ë·Úñ ????õµ ?Ê¯ô¾İ¤ Î¯óİóİ øËÎ³ Ê«? ?Ê¯ô¾İ¤ ?öáı§ ?? Ê«?Ê«? Ğï? ?öáı§ ñĞ? ?øâ ????õµ ùâ? óİı§? ??øĞ Û¶õµ? ?øâ Øì? ûëï¤Üİ ????õµ ????õµ Ê«?Ê«? ñĞ??İ¤ ??åï ????õµ ñĞ? óİı§? øÉ?? ?Í» ?öáùâ Ï­âı Î¯ëÚóú Í³üâõµ.

??ùê ?? ??ùê ûëï¤Üİ ??ùê ?? Û¶õµ? ?öáı§ ?? ?Í» õËÚü ?Ë·Úñ Ë¯?? øÉ?? Ğï? Î¯óİóİ ??øĞ Ë¯?? Î¯ëÚóú óİ? ñĞİ¤ñĞ Ë¯?? õµ? ñĞİ¤ñĞ óİ? ñĞİ¤ñĞ ?Í» Ê«? í·îñ Í³üâõµ ùâûİ ??ùê õµ? ??ùê ?øâ ùâûİ øÉ?? Û¶õµ? Øì? ?öáùâ ñĞ? ?Ë·Úñ ???? Ğï? í·îñ õËÚü ñĞ?äù ùâûİ Ë¯?? Ê«?.', 3, '2023-11-02', 'member03');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'ÛÎø²??øË õµİ¤ ÖÇ?? ?ó¦ ? ?Ğ¶? ??? ¡®?ÎÛ¡¯', '?ÜØ? í·îñ øËÎ³ ?öáùâ õµ? ?? ????õµ ????õµ ??åï ??åï Ë¯?? ı§óİİ¤ ?Ê¯òÚ Øì? óİı§? ?ÜØ? Î¯ëÚóú ?ÜØ? ñĞ??İ¤ ????õµ ?Í» ñĞİ¤ñĞ Ë¯?? ????õµ Í³üâõµ ?Ê¯ô¾İ¤ ñĞ?äù ?Í» ?Ê¯ô¾İ¤ ù÷øÉİ¤óİ ñĞ? óİı§? ?öáùâ ??åï Î¯óİóİ ??øĞ Û¶õµ? ?Ê¯ô¾İ¤ øËÎ³ ñĞ??İ¤ ??åï õµ? ??ùê ?Í» öáİ¤? ?öáùâ.

óİ? ????õµ ??ùê ñĞ? Ë¯?? ?ÜØ? Øì? óİ? ?Ê¯òÚ Ë¯?? Î¯ëÚóú ?? Î¯óİóİ ñĞİ¤ñĞ ??øĞ öáİ¤? ?Ë·Úñ ????õµ Í³üâõµ ??åï Ï­âı ?øâ ????õµ ùâûİ ?Ê¯ô¾İ¤ ?Í» øËÎ³ Ğï? ????õµ ?? ??åï ùâ? øÉ?? õËÚü ?Í» ?Ê¯òÚ Ğï? Í³üâõµ ù÷øÉİ¤óİ ????õµ óİ? ????õµ ùâ? ???? ûëï¤Üİ Í³İ¤? Ï­âı ????õµ øËÎ³ ñĞ??İ¤.

Ë¯?? ?øâ ?Ê¯òÚ ?öáı§ ?ÜØ? ñĞ? ñĞİ¤ñĞ ñĞİ¤ñĞ ?Í» ù÷øÉİ¤óİ ?Í» Ë¯?? ?ÜØ? ?öáı§ ??ùê ???? ?ÜØ? ??åï ??ùê Í³İ¤? ?öáùâ ù÷øÉİ¤óİ õËÚü ñĞİ¤ñĞ ??øĞ ùâ? Û¶õµ? Ê«?Ê«? ?öáùâ Û¶õµ? ??ùê Û¶õµ? ???? Î¯ëÚóú ?Ê¯òÚ ??åï ùâûİ ñĞ? Í³İ¤? ????õµ ?Í» ????õµ ñĞİ¤ñĞ ?Ë·Úñ Í³İ¤? Û¶õµ? ?Í» Ê«?Ê«? Ê«?Ê«? Û¶õµ?.

öáİ¤? õËÚü õËÚü Øì? õËÚü Î¯óİóİ ûëï¤Üİ øÉ?? ????õµ ûëï¤Üİ Î¯óİóİ ?Ê¯ô¾İ¤ ????õµ Û¶õµ? øËÎ³ ?öáùâ ?Ê¯òÚ óİ? Û¶õµ? ñĞ? ?Ê¯òÚ ùâûİ øÉ?? ????õµ ñĞ?äù Î¯ëÚóú ûëï¤Üİ öáİ¤? Ê«? ù÷øÉİ¤óİ ????õµ ?öáùâ ñĞİ¤ñĞ öáİ¤? Ê«? Î¯óİóİ ùâûİ óİı§? ñĞ? ?Í» Ï­âı ????õµ ñĞ??İ¤ ?Ê¯ô¾İ¤ ùâûİ ??åï í·îñ ñĞ??İ¤ ñĞ?äù ñĞİ¤ñĞ.', 4, '2024-01-21', 'member04');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '?ÛªÎ³ ûã?Ê¥ñÕ? İ«ôü ??Êí ??? ¡®ø¢îÕ¡¯?', '?Ê¯ô¾İ¤ ñĞ?äù ñĞ?äù õËÚü õµ? Û¶õµ? ûëï¤Üİ øÉ?? øÉ?? ùâ? ?öáùâ ?Ê¯òÚ ù÷øÉİ¤óİ í·îñ Ğï? ñĞ? Øì? ñĞİ¤ñĞ øÉ?? õËÚü Î¯ëÚóú Ë¯?? óİı§? Ë¯?? ?öáùâ ?Í» ı§óİİ¤ ûëï¤Üİ õµ? ñĞ??İ¤ ?öáı§ Í³üâõµ Øì? ùâ? öáİ¤? öáİ¤? ?øâ ?Í» ı§óİİ¤ øËÎ³ ?Ê¯òÚ Øì? Ï­âı Í³üâõµ ?Ê¯òÚ Ê«?Ê«? ??åï ñĞ??İ¤ øËÎ³ õµ?.

Î¯ëÚóú í·îñ ùâ? Ï­âı ñĞİ¤ñĞ ûëï¤Üİ ?Ê¯òÚ ùâ? ñĞ?äù ?Ê¯òÚ ????õµ ?Ê¯òÚ ñĞ? ûëï¤Üİ ????õµ ????õµ Ë¯?? Ğï? øÉ?? Î¯óİóİ ?? ??åï ?Ê¯ô¾İ¤ ????õµ ùâ? Î¯ëÚóú Øì? ñĞ?äù Ê«? ?Ê¯òÚ ?Ë·Úñ Í³İ¤? õËÚü Í³üâõµ ??ùê øËÎ³ ?Ê¯òÚ ?Ë·Úñ Ë¯?? ?Ê¯òÚ Øì? ùâûİ ùâ? Í³üâõµ öáİ¤? Øì? Ë¯?? øÉ?? ?Ë·Úñ Øì?.

Ğï? øËÎ³ Ï­âı ?Ë·Úñ ?ÜØ? Ë¯?? ?öáı§ öáİ¤? ?ÜØ? ù÷øÉİ¤óİ Ê«? õµ? ùâûİ øËÎ³ ñĞ??İ¤ Ğï? ?öáùâ í·îñ Í³İ¤? ñĞ?äù ñĞİ¤ñĞ ùâ? Ï­âı ??åï Î¯ëÚóú óİı§? ùâ? ?Ë·Úñ õµ? ????õµ Ê«? ????õµ ?Ë·Úñ ?öáùâ øÉ?? Î¯óİóİ ?Í» ????õµ ??ùê ?Ê¯òÚ Û¶õµ? ñĞ? ùâ? ñĞ?äù Øì? öáİ¤? ?øâ ?Ê¯ô¾İ¤ ????õµ í·îñ.

?Ê¯òÚ Ë¯?? Û¶õµ? ?? ı§óİİ¤ Ê«? õËÚü ûëï¤Üİ ?öáùâ ?Í» ?Ë·Úñ øËÎ³ ?øâ ?Ë·Úñ Ê«?Ê«? ñĞ??İ¤ Í³İ¤? ????õµ ??ùê ı§óİİ¤ ??åï ?öáı§ Í³üâõµ õËÚü ?øâ Î¯óİóİ ?ÜØ? Í³üâõµ ??øĞ ñĞ?äù õµ? ??ùê ñĞ? Ï­âı Øì? Í³üâõµ ñĞİ¤ñĞ Ê«?Ê«? øÉ?? Ê«? ?Ë·Úñ Í³üâõµ ???? øÉ?? ????õµ ñĞİ¤ñĞ ?öáı§ Î¯óİóİ ??ùê ?ÜØ?.', 5, '2023-06-24', 'member05');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '÷ôğÂ??? ???? ?? ???×» ?Êµ ?ø·Íí ¡®??¡¯', '?ÜØ? Ğï? ñĞ?äù ??ùê ñĞ? ñĞİ¤ñĞ ı§óİİ¤ ?ÜØ? óİı§? ñĞİ¤ñĞ Øì? óİ? ?Ê¯ô¾İ¤ ??åï í·îñ ???? ñĞ? Í³İ¤? ????õµ ????õµ õµ? ?øâ ????õµ øÉ?? ñĞ? ??åï ???? ñĞ? Ï­âı ù÷øÉİ¤óİ Øì? ñĞİ¤ñĞ ?øâ õËÚü ?øâ ñĞ??İ¤ ?Ê¯ô¾İ¤ ?Ë·Úñ ?? øËÎ³ Í³İ¤? ?Ê¯òÚ ñĞ? óİ? óİı§? ?Ê¯òÚ Øì? ñĞ?äù ??åï ?Í».

Ë¯?? Û¶õµ? Ğï? ?öáı§ Ï­âı í·îñ ñĞ??İ¤ ?Ê¯òÚ öáİ¤? ?Ê¯ô¾İ¤ Øì? Í³üâõµ ?öáùâ ????õµ õËÚü óİı§? ??ùê ????õµ ?Í» ñĞ? ?Ë·Úñ Î¯óİóİ ûëï¤Üİ õËÚü Ğï? ?ÜØ? í·îñ ñĞ??İ¤ óİ? Øì? ?Ê¯ô¾İ¤ Í³İ¤? ?öáı§ ?øâ Í³İ¤? ùâûİ ñĞ?äù õµ? Ê«? øËÎ³ óİ? ?Ê¯òÚ ?øâ øËÎ³ Øì? Û¶õµ? ûëï¤Üİ ñĞ?äù ñĞİ¤ñĞ ùâ?.

ı§óİİ¤ ùâûİ Øì? Ê«?Ê«? ñĞ??İ¤ ?? Ê«?Ê«? ??åï øÉ?? Î¯óİóİ ??åï ?Ë·Úñ óİ? ?öáùâ Ê«? õËÚü ?Ë·Úñ ?? ?Ë·Úñ Û¶õµ? ù÷øÉİ¤óİ öáİ¤? Ê«?Ê«? ù÷øÉİ¤óİ ?ÜØ? Î¯óİóİ ?Ë·Úñ ù÷øÉİ¤óİ ?öáı§ õËÚü ñĞİ¤ñĞ í·îñ õµ? ?Ê¯òÚ óİ? õµ? ?ÜØ? ?? øËÎ³ Ğï? õËÚü í·îñ ?Ê¯òÚ öáİ¤? øËÎ³ ?Ë·Úñ ñĞ??İ¤ ??ùê óİı§? ùâûİ.

?øâ ??ùê øÉ?? Í³üâõµ ?Ê¯òÚ ????õµ ñĞ??İ¤ í·îñ Î¯óİóİ ????õµ õµ? Ë¯?? öáİ¤? Ï­âı ?ÜØ? ùâûİ ùâ? Í³İ¤? Ê«? ?öáùâ ùâ? Û¶õµ? õËÚü Ê«? ?Ê¯òÚ ?Ê¯òÚ ??øĞ Í³üâõµ ?ÜØ? Û¶õµ? Øì? Î¯óİóİ ?Ë·Úñ ????õµ Î¯óİóİ ????õµ Í³üâõµ ????õµ ùâûİ Î¯ëÚóú öáİ¤? ????õµ ???? ù÷øÉİ¤óİ óİı§? ??åï Ğï? Û¶õµ? ???? Û¶õµ?.', 6, '2023-09-23', 'member06');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '??? ?ø·×» ??? ?í·ÕÉ ùâ? Ôõ ¡®Üõ?¡¯', '??øĞ ?? ñĞ? Î¯óİóİ Ï­âı ?øâ ?Ë·Úñ öáİ¤? ù÷øÉİ¤óİ ?öáùâ ñĞ??İ¤ ñĞ? ?Ê¯òÚ õµ? Øì? ı§óİİ¤ ??øĞ ?Ê¯ô¾İ¤ ?Í» óİ? ??ùê Ë¯?? ?? ??øĞ öáİ¤? øËÎ³ øËÎ³ Ê«? ûëï¤Üİ õËÚü ûëï¤Üİ Î¯ëÚóú Øì? ???? ?Í» ????õµ ñĞ? ùâ? ı§óİİ¤ ?öáı§ øÉ?? Ë¯?? ????õµ õµ? Û¶õµ? ?Ê¯ô¾İ¤ õµ? ?öáı§ ?? ??.

ñĞİ¤ñĞ ?øâ øÉ?? Ï­âı Î¯ëÚóú ?Ê¯òÚ Í³İ¤? ñĞ? ??ùê ?øâ ?öáùâ ñĞ?äù ùâûİ öáİ¤? óİ? ñĞİ¤ñĞ ?Ê¯ô¾İ¤ Î¯ëÚóú ñĞ??İ¤ Ë¯?? ?Í» ?Í» õµ? Øì? ????õµ õµ? ?øâ ????õµ ?Ê¯òÚ Î¯ëÚóú ?öáı§ Øì? Î¯óİóİ ?öáı§ í·îñ öáİ¤? Ğï? ????õµ õËÚü ûëï¤Üİ Ï­âı ñĞ? õËÚü ñĞİ¤ñĞ ??øĞ ûëï¤Üİ Î¯ëÚóú ???? ?øâ ñĞ?.

Øì? Ğï? ?Í» ????õµ ?Ë·Úñ Øì? ?ÜØ? ?ÜØ? ı§óİİ¤ ñĞ? ?Ê¯ô¾İ¤ óİ? ??åï ù÷øÉİ¤óİ ?Ê¯òÚ ûëï¤Üİ ñĞİ¤ñĞ ?Ê¯òÚ õµ? Í³İ¤? ù÷øÉİ¤óİ ?øâ í·îñ ??ùê óİı§? Ê«?Ê«? øÉ?? ñĞ?äù ñĞ??İ¤ ?Ê¯ô¾İ¤ Í³İ¤? Í³üâõµ í·îñ Í³üâõµ ñĞ?äù Î¯óİóİ ?ÜØ? ùâ? ?Ê¯ô¾İ¤ ñĞ??İ¤ Î¯óİóİ ùâûİ ?? ùâûİ Ê«?Ê«? öáİ¤? öáİ¤? ??øĞ ùâ? ?öáı§.

?øâ Ë¯?? ?Ê¯òÚ óİ? ?öáùâ óİı§? öáİ¤? Î¯óİóİ ?øâ ñĞ? ù÷øÉİ¤óİ ??øĞ ı§óİİ¤ øËÎ³ ??åï ñĞ?äù óİ? ı§óİİ¤ ?Ë·Úñ ûëï¤Üİ ?øâ Î¯ëÚóú ??øĞ ?øâ õËÚü Ê«?Ê«? ùâûİ ??øĞ ı§óİİ¤ ????õµ Í³üâõµ ñĞ?äù ùâûİ ????õµ ?öáı§ ?öáı§ ?öáı§ óİ? óİı§? ?öáùâ õµ? ????õµ Û¶õµ? Î¯óİóİ Ğï? Ï­âı í·îñ ?øâ Û¶õµ? ?Ê¯ô¾İ¤.', 7, '2023-11-10', 'member07');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '?ï¤ø·İ« òÚ? ??Êí? ?? ?? ¡®?øË¡¯', 'Í³İ¤? ñĞ? ??øĞ ?ÜØ? í·îñ Ë¯?? õËÚü ñĞİ¤ñĞ ñĞİ¤ñĞ ?Í» í·îñ óİı§? ????õµ ????õµ ?ÜØ? Î¯ëÚóú ?öáùâ ûëï¤Üİ õËÚü ı§óİİ¤ ?Ë·Úñ ùâ? Î¯ëÚóú öáİ¤? í·îñ ùâûİ ?Í» ?? ??åï öáİ¤? ?Ê¯ô¾İ¤ ûëï¤Üİ öáİ¤? ?öáı§ ?Ê¯ô¾İ¤ Î¯ëÚóú ù÷øÉİ¤óİ ?Í» ñĞ? ??ùê ?Ê¯ô¾İ¤ ?Ê¯ô¾İ¤ Í³İ¤? Ï­âı ?øâ ı§óİİ¤ óİ? ?? Í³İ¤? Øì?.

?øâ ????õµ Ê«? ñĞİ¤ñĞ ñĞ? óİ? ù÷øÉİ¤óİ ı§óİİ¤ Î¯ëÚóú í·îñ ?öáı§ ?øâ ?Ê¯ô¾İ¤ õËÚü Í³İ¤? Í³İ¤? ?öáùâ Ê«?Ê«? ??øĞ Øì? Û¶õµ? Ğï? ?öáùâ Í³üâõµ øÉ?? õµ? ?öáùâ ?øâ ????õµ ùâûİ Û¶õµ? ñĞ??İ¤ ????õµ ?Í» ñĞ??İ¤ ùâ? ñĞİ¤ñĞ ?Ê¯òÚ ??ùê ñĞ? Øì? Î¯óİóİ Ë¯?? ??øĞ ???? Ğï? ?? Î¯ëÚóú Î¯óİóİ Û¶õµ?.

???? õËÚü Í³üâõµ ?? ùâûİ öáİ¤? ùâûİ ı§óİİ¤ Ë¯?? ?ÜØ? øÉ?? ?øâ Í³İ¤? ùâûİ óİı§? Û¶õµ? ûëï¤Üİ ????õµ Ê«?Ê«? Î¯óİóİ Ë¯?? ??åï ñĞ? ?Ë·Úñ ??øĞ ñĞ?äù ûëï¤Üİ ùâûİ Í³üâõµ ù÷øÉİ¤óİ ??ùê ?øâ ?öáı§ ı§óİİ¤ ùâ? Î¯ëÚóú ??ùê ù÷øÉİ¤óİ óİı§? ?Í» Ê«? ûëï¤Üİ Í³üâõµ ı§óİİ¤ ????õµ ?öáùâ ????õµ öáİ¤? óİ? ùâ?.

õµ? ?Ê¯òÚ ???? Í³üâõµ ùâ? Ê«?Ê«? ?Í» í·îñ ñĞ?äù ?? ûëï¤Üİ ????õµ ????õµ ?Í» ???? ????õµ í·îñ ?öáı§ ùâûİ ?ÜØ? ?Ê¯ô¾İ¤ í·îñ õËÚü ??ùê Ğï? ?Ê¯òÚ ?öáùâ ?øâ ?? øÉ?? ??øĞ Ğï? ûëï¤Üİ Ë¯?? ?øâ Ê«? ?Ê¯òÚ ?? Í³İ¤? Ï­âı ?Ê¯ô¾İ¤ ûëï¤Üİ ????õµ ı§óİİ¤ ?? Ê«?Ê«? ?öáı§ Î¯óİóİ ?øâ ?Í».', 8, '2023-08-22', 'member08');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'ÛÎø²??Öï×» ?ùû? ï¤? ×ù??îÅ? ¡®???¡¯', 'Ï­âı ?ÜØ? ???? Í³üâõµ ?Ê¯ô¾İ¤ Øì? ùâûİ ?Ê¯ô¾İ¤ Û¶õµ? ????õµ õËÚü øËÎ³ óİ? óİı§? ????õµ í·îñ ?? Ê«?Ê«? ????õµ Ê«? õËÚü ñĞ?äù ñĞ?äù ?öáı§ ?Í» ???? õµ? ???? Í³üâõµ ùâûİ Ë¯?? Ë¯?? Ï­âı ùâûİ ?öáùâ ?öáı§ ?øâ Ğï? Í³üâõµ Ğï? ñĞ? õËÚü ?öáı§ øËÎ³ ûëï¤Üİ ñĞ? ùâûİ ?öáùâ ?ÜØ? Øì?.

öáİ¤? ù÷øÉİ¤óİ Ê«?Ê«? ñĞİ¤ñĞ ûëï¤Üİ ?? ùâ? ?ÜØ? óİ? ñĞ??İ¤ Ï­âı óİ? ?öáı§ Ë¯?? Î¯ëÚóú øÉ?? Û¶õµ? Ê«? ù÷øÉİ¤óİ ñĞ?äù ñĞ?äù Ë¯?? ??ùê ??ùê óİı§? ??øĞ ñĞ??İ¤ ?öáı§ Ğï? í·îñ Ë¯?? ñĞ??İ¤ ûëï¤Üİ õµ? öáİ¤? Ë¯?? ????õµ ùâ? ñĞ??İ¤ í·îñ ı§óİİ¤ Ï­âı óİ? óİı§? Ï­âı ?Ê¯òÚ Î¯ëÚóú ?Ê¯òÚ ??ùê ?öáı§.

Ë¯?? ûëï¤Üİ õËÚü Î¯óİóİ ???? Ê«? ??ùê ?? Í³üâõµ õËÚü ?öáı§ ?ÜØ? Ğï? ùâûİ ?Ë·Úñ öáİ¤? ı§óİİ¤ Î¯ëÚóú í·îñ ??øĞ Ğï? ?öáı§ Ê«?Ê«? õËÚü ?Ê¯ô¾İ¤ õµ? Ğï? ?øâ í·îñ õËÚü ???? ùâ? ùâ? ñĞ?äù Û¶õµ? õµ? ?? Û¶õµ? Î¯ëÚóú õËÚü ù÷øÉİ¤óİ ûëï¤Üİ Û¶õµ? ñĞ?äù ?ÜØ? ?Ê¯òÚ Øì? ??åï ?? õËÚü.

ñĞ?äù ??øĞ ı§óİİ¤ øÉ?? Øì? ñĞ? ???? Øì? ûëï¤Üİ Í³İ¤? Ï­âı øËÎ³ ?Í» óİ? ??åï ñĞ??İ¤ ???? ı§óİİ¤ õËÚü Î¯óİóİ ??ùê ??åï ùâûİ ??ùê ?Ë·Úñ ñĞ?äù óİ? ????õµ óİ? øËÎ³ Û¶õµ? õËÚü Øì? Û¶õµ? ?øâ ı§óİİ¤ øÉ?? Î¯ëÚóú Í³üâõµ ??åï Î¯óİóİ ?ÜØ? óİı§? Ê«? øËÎ³ ?ÜØ? ????õµ ùâûİ Î¯óİóİ Î¯ëÚóú.', 9, '2023-06-22', 'member09');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'ñĞ?? ÕôğÂøË ??ÜË Îù×» ??? ?öá ??? ¡®???¡¯', 'ñĞ??İ¤ í·îñ ?Ê¯ô¾İ¤ ?øâ ù÷øÉİ¤óİ ???? ñĞ?äù Øì? ñĞ?äù õµ? Ë¯?? ?Ë·Úñ ????õµ øËÎ³ õµ? Ê«? Ï­âı ñĞ??İ¤ ????õµ Ğï? Ê«? Í³İ¤? ???? Û¶õµ? í·îñ ?öáùâ ???? Í³üâõµ ñĞİ¤ñĞ ñĞ??İ¤ ???? Û¶õµ? ñĞ??İ¤ ñĞ? ù÷øÉİ¤óİ ??åï ?ÜØ? ùâûİ ù÷øÉİ¤óİ ?øâ ù÷øÉİ¤óİ ?Ë·Úñ ?ÜØ? ûëï¤Üİ Ï­âı ı§óİİ¤ ùâûİ Ê«? Î¯ëÚóú õËÚü.

?öáı§ ùâ? ñĞ?äù ñĞ??İ¤ ù÷øÉİ¤óİ øÉ?? ????õµ ñĞİ¤ñĞ Î¯ëÚóú Î¯óİóİ í·îñ Í³üâõµ ??øĞ ùâ? ??ùê Ï­âı ?? ?ÜØ? Î¯ëÚóú ??øĞ ???? ñĞ??İ¤ óİı§? ı§óİİ¤ Øì? Øì? ùâûİ Ï­âı í·îñ Î¯ëÚóú ?öáùâ Í³üâõµ ?Ê¯òÚ ????õµ Ï­âı ????õµ í·îñ óİı§? Ê«?Ê«? øËÎ³ õËÚü óİ? Î¯óİóİ Øì? ?? öáİ¤? ñĞ??İ¤ ????õµ ?? ?Ê¯ô¾İ¤.

????õµ ?öáı§ ?? ñĞİ¤ñĞ ?öáùâ Û¶õµ? ñĞİ¤ñĞ ùâ? Øì? ûëï¤Üİ ñĞİ¤ñĞ Øì? ûëï¤Üİ ùâûİ óİ? Î¯óİóİ ?øâ ?? ?ÜØ? Î¯óİóİ Ê«?Ê«? ????õµ Ê«? ?Ê¯òÚ ??øĞ ?Ê¯òÚ ı§óİİ¤ öáİ¤? öáİ¤? øÉ?? Øì? ñĞ? óİı§? óİ? øÉ?? Ê«? Í³üâõµ øÉ?? ?ÜØ? ?? ?øâ øÉ?? ñĞ?äù ?Ê¯òÚ ?öáı§ ????õµ ??ùê Î¯óİóİ ñĞ? Ğï?.

Ï­âı ??åï ??åï Í³üâõµ ?Ê¯òÚ ?? öáİ¤? Í³İ¤? øËÎ³ Î¯ëÚóú ñĞ?äù ?öáùâ ??øĞ ñĞ? öáİ¤? Øì? Ğï? ùâ? í·îñ ?öáùâ ??ùê õËÚü óİı§? Í³üâõµ ?Ê¯ô¾İ¤ ùâûİ óİ? ?? ??åï Ï­âı ?øâ Øì? õËÚü öáİ¤? õËÚü ùâûİ ?? ùâ? ????õµ óİı§? ?Ê¯òÚ ????õµ ùâûİ ????õµ Ë¯?? ??ùê ?Ë·Úñ ñĞ??İ¤ ùâûİ Øì?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '??Êí?øË ÏÀñĞùø ? ?Ğ¶? ¡®ûë? ñĞûÏ¡¯', 'ñĞ??İ¤ í·îñ ?Ê¯ô¾İ¤ ?øâ ù÷øÉİ¤óİ ???? ñĞ?äù Øì? ñĞ?äù õµ? Ë¯?? ?Ë·Úñ ????õµ øËÎ³ õµ? Ê«? Ï­âı ñĞ??İ¤ ????õµ Ğï? Ê«? Í³İ¤? ???? Û¶õµ? í·îñ ?öáùâ ???? Í³üâõµ ñĞİ¤ñĞ ñĞ??İ¤ ???? Û¶õµ? ñĞ??İ¤ ñĞ? ù÷øÉİ¤óİ ??åï ?ÜØ? ùâûİ ù÷øÉİ¤óİ ?øâ ù÷øÉİ¤óİ ?Ë·Úñ ?ÜØ? ûëï¤Üİ Ï­âı ı§óİİ¤ ùâûİ Ê«? Î¯ëÚóú õËÚü.

?öáı§ ùâ? ñĞ?äù ñĞ??İ¤ ù÷øÉİ¤óİ øÉ?? ????õµ ñĞİ¤ñĞ Î¯ëÚóú Î¯óİóİ í·îñ Í³üâõµ ??øĞ ùâ? ??ùê Ï­âı ?? ?ÜØ? Î¯ëÚóú ??øĞ ???? ñĞ??İ¤ óİı§? ı§óİİ¤ Øì? Øì? ùâûİ Ï­âı í·îñ Î¯ëÚóú ?öáùâ Í³üâõµ ?Ê¯òÚ ????õµ Ï­âı ????õµ í·îñ óİı§? Ê«?Ê«? øËÎ³ õËÚü óİ? Î¯óİóİ Øì? ?? öáİ¤? ñĞ??İ¤ ????õµ ?? ?Ê¯ô¾İ¤.

????õµ ?öáı§ ?? ñĞİ¤ñĞ ?öáùâ Û¶õµ? ñĞİ¤ñĞ ùâ? Øì? ûëï¤Üİ ñĞİ¤ñĞ Øì? ûëï¤Üİ ùâûİ óİ? Î¯óİóİ ?øâ ?? ?ÜØ? Î¯óİóİ Ê«?Ê«? ????õµ Ê«? ?Ê¯òÚ ??øĞ ?Ê¯òÚ ı§óİİ¤ öáİ¤? öáİ¤? øÉ?? Øì? ñĞ? óİı§? óİ? øÉ?? Ê«? Í³üâõµ øÉ?? ?ÜØ? ?? ?øâ øÉ?? ñĞ?äù ?Ê¯òÚ ?öáı§ ????õµ ??ùê Î¯óİóİ ñĞ? Ğï?.

Ï­âı ??åï ??åï Í³üâõµ ?Ê¯òÚ ?? öáİ¤? Í³İ¤? øËÎ³ Î¯ëÚóú ñĞ?äù ?öáùâ ??øĞ ñĞ? öáİ¤? Øì? Ğï? ùâ? í·îñ ?öáùâ ??ùê õËÚü óİı§? Í³üâõµ ?Ê¯ô¾İ¤ ùâûİ óİ? ?? ??åï Ï­âı ?øâ Øì? õËÚü öáİ¤? õËÚü ùâûİ ?? ùâ? ????õµ óİı§? ?Ê¯òÚ ????õµ ùâûİ ????õµ Ë¯?? ??ùê ?Ë·Úñ ñĞ??İ¤ ùâûİ Øì?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '? ûã?? ???Ğ¶? Ü©??? ¡®ùËÎ®¡¯?', 'ñĞ??İ¤ í·îñ ?Ê¯ô¾İ¤ ?øâ ù÷øÉİ¤óİ ???? ñĞ?äù Øì? ñĞ?äù õµ? Ë¯?? ?Ë·Úñ ????õµ øËÎ³ õµ? Ê«? Ï­âı ñĞ??İ¤ ????õµ Ğï? Ê«? Í³İ¤? ???? Û¶õµ? í·îñ ?öáùâ ???? Í³üâõµ ñĞİ¤ñĞ ñĞ??İ¤ ???? Û¶õµ? ñĞ??İ¤ ñĞ? ù÷øÉİ¤óİ ??åï ?ÜØ? ùâûİ ù÷øÉİ¤óİ ?øâ ù÷øÉİ¤óİ ?Ë·Úñ ?ÜØ? ûëï¤Üİ Ï­âı ı§óİİ¤ ùâûİ Ê«? Î¯ëÚóú õËÚü.

?öáı§ ùâ? ñĞ?äù ñĞ??İ¤ ù÷øÉİ¤óİ øÉ?? ????õµ ñĞİ¤ñĞ Î¯ëÚóú Î¯óİóİ í·îñ Í³üâõµ ??øĞ ùâ? ??ùê Ï­âı ?? ?ÜØ? Î¯ëÚóú ??øĞ ???? ñĞ??İ¤ óİı§? ı§óİİ¤ Øì? Øì? ùâûİ Ï­âı í·îñ Î¯ëÚóú ?öáùâ Í³üâõµ ?Ê¯òÚ ????õµ Ï­âı ????õµ í·îñ óİı§? Ê«?Ê«? øËÎ³ õËÚü óİ? Î¯óİóİ Øì? ?? öáİ¤? ñĞ??İ¤ ????õµ ?? ?Ê¯ô¾İ¤.

????õµ ?öáı§ ?? ñĞİ¤ñĞ ?öáùâ Û¶õµ? ñĞİ¤ñĞ ùâ? Øì? ûëï¤Üİ ñĞİ¤ñĞ Øì? ûëï¤Üİ ùâûİ óİ? Î¯óİóİ ?øâ ?? ?ÜØ? Î¯óİóİ Ê«?Ê«? ????õµ Ê«? ?Ê¯òÚ ??øĞ ?Ê¯òÚ ı§óİİ¤ öáİ¤? öáİ¤? øÉ?? Øì? ñĞ? óİı§? óİ? øÉ?? Ê«? Í³üâõµ øÉ?? ?ÜØ? ?? ?øâ øÉ?? ñĞ?äù ?Ê¯òÚ ?öáı§ ????õµ ??ùê Î¯óİóİ ñĞ? Ğï?.

Ï­âı ??åï ??åï Í³üâõµ ?Ê¯òÚ ?? öáİ¤? Í³İ¤? øËÎ³ Î¯ëÚóú ñĞ?äù ?öáùâ ??øĞ ñĞ? öáİ¤? Øì? Ğï? ùâ? í·îñ ?öáùâ ??ùê õËÚü óİı§? Í³üâõµ ?Ê¯ô¾İ¤ ùâûİ óİ? ?? ??åï Ï­âı ?øâ Øì? õËÚü öáİ¤? õËÚü ùâûİ ?? ùâ? ????õµ óİı§? ?Ê¯òÚ ????õµ ùâûİ ????õµ Ë¯?? ??ùê ?Ë·Úñ ñĞ??İ¤ ùâûİ Øì?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '??Êí Ù¹?ù¼Úñ ???×», Ü©??? ¡®??¡¯ ?Îıø·', 'ñĞ??İ¤ í·îñ ?Ê¯ô¾İ¤ ?øâ ù÷øÉİ¤óİ ???? ñĞ?äù Øì? ñĞ?äù õµ? Ë¯?? ?Ë·Úñ ????õµ øËÎ³ õµ? Ê«? Ï­âı ñĞ??İ¤ ????õµ Ğï? Ê«? Í³İ¤? ???? Û¶õµ? í·îñ ?öáùâ ???? Í³üâõµ ñĞİ¤ñĞ ñĞ??İ¤ ???? Û¶õµ? ñĞ??İ¤ ñĞ? ù÷øÉİ¤óİ ??åï ?ÜØ? ùâûİ ù÷øÉİ¤óİ ?øâ ù÷øÉİ¤óİ ?Ë·Úñ ?ÜØ? ûëï¤Üİ Ï­âı ı§óİİ¤ ùâûİ Ê«? Î¯ëÚóú õËÚü.

?öáı§ ùâ? ñĞ?äù ñĞ??İ¤ ù÷øÉİ¤óİ øÉ?? ????õµ ñĞİ¤ñĞ Î¯ëÚóú Î¯óİóİ í·îñ Í³üâõµ ??øĞ ùâ? ??ùê Ï­âı ?? ?ÜØ? Î¯ëÚóú ??øĞ ???? ñĞ??İ¤ óİı§? ı§óİİ¤ Øì? Øì? ùâûİ Ï­âı í·îñ Î¯ëÚóú ?öáùâ Í³üâõµ ?Ê¯òÚ ????õµ Ï­âı ????õµ í·îñ óİı§? Ê«?Ê«? øËÎ³ õËÚü óİ? Î¯óİóİ Øì? ?? öáİ¤? ñĞ??İ¤ ????õµ ?? ?Ê¯ô¾İ¤.

????õµ ?öáı§ ?? ñĞİ¤ñĞ ?öáùâ Û¶õµ? ñĞİ¤ñĞ ùâ? Øì? ûëï¤Üİ ñĞİ¤ñĞ Øì? ûëï¤Üİ ùâûİ óİ? Î¯óİóİ ?øâ ?? ?ÜØ? Î¯óİóİ Ê«?Ê«? ????õµ Ê«? ?Ê¯òÚ ??øĞ ?Ê¯òÚ ı§óİİ¤ öáİ¤? öáİ¤? øÉ?? Øì? ñĞ? óİı§? óİ? øÉ?? Ê«? Í³üâõµ øÉ?? ?ÜØ? ?? ?øâ øÉ?? ñĞ?äù ?Ê¯òÚ ?öáı§ ????õµ ??ùê Î¯óİóİ ñĞ? Ğï?.

Ï­âı ??åï ??åï Í³üâõµ ?Ê¯òÚ ?? öáİ¤? Í³İ¤? øËÎ³ Î¯ëÚóú ñĞ?äù ?öáùâ ??øĞ ñĞ? öáİ¤? Øì? Ğï? ùâ? í·îñ ?öáùâ ??ùê õËÚü óİı§? Í³üâõµ ?Ê¯ô¾İ¤ ùâûİ óİ? ?? ??åï Ï­âı ?øâ Øì? õËÚü öáİ¤? õËÚü ùâûİ ?? ùâ? ????õµ óİı§? ?Ê¯òÚ ????õµ ùâûİ ????õµ Ë¯?? ??ùê ?Ë·Úñ ñĞ??İ¤ ùâûİ Øì?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'õµİ¤ÜË ÖÇÊ¨ Íİ??? ø£? Ü©??? ¡®??¡¯', 'ñĞ??İ¤ í·îñ ?Ê¯ô¾İ¤ ?øâ ù÷øÉİ¤óİ ???? ñĞ?äù Øì? ñĞ?äù õµ? Ë¯?? ?Ë·Úñ ????õµ øËÎ³ õµ? Ê«? Ï­âı ñĞ??İ¤ ????õµ Ğï? Ê«? Í³İ¤? ???? Û¶õµ? í·îñ ?öáùâ ???? Í³üâõµ ñĞİ¤ñĞ ñĞ??İ¤ ???? Û¶õµ? ñĞ??İ¤ ñĞ? ù÷øÉİ¤óİ ??åï ?ÜØ? ùâûİ ù÷øÉİ¤óİ ?øâ ù÷øÉİ¤óİ ?Ë·Úñ ?ÜØ? ûëï¤Üİ Ï­âı ı§óİİ¤ ùâûİ Ê«? Î¯ëÚóú õËÚü.

?öáı§ ùâ? ñĞ?äù ñĞ??İ¤ ù÷øÉİ¤óİ øÉ?? ????õµ ñĞİ¤ñĞ Î¯ëÚóú Î¯óİóİ í·îñ Í³üâõµ ??øĞ ùâ? ??ùê Ï­âı ?? ?ÜØ? Î¯ëÚóú ??øĞ ???? ñĞ??İ¤ óİı§? ı§óİİ¤ Øì? Øì? ùâûİ Ï­âı í·îñ Î¯ëÚóú ?öáùâ Í³üâõµ ?Ê¯òÚ ????õµ Ï­âı ????õµ í·îñ óİı§? Ê«?Ê«? øËÎ³ õËÚü óİ? Î¯óİóİ Øì? ?? öáİ¤? ñĞ??İ¤ ????õµ ?? ?Ê¯ô¾İ¤.

????õµ ?öáı§ ?? ñĞİ¤ñĞ ?öáùâ Û¶õµ? ñĞİ¤ñĞ ùâ? Øì? ûëï¤Üİ ñĞİ¤ñĞ Øì? ûëï¤Üİ ùâûİ óİ? Î¯óİóİ ?øâ ?? ?ÜØ? Î¯óİóİ Ê«?Ê«? ????õµ Ê«? ?Ê¯òÚ ??øĞ ?Ê¯òÚ ı§óİİ¤ öáİ¤? öáİ¤? øÉ?? Øì? ñĞ? óİı§? óİ? øÉ?? Ê«? Í³üâõµ øÉ?? ?ÜØ? ?? ?øâ øÉ?? ñĞ?äù ?Ê¯òÚ ?öáı§ ????õµ ??ùê Î¯óİóİ ñĞ? Ğï?.

Ï­âı ??åï ??åï Í³üâõµ ?Ê¯òÚ ?? öáİ¤? Í³İ¤? øËÎ³ Î¯ëÚóú ñĞ?äù ?öáùâ ??øĞ ñĞ? öáİ¤? Øì? Ğï? ùâ? í·îñ ?öáùâ ??ùê õËÚü óİı§? Í³üâõµ ?Ê¯ô¾İ¤ ùâûİ óİ? ?? ??åï Ï­âı ?øâ Øì? õËÚü öáİ¤? õËÚü ùâûİ ?? ùâ? ????õµ óİı§? ?Ê¯òÚ ????õµ ùâûİ ????õµ Ë¯?? ??ùê ?Ë·Úñ ñĞ??İ¤ ùâûİ Øì?.', 10, '2022-12-31', 'member10');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, '??Êí?øË ??ÜË ?? ? ?İ¤ÜË åıï¤? ¡®ÏÑø·¡¯', 'ñĞ??İ¤ í·îñ ?Ê¯ô¾İ¤ ?øâ ù÷øÉİ¤óİ ???? ñĞ?äù Øì? ñĞ?äù õµ? Ë¯?? ?Ë·Úñ ????õµ øËÎ³ õµ? Ê«? Ï­âı ñĞ??İ¤ ????õµ Ğï? Ê«? Í³İ¤? ???? Û¶õµ? í·îñ ?öáùâ ???? Í³üâõµ ñĞİ¤ñĞ ñĞ??İ¤ ???? Û¶õµ? ñĞ??İ¤ ñĞ? ù÷øÉİ¤óİ ??åï ?ÜØ? ùâûİ ù÷øÉİ¤óİ ?øâ ù÷øÉİ¤óİ ?Ë·Úñ ?ÜØ? ûëï¤Üİ Ï­âı ı§óİİ¤ ùâûİ Ê«? Î¯ëÚóú õËÚü.

?öáı§ ùâ? ñĞ?äù ñĞ??İ¤ ù÷øÉİ¤óİ øÉ?? ????õµ ñĞİ¤ñĞ Î¯ëÚóú Î¯óİóİ í·îñ Í³üâõµ ??øĞ ùâ? ??ùê Ï­âı ?? ?ÜØ? Î¯ëÚóú ??øĞ ???? ñĞ??İ¤ óİı§? ı§óİİ¤ Øì? Øì? ùâûİ Ï­âı í·îñ Î¯ëÚóú ?öáùâ Í³üâõµ ?Ê¯òÚ ????õµ Ï­âı ????õµ í·îñ óİı§? Ê«?Ê«? øËÎ³ õËÚü óİ? Î¯óİóİ Øì? ?? öáİ¤? ñĞ??İ¤ ????õµ ?? ?Ê¯ô¾İ¤.

????õµ ?öáı§ ?? ñĞİ¤ñĞ ?öáùâ Û¶õµ? ñĞİ¤ñĞ ùâ? Øì? ûëï¤Üİ ñĞİ¤ñĞ Øì? ûëï¤Üİ ùâûİ óİ? Î¯óİóİ ?øâ ?? ?ÜØ? Î¯óİóİ Ê«?Ê«? ????õµ Ê«? ?Ê¯òÚ ??øĞ ?Ê¯òÚ ı§óİİ¤ öáİ¤? öáİ¤? øÉ?? Øì? ñĞ? óİı§? óİ? øÉ?? Ê«? Í³üâõµ øÉ?? ?ÜØ? ?? ?øâ øÉ?? ñĞ?äù ?Ê¯òÚ ?öáı§ ????õµ ??ùê Î¯óİóİ ñĞ? Ğï?.

Ï­âı ??åï ??åï Í³üâõµ ?Ê¯òÚ ?? öáİ¤? Í³İ¤? øËÎ³ Î¯ëÚóú ñĞ?äù ?öáùâ ??øĞ ñĞ? öáİ¤? Øì? Ğï? ùâ? í·îñ ?öáùâ ??ùê õËÚü óİı§? Í³üâõµ ?Ê¯ô¾İ¤ ùâûİ óİ? ?? ??åï Ï­âı ?øâ Øì? õËÚü öáİ¤? õËÚü ùâûİ ?? ùâ? ????õµ óİı§? ?Ê¯òÚ ????õµ ùâûİ ????õµ Ë¯?? ??ùê ?Ë·Úñ ñĞ??İ¤ ùâûİ Øì?.', 10, '2022-12-31', 'member10');


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

--???????÷û????? ?????, ????

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

insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '??ÕÉ ??? ??òÚ ×ùĞü??', '??ÕÉ ??? ??òÚ ×ùĞü?~



??? ?õ©? ??ãş? ?îÙÎ³ ı§??öá? Ï­, ×«? ? ?óİ Ñ·? ô¾? ? ? ?? ?? ??×ØñÕ? ??ÔôĞ¶íÄ?õµ. ø¢×³? ×³???? Üõ×ùÊµ ??ÕÉ ÊçíÄ? ïĞÍëóİ? Ï­??Ğ¥íÄ?õµ. ?? ?äï ?Ù¹Ôô? ??? ?? ÷÷øË ??ÕÉ ?ù¼? ÜÙ? ËåòÚÖ¯ ?Ğ¶íÄ?õµ. ??? Ëå?? ??, ûß?Öğ?ï¤øâ ?Óú?ï¤ÕÉ ??? ?üé Î¸?Ê¨ Ì°äù?? ?äôòÚ×³ ??! øÉÛå ??? ??? ??? İ«óİ? ÔôĞ¶íÄ?õµ. ??? ??? İ«óİ? ?? Ü©, ???? ?ÚÛòÚ×ù?íÄ?õµ. ', 1, '2022-10-28', 'member01');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?ùË ???ø·', '??åï Øì? ñĞ?äù õËÚü ñĞ??İ¤ Û¶õµ? Ğï? öáİ¤? ???? ?øâ õËÚü Û¶õµ? öáİ¤? ????õµ ?? ı§óİİ¤ Ê«? ????õµ ??ùê ñĞ?äù Û¶õµ? ???? Î¯ëÚóú ñĞ??İ¤ ñĞ?äù øËÎ³ ??ùê Ê«? ñĞ??İ¤ Ï­âı øËÎ³ ?ÜØ? ?ÜØ? ùâ? Ë¯?? ñĞ? ??ùê ?Ê¯ô¾İ¤ ?øâ ı§óİİ¤ ?øâ õËÚü Û¶õµ? õËÚü Øì? ñĞİ¤ñĞ ??øĞ Ğï? øËÎ³ õËÚü.

??åï öáİ¤? Ï­âı Í³İ¤? ?Ê¯ô¾İ¤ ñĞ? Ğï? Ê«?Ê«? ñĞ? ?ÜØ? óİ? õµ? Ê«? ùâûİ ??ùê ????õµ Í³üâõµ í·îñ ?Ë·Úñ ñĞİ¤ñĞ ñĞ?äù ùâûİ óİı§? Î¯óİóİ Û¶õµ? ?öáùâ Í³üâõµ Ê«? í·îñ ?öáı§ ????õµ õµ? ùâ? ?Ë·Úñ Í³İ¤? ????õµ Í³İ¤? Ê«?Ê«? õËÚü ñĞ? ?Ë·Úñ Ê«?Ê«? ????õµ øÉ?? õµ? ?Í» ???? Í³üâõµ ????õµ Ê«?Ê«?.

óİ? ?Ê¯ô¾İ¤ ùâ? ?Í» í·îñ øÉ?? ?öáùâ ?öáı§ Øì? Øì? Ê«? Ğï? Ï­âı ?? Î¯ëÚóú ?Ë·Úñ óİı§? øÉ?? Ë¯?? ?Í» ù÷øÉİ¤óİ Í³İ¤? ?Ë·Úñ ùâ? ?Ê¯ô¾İ¤ õµ? ?Ë·Úñ Û¶õµ? Ê«? ??ùê ùâûİ ñĞİ¤ñĞ ?Ê¯òÚ ı§óİİ¤ í·îñ ñĞİ¤ñĞ ñĞ??İ¤ ?Ë·Úñ ??øĞ Øì? Û¶õµ? Û¶õµ? ?Ê¯òÚ óİı§? ùâûİ ñĞ? øËÎ³ ?? Ğï? Í³İ¤?.

Í³üâõµ öáİ¤? ?Ê¯ô¾İ¤ ????õµ øËÎ³ ?ÜØ? Í³üâõµ ?øâ õµ? ??åï Ğï? ?öáùâ ?Ê¯òÚ Û¶õµ? Î¯ëÚóú ?ÜØ? ?öáı§ ??åï øËÎ³ øÉ?? Í³İ¤? ûëï¤Üİ Ê«?Ê«? óİı§? øËÎ³ Í³üâõµ ????õµ ?? Ï­âı ?öáı§ Î¯ëÚóú ?ÜØ? ????õµ Ï­âı Í³İ¤? ?Í» Ï­âı ñĞ? ?öáùâ Î¯ëÚóú óİ? ????õµ ı§óİİ¤ øËÎ³ Øì? ???? Î¯óİóİ ?Ê¯òÚ ?Ê¯ô¾İ¤ ı§óİİ¤.', 2, '2023-11-09', 'member02');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?? ???ø· ?', '????õµ øÉ?? ñĞ??İ¤ ñĞ?äù ??øĞ óİı§? Ï­âı ùâûİ ı§óİİ¤ í·îñ Øì? Ê«? ??åï ?? Ğï? Ğï? øÉ?? õËÚü ?öáùâ øËÎ³ ??åï ?öáùâ öáİ¤? ûëï¤Üİ ????õµ ùâûİ ?Í» ?Ê¯ô¾İ¤ óİ? õËÚü ?? ?Ê¯òÚ óİ? öáİ¤? Øì? øËÎ³ ?Í» Î¯ëÚóú ?ÜØ? Ê«?Ê«? Ê«? õËÚü ?Í» ñĞİ¤ñĞ ??ùê Øì? õµ? ñĞ?äù ?øâ Ê«?.

Î¯óİóİ ?Í» Í³üâõµ ?öáùâ óİ? Î¯óİóİ Ê«?Ê«? ñĞ? Ê«?Ê«? ñĞİ¤ñĞ ?Ê¯òÚ ?? ùâ? Í³üâõµ ñĞ?äù ????õµ Øì? ??åï ?Í» ???? ?ÜØ? ?öáı§ ùâ? ???? Ğï? ?øâ Û¶õµ? óİı§? Ê«?Ê«? øËÎ³ ?öáı§ Û¶õµ? ùâûİ ???? ?öáùâ ù÷øÉİ¤óİ øËÎ³ øÉ?? ûëï¤Üİ Í³İ¤? Ë¯?? Û¶õµ? õËÚü ?öáı§ ùâ? Í³üâõµ ?Ê¯ô¾İ¤ óİ? ı§óİİ¤ Ğï?.

óİ? Í³İ¤? Ï­âı öáİ¤? ????õµ Ê«? õËÚü óİı§? Î¯óİóİ ???? ?ÜØ? õËÚü ñĞİ¤ñĞ öáİ¤? ?Ë·Úñ ?ÜØ? Û¶õµ? Í³İ¤? öáİ¤? ı§óİİ¤ ùâûİ ñĞ??İ¤ øÉ?? í·îñ ?öáùâ Ğï? ?Ë·Úñ ?öáùâ Ï­âı Í³İ¤? Î¯ëÚóú ???? ??åï óİı§? ??åï ?Ê¯ô¾İ¤ ??ùê ù÷øÉİ¤óİ ?ÜØ? ñĞ?äù ?öáùâ ??ùê õËÚü ??åï ?Í» ñĞ? Øì? Í³üâõµ ?Í» Ê«?Ê«?.

ñĞ? Ë¯?? Î¯óİóİ ????õµ øÉ?? ùâ? ???? ù÷øÉİ¤óİ Ï­âı Ï­âı öáİ¤? Î¯óİóİ ?Ê¯ô¾İ¤ ?øâ ??øĞ ñĞ? ñĞ? ?? õµ? ù÷øÉİ¤óİ ???? ù÷øÉİ¤óİ ??ùê ûëï¤Üİ ?Ê¯òÚ ñĞ??İ¤ ñĞ? ?Ê¯òÚ Û¶õµ? óİı§? ????õµ öáİ¤? ?øâ Í³üâõµ ????õµ Í³üâõµ Í³İ¤? Î¯óİóİ ñĞ?äù Ë¯?? Û¶õµ? Ï­âı ù÷øÉİ¤óİ ?øâ öáİ¤? ùâûİ õµ? Ğï? õµ? ????.', 3, '2023-11-27', 'member03');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'øÉøËöá? ??? İ«?íÄ?õµ~', 'öáİ¤? Ê«? öáİ¤? Í³İ¤? óİı§? Øì? ñĞİ¤ñĞ ñĞ?äù Ê«?Ê«? ??ùê Ï­âı ûëï¤Üİ ûëï¤Üİ ùâûİ Î¯óİóİ ?Ê¯ô¾İ¤ Ë¯?? ??åï Ë¯?? ?? Ï­âı øËÎ³ ù÷øÉİ¤óİ óİı§? ????õµ Í³İ¤? ?öáùâ Øì? í·îñ øÉ?? ?öáı§ ı§óİİ¤ ı§óİİ¤ Ğï? óİ? ?Í» óİ? ùâûİ ??ùê Ê«? õµ? ?? ù÷øÉİ¤óİ ùâ? ñĞ?äù ???? ??åï ?øâ ??åï ?öáùâ.

ñĞİ¤ñĞ ?Í» Ê«? ?øâ ù÷øÉİ¤óİ õËÚü ùâûİ ??øĞ ????õµ ùâ? Ğï? óİ? ?Í» ?öáùâ Øì? ?Ê¯ô¾İ¤ öáİ¤? ?Ê¯ô¾İ¤ ?? ûëï¤Üİ ñĞİ¤ñĞ ûëï¤Üİ ?öáı§ ?öáùâ ù÷øÉİ¤óİ ??åï Î¯óİóİ Ê«?Ê«? Ë¯?? ?ÜØ? ùâ? ñĞ?äù Î¯óİóİ ı§óİİ¤ Û¶õµ? øÉ?? ñĞ??İ¤ Ê«? ?Ë·Úñ ñĞİ¤ñĞ Ğï? ????õµ öáİ¤? ?Ê¯ô¾İ¤ õËÚü ñĞ? ù÷øÉİ¤óİ ????õµ ñĞİ¤ñĞ ùâ?.

øËÎ³ óİı§? óİı§? ???? ???? Ê«? öáİ¤? Û¶õµ? Í³üâõµ í·îñ ??ùê ?Ê¯òÚ Øì? ????õµ ?Í» öáİ¤? Û¶õµ? ?öáı§ ?Í» ????õµ ñĞ? ñĞ??İ¤ ??øĞ Î¯ëÚóú Ë¯?? ?? Í³üâõµ ?öáı§ ???? ù÷øÉİ¤óİ ñĞ? ùâ? ???? Ï­âı ???? Î¯óİóİ ı§óİİ¤ ??åï õËÚü ????õµ Ë¯?? ?øâ ???? ùâ? ?ÜØ? ù÷øÉİ¤óİ ùâûİ ùâ? ?öáùâ ı§óİİ¤.

óİ? ??åï ù÷øÉİ¤óİ ùâ? ñĞ? Øì? ?? ñĞİ¤ñĞ ??ùê ??øĞ ??ùê ù÷øÉİ¤óİ ??ùê õËÚü ?öáı§ ????õµ ?øâ ùâ? ??øĞ õµ? ?öáı§ ?öáı§ ?öáùâ Ê«? ?Í» Û¶õµ? ?Ê¯òÚ Û¶õµ? Î¯óİóİ ??åï Î¯ëÚóú ?Í» ?Ê¯òÚ õµ? ùâûİ Û¶õµ? ñĞİ¤ñĞ ?ÜØ? ñĞ??İ¤ øËÎ³ ñĞİ¤ñĞ õµ? ?öáùâ ??øĞ ?ÜØ? ûëï¤Üİ ı§óİİ¤ ?Ê¯òÚ ?Ê¯òÚ Ğï?.', 4, '2023-10-04', 'member04');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '???? ??? İ«?íÄ?õµ.', 'ñĞ? ????õµ õËÚü ??ùê óİ? ùâ? ?öáı§ ùâ? Ë¯?? ????õµ ñĞ? óİı§? ?Ê¯òÚ ñĞ?äù Ê«? óİı§? õµ? ?öáùâ Ê«? ?øâ ????õµ Ï­âı Ê«? Øì? Í³İ¤? ?Ê¯ô¾İ¤ ?Í» óİ? ????õµ Î¯óİóİ Ğï? Øì? Ï­âı ?Ê¯òÚ ??øĞ ûëï¤Üİ Í³İ¤? ????õµ ?øâ ????õµ ??ùê ????õµ õµ? Ë¯?? øÉ?? Ê«?Ê«? Øì? í·îñ ù÷øÉİ¤óİ Û¶õµ?.

??åï ñĞ? ñĞİ¤ñĞ Ë¯?? ?? í·îñ ?Ê¯ô¾İ¤ Ğï? øÉ?? ??øĞ ????õµ óİı§? Í³İ¤? Í³üâõµ ı§óİİ¤ ùâ? ?Ë·Úñ ?øâ ù÷øÉİ¤óİ õµ? í·îñ Í³İ¤? øÉ?? ?Ë·Úñ ?Ê¯ô¾İ¤ ùâûİ ?Ê¯ô¾İ¤ ??ùê í·îñ ùâ? Ê«? ?øâ Î¯óİóİ ?Ê¯ô¾İ¤ ı§óİİ¤ Øì? Î¯óİóİ ?Ê¯òÚ öáİ¤? ?ÜØ? ?? ?? Î¯óİóİ Í³üâõµ ?öáùâ óİ? ????õµ ù÷øÉİ¤óİ Ï­âı õËÚü.

Î¯óİóİ ñĞİ¤ñĞ ûëï¤Üİ õËÚü ?Ë·Úñ Í³üâõµ Ï­âı óİ? ûëï¤Üİ öáİ¤? ùâ? ?öáı§ ?ÜØ? óİ? ?Ê¯òÚ ?ÜØ? øËÎ³ øËÎ³ Î¯óİóİ ???? í·îñ ???? ı§óİİ¤ ñĞ? ?Ê¯ô¾İ¤ Í³üâõµ ?øâ ñĞ? ?øâ Û¶õµ? Î¯ëÚóú ????õµ ñĞİ¤ñĞ ùâ? Ê«? ??ùê Ğï? Ë¯?? ????õµ ùâûİ Ğï? õËÚü ùâ? Î¯ëÚóú óİ? ??øĞ ?Ë·Úñ ùâûİ ??øĞ óİı§?.

ùâ? ñĞ?äù ?öáı§ Ğï? Í³İ¤? ùâ? Ê«?Ê«? ?Ë·Úñ Í³İ¤? ?öáùâ ùâ? ??åï Ï­âı õµ? ?Ê¯ô¾İ¤ ñĞİ¤ñĞ öáİ¤? øÉ?? ????õµ ??øĞ Øì? ??ùê ??ùê Ï­âı ñĞ??İ¤ ñĞİ¤ñĞ í·îñ ?öáùâ ?øâ ????õµ ?Ê¯òÚ í·îñ ????õµ ?öáı§ ??øĞ ??ùê ?öáùâ Ë¯?? ????õµ ñĞ??İ¤ ñĞ??İ¤ ?Í» ?öáùâ Ê«?Ê«? Í³İ¤? ??åï Ê«? Î¯ëÚóú ????õµ õËÚü.', 5, '2023-11-10', 'member05');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?İ¤ÕÉ ??? ??òÚ ×ùĞü?!', 'ñĞ?äù Î¯ëÚóú øÉ?? ???? ?Ë·Úñ Ê«?Ê«? öáİ¤? Î¯óİóİ Î¯ëÚóú Û¶õµ? õµ? ?Ê¯ô¾İ¤ ñĞİ¤ñĞ øÉ?? ?öáùâ ?Ê¯ô¾İ¤ ?Ê¯ô¾İ¤ óİı§? Í³İ¤? ñĞ??İ¤ Í³İ¤? ??øĞ ?? ?Í» øËÎ³ Î¯ëÚóú øÉ?? ?Ê¯òÚ ??åï ı§óİİ¤ ?Ê¯ô¾İ¤ Øì? Ê«?Ê«? Øì? õËÚü ?Ê¯òÚ Î¯ëÚóú ??øĞ ?ÜØ? ????õµ ?øâ ?öáùâ ñĞ? ?öáı§ ?Ê¯ô¾İ¤ Î¯óİóİ ?öáı§ ?Í» ????õµ Ê«?Ê«?.

ùâûİ ?? ?? ???? ı§óİİ¤ í·îñ ñĞİ¤ñĞ í·îñ Î¯óİóİ Ë¯?? óİ? ñĞ? ?øâ ???? ?Ë·Úñ øËÎ³ õµ? í·îñ øÉ?? ?Ê¯òÚ ??øĞ óİı§? ñĞ? ?öáùâ ûëï¤Üİ ?Ê¯ô¾İ¤ ?øâ Í³İ¤? õµ? ñĞ??İ¤ Î¯ëÚóú ù÷øÉİ¤óİ ?ÜØ? ?ÜØ? ñĞ? ????õµ ù÷øÉİ¤óİ ñĞ?äù ûëï¤Üİ ñĞ??İ¤ öáİ¤? øËÎ³ Í³İ¤? ???? ñĞ? ?Ê¯ô¾İ¤ Ë¯?? ?Ë·Úñ Í³İ¤? Û¶õµ?.

????õµ ??ùê Ï­âı Ë¯?? Ê«? ı§óİİ¤ ñĞ?äù ?Ê¯òÚ Í³üâõµ ????õµ ??åï Î¯óİóİ ???? ùâ? ı§óİİ¤ óİı§? öáİ¤? ñĞ??İ¤ Í³üâõµ ?ÜØ? ùâûİ ??åï Í³İ¤? Î¯óİóİ õËÚü õµ? ???? óİ? Î¯óİóİ Ï­âı ûëï¤Üİ ????õµ Í³İ¤? Ê«?Ê«? øËÎ³ öáİ¤? ñĞ?äù ??ùê ?öáùâ Î¯ëÚóú õµ? Ê«? ?Ê¯òÚ öáİ¤? ??øĞ ???? ?öáı§ õËÚü ??åï ?Ê¯ô¾İ¤.

öáİ¤? ?öáı§ ñĞİ¤ñĞ ùâûİ Øì? ñĞ??İ¤ õµ? óİı§? ?öáı§ ı§óİİ¤ ù÷øÉİ¤óİ øÉ?? Û¶õµ? ı§óİİ¤ ùâ? óİ? ñĞİ¤ñĞ Ï­âı Ê«? õµ? ?ÜØ? ?Ë·Úñ öáİ¤? öáİ¤? ?? ñĞ??İ¤ ñĞ? óİı§? Øì? Í³üâõµ í·îñ ı§óİİ¤ ???? Í³İ¤? ????õµ ñĞİ¤ñĞ ù÷øÉİ¤óİ ??ùê ?Ê¯òÚ ı§óİİ¤ ñĞ?äù Î¯ëÚóú ùâ? Î¯óİóİ Øì? óİ? ?Ë·Úñ ñĞİ¤ñĞ ñĞ?äù ?øâ.', 6, '2022-12-16', 'member06');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Í³ãµËÔ Íë?ÕÉ ???ø·', 'ûëï¤Üİ ?öáı§ ù÷øÉİ¤óİ ??ùê ñĞ?äù ?Ê¯òÚ ???? ùâ? ?ÜØ? ?öáı§ ùâûİ ùâ? Øì? øËÎ³ ı§óİİ¤ ñĞİ¤ñĞ ???? Ê«?Ê«? Î¯óİóİ Ê«? ???? ?? ñĞİ¤ñĞ öáİ¤? Ê«?Ê«? ?Ê¯òÚ ûëï¤Üİ öáİ¤? ?Ê¯òÚ ı§óİİ¤ ùâûİ õËÚü øÉ?? Ê«?Ê«? Ê«?Ê«? Í³üâõµ Î¯óİóİ ?öáı§ Ê«? ñĞİ¤ñĞ Î¯óİóİ ı§óİİ¤ ı§óİİ¤ ??ùê Í³İ¤? ñĞ??İ¤ ?öáùâ ù÷øÉİ¤óİ óİı§? ????.

Î¯ëÚóú ??øĞ õËÚü óİı§? øËÎ³ ?? ??øĞ Øì? Øì? ñĞ?äù öáİ¤? ?öáı§ Ê«?Ê«? Ê«?Ê«? Û¶õµ? õµ? ñĞİ¤ñĞ ù÷øÉİ¤óİ øËÎ³ Ë¯?? ñĞ?äù Û¶õµ? ??åï í·îñ ??øĞ ùâ? ??ùê ???? ùâ? Ê«? ûëï¤Üİ ?ÜØ? Øì? ?? ?? ?ÜØ? Ï­âı ?Ê¯ô¾İ¤ ı§óİİ¤ ??øĞ ñĞ??İ¤ Øì? ûëï¤Üİ ùâ? ù÷øÉİ¤óİ Ë¯?? ?? óİı§? ????õµ Ê«?.

Ë¯?? Û¶õµ? ??ùê õËÚü Ê«?Ê«? øÉ?? ùâûİ Ê«?Ê«? ?øâ øÉ?? Ê«?Ê«? Í³İ¤? Í³İ¤? ûëï¤Üİ ?Ë·Úñ Û¶õµ? ñĞ?äù ?Í» Ê«? Î¯óİóİ ñĞ? ????õµ öáİ¤? õËÚü øËÎ³ øÉ?? øÉ?? ?Ê¯òÚ í·îñ ?? ùâûİ Ë¯?? óİ? Ï­âı í·îñ Ê«? ????õµ Î¯óİóİ ?Ë·Úñ Û¶õµ? ?ÜØ? ????õµ ????õµ ?? Ê«? ñĞ??İ¤ õµ? ????õµ öáİ¤? óİı§?.

ûëï¤Üİ óİ? Í³üâõµ øËÎ³ ûëï¤Üİ Î¯ëÚóú ?Ê¯ô¾İ¤ Û¶õµ? ??ùê ùâûİ Øì? Ê«?Ê«? ù÷øÉİ¤óİ ?Ê¯ô¾İ¤ ??åï õµ? Ê«? ?ÜØ? ????õµ ùâ? öáİ¤? Ê«?Ê«? Ğï? Ï­âı Û¶õµ? í·îñ Í³üâõµ ñĞ? Í³İ¤? Ë¯?? ?Ê¯ô¾İ¤ øËÎ³ õµ? ?øâ ùâ? õµ? õËÚü Ğï? ?? Øì? ???? Î¯ëÚóú ı§óİİ¤ ù÷øÉİ¤óİ Í³üâõµ ?øâ ı§óİİ¤ Øì? ñĞ? ?Í».', 7, '2023-07-15', 'member07');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'öáİ¤?Ê¯×» 6ô®? :) ?? 8ûè? Ôõ ñĞ?ËÔ Ùø?!!', 'øÉ?? õµ? ?Ê¯ô¾İ¤ ñĞ??İ¤ Í³İ¤? Ë¯?? øËÎ³ Í³İ¤? óİ? Í³üâõµ ?ÜØ? ı§óİİ¤ õËÚü ?Ê¯ô¾İ¤ õËÚü óİ? ù÷øÉİ¤óİ ??ùê öáİ¤? ???? Ê«? Í³üâõµ øÉ?? ùâûİ Î¯óİóİ Ê«? ñĞ?äù Í³İ¤? õËÚü Øì? Í³İ¤? ?öáı§ øËÎ³ ?øâ ?öáı§ Î¯ëÚóú ûëï¤Üİ ?ÜØ? ?Ê¯òÚ ??øĞ ñĞ??İ¤ øËÎ³ ?ÜØ? ñĞİ¤ñĞ ??ùê ??åï ñĞİ¤ñĞ ñĞ??İ¤ ?ÜØ? ùâûİ.

??ùê ???? öáİ¤? ????õµ ?ÜØ? Í³İ¤? ?Ê¯òÚ ?öáı§ ??ùê ı§óİİ¤ ?ÜØ? Í³üâõµ øÉ?? øËÎ³ Ğï? Ê«? Í³İ¤? ?öáùâ ñĞ??İ¤ Ğï? ùâ? Í³İ¤? ùâ? õËÚü ñĞ??İ¤ ??øĞ í·îñ ?Ë·Úñ ñĞ??İ¤ óİ? ?Ê¯òÚ Û¶õµ? ı§óİİ¤ Ë¯?? ?Ê¯ô¾İ¤ ı§óİİ¤ Ğï? ?Ê¯ô¾İ¤ í·îñ Í³üâõµ ??åï Î¯ëÚóú ?öáı§ Ï­âı óİı§? ?Ë·Úñ ???? ù÷øÉİ¤óİ ??ùê ùâûİ.

Û¶õµ? ñĞ? Û¶õµ? óİ? óİ? ?öáùâ ??åï ????õµ ùâ? ñĞ??İ¤ Í³İ¤? ?ÜØ? ?öáùâ ñĞİ¤ñĞ óİı§? Ğï? ??ùê Øì? ?Í» Î¯óİóİ ?ÜØ? óİı§? óİ? ùâûİ Ê«? ?Ê¯òÚ Øì? Ë¯?? ñĞİ¤ñĞ ?Ê¯ô¾İ¤ Ï­âı Í³üâõµ ????õµ ı§óİİ¤ Ğï? Û¶õµ? Ê«? óİı§? ??åï öáİ¤? ?Í» ????õµ ?øâ ?öáùâ ñĞ??İ¤ ûëï¤Üİ ù÷øÉİ¤óİ ?Ê¯òÚ ?ÜØ? í·îñ.

?öáùâ ??øĞ ?ÜØ? öáİ¤? ?öáùâ ?Ë·Úñ ??ùê õµ? ñĞ?äù Ë¯?? ?? ?? Í³İ¤? ñĞ? øËÎ³ öáİ¤? óİı§? ?Ë·Úñ ñĞ?äù ù÷øÉİ¤óİ ùâ? Ê«? ????õµ Î¯ëÚóú ñĞ?äù ?øâ í·îñ Î¯óİóİ ?öáùâ Ğï? Î¯óİóİ ?Ê¯òÚ Û¶õµ? ùâ? ñĞ? ????õµ óİ? ñĞ?äù Í³üâõµ Û¶õµ? ??øĞ øËÎ³ ùâûİ Í³üâõµ ?öáùâ ûëï¤Üİ ?Ê¯ô¾İ¤ ñĞİ¤ñĞ ñĞ?äù ??.', 8, '2022-11-29', 'member08');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'îéİÃ ???ø·', 'øÉ?? Î¯óİóİ ?öáı§ öáİ¤? ??åï ùâ? ?öáùâ Ê«? Ğï? õËÚü ùâûİ ???? ûëï¤Üİ ûëï¤Üİ ??åï ?Ê¯òÚ ?Í» ûëï¤Üİ Ï­âı ?Ê¯òÚ ???? í·îñ ????õµ ?? Ê«? öáİ¤? ñĞ??İ¤ ûëï¤Üİ óİ? õËÚü øËÎ³ ùâûİ ñĞ?äù ?Ê¯òÚ ?ÜØ? Í³İ¤? Î¯óİóİ ?öáı§ óİı§? ñĞ??İ¤ øËÎ³ ?Ê¯òÚ Í³İ¤? øÉ?? ùâ? Í³üâõµ Ï­âı õËÚü ?Ë·Úñ Í³üâõµ.

ù÷øÉİ¤óİ õµ? ñĞ?äù ñĞ? ù÷øÉİ¤óİ Í³İ¤? Í³üâõµ ?? Ğï? ?Ë·Úñ ûëï¤Üİ ?øâ ?öáùâ Øì? ?Ë·Úñ öáİ¤? õµ? Î¯ëÚóú Ê«?Ê«? ñĞ?äù Î¯óİóİ ûëï¤Üİ Í³İ¤? ñĞ?äù öáİ¤? ?ÜØ? ?Í» ??åï ???? ?Í» öáİ¤? ı§óİİ¤ ?öáı§ óİı§? ??åï ?Ê¯ô¾İ¤ í·îñ ?Ê¯òÚ Ï­âı Øì? Ê«?Ê«? í·îñ ?? ?Ê¯ô¾İ¤ ??ùê ??øĞ óİı§? Í³İ¤? ù÷øÉİ¤óİ ñĞ?äù.

??åï ?Í» ?Ê¯òÚ ûëï¤Üİ Î¯ëÚóú Í³üâõµ ù÷øÉİ¤óİ ?ÜØ? ????õµ ?øâ ùâ? Û¶õµ? ñĞ? óİ? Ğï? ?öáùâ ??åï ?öáùâ Ê«?Ê«? Ë¯?? øËÎ³ ?Ë·Úñ Øì? ?öáı§ øÉ?? Ê«?Ê«? õµ? ?öáı§ Øì? ı§óİİ¤ ñĞ?äù ????õµ ??ùê ñĞ?äù óİı§? ñĞ? ?Í» ??ùê øÉ?? ñĞ??İ¤ ??øĞ ùâ? ñĞ??İ¤ ?øâ õËÚü ??åï öáİ¤? ?Í» øËÎ³ ??.

Ğï? ñĞ??İ¤ ???? ?Ê¯òÚ Î¯ëÚóú í·îñ ùâ? óİ? óİı§? ???? óİı§? ?Ë·Úñ ????õµ Í³İ¤? öáİ¤? ?öáı§ öáİ¤? ?öáı§ ??åï ù÷øÉİ¤óİ ñĞİ¤ñĞ Ê«? ùâûİ ??ùê ????õµ ????õµ ı§óİİ¤ ùâûİ ?Í» ??åï Í³İ¤? ????õµ øËÎ³ ı§óİİ¤ Ê«? Øì? Í³üâõµ óİ? Í³üâõµ ñĞ? ùâûİ øËÎ³ øËÎ³ øËÎ³ Í³üâõµ óİ? ?öáùâ ûëï¤Üİ ùâ? ?øâ.', 9, '2023-01-12', 'member09');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '??? ???ø·', '?øâ ?? ?? ùâûİ ù÷øÉİ¤óİ ñĞ? ñĞ??İ¤ Í³İ¤? øËÎ³ ???? ı§óİİ¤ ?Ê¯ô¾İ¤ ñĞ?äù Øì? ù÷øÉİ¤óİ ????õµ ı§óİİ¤ Øì? ù÷øÉİ¤óİ Í³üâõµ ??ùê õËÚü ??åï ?Ë·Úñ ñĞ? õËÚü ûëï¤Üİ ????õµ ù÷øÉİ¤óİ ù÷øÉİ¤óİ ?ÜØ? ù÷øÉİ¤óİ ?öáı§ ñĞ? ùâûİ ñĞ??İ¤ Í³üâõµ ı§óİİ¤ ??åï Í³üâõµ öáİ¤? ??åï Ê«?Ê«? ????õµ ?øâ ?öáı§ óİı§? ùâ? ñĞ? óİı§?.

ùâ? õµ? Øì? óİı§? ????õµ ?öáı§ ûëï¤Üİ ñĞ??İ¤ õµ? õµ? Î¯ëÚóú ?? Ê«?Ê«? ùâ? ????õµ í·îñ öáİ¤? öáİ¤? Í³üâõµ ?øâ ?Ê¯òÚ ùâ? øËÎ³ ?Ë·Úñ øÉ?? ı§óİİ¤ ????õµ ????õµ ñĞ? ??ùê ??øĞ ???? ?ÜØ? õµ? Øì? ûëï¤Üİ í·îñ ñĞİ¤ñĞ Í³üâõµ ?öáùâ Í³üâõµ Ë¯?? Ï­âı ù÷øÉİ¤óİ ??åï Øì? Í³üâõµ Î¯ëÚóú ?? ??øĞ.

Ï­âı ù÷øÉİ¤óİ ñĞ? ù÷øÉİ¤óİ ùâûİ öáİ¤? õµ? ù÷øÉİ¤óİ ?? õËÚü ?? õËÚü ?? ??øĞ øËÎ³ ?Í» ùâ? õµ? Í³İ¤? Øì? ?öáı§ Ê«? õËÚü Î¯ëÚóú ûëï¤Üİ ?Ê¯òÚ í·îñ ???? óİı§? øÉ?? í·îñ Û¶õµ? ?ÜØ? ù÷øÉİ¤óİ ı§óİİ¤ óİı§? í·îñ ?öáùâ Ğï? Ï­âı Ê«? ùâûİ ????õµ ı§óİİ¤ ?ÜØ? ?Í» Í³üâõµ ??ùê Í³İ¤? Ê«?.

ûëï¤Üİ Ê«? ñĞ? ûëï¤Üİ õµ? õËÚü Ï­âı ñĞ? ùâ? Î¯ëÚóú ???? ??åï ûëï¤Üİ Û¶õµ? öáİ¤? ????õµ õµ? ?öáı§ Í³üâõµ ????õµ ????õµ óİı§? Ê«? Í³İ¤? ????õµ ?öáùâ ñĞİ¤ñĞ ??åï ???? Ğï? ñĞ??İ¤ Øì? Ê«?Ê«? ?Í» ??ùê øËÎ³ ?öáı§ ?Ê¯òÚ Û¶õµ? ????õµ ?øâ øÉ?? ?öáı§ ù÷øÉİ¤óİ ?öáùâ Î¯ëÚóú ñĞ??İ¤ ?øâ Û¶õµ? ?öáı§.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?øË ???ø·', '?øâ ?? ?? ùâûİ ù÷øÉİ¤óİ ñĞ? ñĞ??İ¤ Í³İ¤? øËÎ³ ???? ı§óİİ¤ ?Ê¯ô¾İ¤ ñĞ?äù Øì? ù÷øÉİ¤óİ ????õµ ı§óİİ¤ Øì? ù÷øÉİ¤óİ Í³üâõµ ??ùê õËÚü ??åï ?Ë·Úñ ñĞ? õËÚü ûëï¤Üİ ????õµ ù÷øÉİ¤óİ ù÷øÉİ¤óİ ?ÜØ? ù÷øÉİ¤óİ ?öáı§ ñĞ? ùâûİ ñĞ??İ¤ Í³üâõµ ı§óİİ¤ ??åï Í³üâõµ öáİ¤? ??åï Ê«?Ê«? ????õµ ?øâ ?öáı§ óİı§? ùâ? ñĞ? óİı§?.

ùâ? õµ? Øì? óİı§? ????õµ ?öáı§ ûëï¤Üİ ñĞ??İ¤ õµ? õµ? Î¯ëÚóú ?? Ê«?Ê«? ùâ? ????õµ í·îñ öáİ¤? öáİ¤? Í³üâõµ ?øâ ?Ê¯òÚ ùâ? øËÎ³ ?Ë·Úñ øÉ?? ı§óİİ¤ ????õµ ????õµ ñĞ? ??ùê ??øĞ ???? ?ÜØ? õµ? Øì? ûëï¤Üİ í·îñ ñĞİ¤ñĞ Í³üâõµ ?öáùâ Í³üâõµ Ë¯?? Ï­âı ù÷øÉİ¤óİ ??åï Øì? Í³üâõµ Î¯ëÚóú ?? ??øĞ.

Ï­âı ù÷øÉİ¤óİ ñĞ? ù÷øÉİ¤óİ ùâûİ öáİ¤? õµ? ù÷øÉİ¤óİ ?? õËÚü ?? õËÚü ?? ??øĞ øËÎ³ ?Í» ùâ? õµ? Í³İ¤? Øì? ?öáı§ Ê«? õËÚü Î¯ëÚóú ûëï¤Üİ ?Ê¯òÚ í·îñ ???? óİı§? øÉ?? í·îñ Û¶õµ? ?ÜØ? ù÷øÉİ¤óİ ı§óİİ¤ óİı§? í·îñ ?öáùâ Ğï? Ï­âı Ê«? ùâûİ ????õµ ı§óİİ¤ ?ÜØ? ?Í» Í³üâõµ ??ùê Í³İ¤? Ê«?.

ûëï¤Üİ Ê«? ñĞ? ûëï¤Üİ õµ? õËÚü Ï­âı ñĞ? ùâ? Î¯ëÚóú ???? ??åï ûëï¤Üİ Û¶õµ? öáİ¤? ????õµ õµ? ?öáı§ Í³üâõµ ????õµ ????õµ óİı§? Ê«? Í³İ¤? ????õµ ?öáùâ ñĞİ¤ñĞ ??åï ???? Ğï? ñĞ??İ¤ Øì? Ê«?Ê«? ?Í» ??ùê øËÎ³ ?öáı§ ?Ê¯òÚ Û¶õµ? ????õµ ?øâ øÉ?? ?öáı§ ù÷øÉİ¤óİ ?öáùâ Î¯ëÚóú ñĞ??İ¤ ?øâ Û¶õµ? ?öáı§.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Î¯Î¯ ???ø·', '?øâ ?? ?? ùâûİ ù÷øÉİ¤óİ ñĞ? ñĞ??İ¤ Í³İ¤? øËÎ³ ???? ı§óİİ¤ ?Ê¯ô¾İ¤ ñĞ?äù Øì? ù÷øÉİ¤óİ ????õµ ı§óİİ¤ Øì? ù÷øÉİ¤óİ Í³üâõµ ??ùê õËÚü ??åï ?Ë·Úñ ñĞ? õËÚü ûëï¤Üİ ????õµ ù÷øÉİ¤óİ ù÷øÉİ¤óİ ?ÜØ? ù÷øÉİ¤óİ ?öáı§ ñĞ? ùâûİ ñĞ??İ¤ Í³üâõµ ı§óİİ¤ ??åï Í³üâõµ öáİ¤? ??åï Ê«?Ê«? ????õµ ?øâ ?öáı§ óİı§? ùâ? ñĞ? óİı§?.

ùâ? õµ? Øì? óİı§? ????õµ ?öáı§ ûëï¤Üİ ñĞ??İ¤ õµ? õµ? Î¯ëÚóú ?? Ê«?Ê«? ùâ? ????õµ í·îñ öáİ¤? öáİ¤? Í³üâõµ ?øâ ?Ê¯òÚ ùâ? øËÎ³ ?Ë·Úñ øÉ?? ı§óİİ¤ ????õµ ????õµ ñĞ? ??ùê ??øĞ ???? ?ÜØ? õµ? Øì? ûëï¤Üİ í·îñ ñĞİ¤ñĞ Í³üâõµ ?öáùâ Í³üâõµ Ë¯?? Ï­âı ù÷øÉİ¤óİ ??åï Øì? Í³üâõµ Î¯ëÚóú ?? ??øĞ.

Ï­âı ù÷øÉİ¤óİ ñĞ? ù÷øÉİ¤óİ ùâûİ öáİ¤? õµ? ù÷øÉİ¤óİ ?? õËÚü ?? õËÚü ?? ??øĞ øËÎ³ ?Í» ùâ? õµ? Í³İ¤? Øì? ?öáı§ Ê«? õËÚü Î¯ëÚóú ûëï¤Üİ ?Ê¯òÚ í·îñ ???? óİı§? øÉ?? í·îñ Û¶õµ? ?ÜØ? ù÷øÉİ¤óİ ı§óİİ¤ óİı§? í·îñ ?öáùâ Ğï? Ï­âı Ê«? ùâûİ ????õµ ı§óİİ¤ ?ÜØ? ?Í» Í³üâõµ ??ùê Í³İ¤? Ê«?.

ûëï¤Üİ Ê«? ñĞ? ûëï¤Üİ õµ? õËÚü Ï­âı ñĞ? ùâ? Î¯ëÚóú ???? ??åï ûëï¤Üİ Û¶õµ? öáİ¤? ????õµ õµ? ?öáı§ Í³üâõµ ????õµ ????õµ óİı§? Ê«? Í³İ¤? ????õµ ?öáùâ ñĞİ¤ñĞ ??åï ???? Ğï? ñĞ??İ¤ Øì? Ê«?Ê«? ?Í» ??ùê øËÎ³ ?öáı§ ?Ê¯òÚ Û¶õµ? ????õµ ?øâ øÉ?? ?öáı§ ù÷øÉİ¤óİ ?öáùâ Î¯ëÚóú ñĞ??İ¤ ?øâ Û¶õµ? ?öáı§.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Ò½øË? ???ø·', '?øâ ?? ?? ùâûİ ù÷øÉİ¤óİ ñĞ? ñĞ??İ¤ Í³İ¤? øËÎ³ ???? ı§óİİ¤ ?Ê¯ô¾İ¤ ñĞ?äù Øì? ù÷øÉİ¤óİ ????õµ ı§óİİ¤ Øì? ù÷øÉİ¤óİ Í³üâõµ ??ùê õËÚü ??åï ?Ë·Úñ ñĞ? õËÚü ûëï¤Üİ ????õµ ù÷øÉİ¤óİ ù÷øÉİ¤óİ ?ÜØ? ù÷øÉİ¤óİ ?öáı§ ñĞ? ùâûİ ñĞ??İ¤ Í³üâõµ ı§óİİ¤ ??åï Í³üâõµ öáİ¤? ??åï Ê«?Ê«? ????õµ ?øâ ?öáı§ óİı§? ùâ? ñĞ? óİı§?.

ùâ? õµ? Øì? óİı§? ????õµ ?öáı§ ûëï¤Üİ ñĞ??İ¤ õµ? õµ? Î¯ëÚóú ?? Ê«?Ê«? ùâ? ????õµ í·îñ öáİ¤? öáİ¤? Í³üâõµ ?øâ ?Ê¯òÚ ùâ? øËÎ³ ?Ë·Úñ øÉ?? ı§óİİ¤ ????õµ ????õµ ñĞ? ??ùê ??øĞ ???? ?ÜØ? õµ? Øì? ûëï¤Üİ í·îñ ñĞİ¤ñĞ Í³üâõµ ?öáùâ Í³üâõµ Ë¯?? Ï­âı ù÷øÉİ¤óİ ??åï Øì? Í³üâõµ Î¯ëÚóú ?? ??øĞ.

Ï­âı ù÷øÉİ¤óİ ñĞ? ù÷øÉİ¤óİ ùâûİ öáİ¤? õµ? ù÷øÉİ¤óİ ?? õËÚü ?? õËÚü ?? ??øĞ øËÎ³ ?Í» ùâ? õµ? Í³İ¤? Øì? ?öáı§ Ê«? õËÚü Î¯ëÚóú ûëï¤Üİ ?Ê¯òÚ í·îñ ???? óİı§? øÉ?? í·îñ Û¶õµ? ?ÜØ? ù÷øÉİ¤óİ ı§óİİ¤ óİı§? í·îñ ?öáùâ Ğï? Ï­âı Ê«? ùâûİ ????õµ ı§óİİ¤ ?ÜØ? ?Í» Í³üâõµ ??ùê Í³İ¤? Ê«?.

ûëï¤Üİ Ê«? ñĞ? ûëï¤Üİ õµ? õËÚü Ï­âı ñĞ? ùâ? Î¯ëÚóú ???? ??åï ûëï¤Üİ Û¶õµ? öáİ¤? ????õµ õµ? ?öáı§ Í³üâõµ ????õµ ????õµ óİı§? Ê«? Í³İ¤? ????õµ ?öáùâ ñĞİ¤ñĞ ??åï ???? Ğï? ñĞ??İ¤ Øì? Ê«?Ê«? ?Í» ??ùê øËÎ³ ?öáı§ ?Ê¯òÚ Û¶õµ? ????õµ ?øâ øÉ?? ?öáı§ ù÷øÉİ¤óİ ?öáùâ Î¯ëÚóú ñĞ??İ¤ ?øâ Û¶õµ? ?öáı§.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'ıªäù ???ø·', '?øâ ?? ?? ùâûİ ù÷øÉİ¤óİ ñĞ? ñĞ??İ¤ Í³İ¤? øËÎ³ ???? ı§óİİ¤ ?Ê¯ô¾İ¤ ñĞ?äù Øì? ù÷øÉİ¤óİ ????õµ ı§óİİ¤ Øì? ù÷øÉİ¤óİ Í³üâõµ ??ùê õËÚü ??åï ?Ë·Úñ ñĞ? õËÚü ûëï¤Üİ ????õµ ù÷øÉİ¤óİ ù÷øÉİ¤óİ ?ÜØ? ù÷øÉİ¤óİ ?öáı§ ñĞ? ùâûİ ñĞ??İ¤ Í³üâõµ ı§óİİ¤ ??åï Í³üâõµ öáİ¤? ??åï Ê«?Ê«? ????õµ ?øâ ?öáı§ óİı§? ùâ? ñĞ? óİı§?.

ùâ? õµ? Øì? óİı§? ????õµ ?öáı§ ûëï¤Üİ ñĞ??İ¤ õµ? õµ? Î¯ëÚóú ?? Ê«?Ê«? ùâ? ????õµ í·îñ öáİ¤? öáİ¤? Í³üâõµ ?øâ ?Ê¯òÚ ùâ? øËÎ³ ?Ë·Úñ øÉ?? ı§óİİ¤ ????õµ ????õµ ñĞ? ??ùê ??øĞ ???? ?ÜØ? õµ? Øì? ûëï¤Üİ í·îñ ñĞİ¤ñĞ Í³üâõµ ?öáùâ Í³üâõµ Ë¯?? Ï­âı ù÷øÉİ¤óİ ??åï Øì? Í³üâõµ Î¯ëÚóú ?? ??øĞ.

Ï­âı ù÷øÉİ¤óİ ñĞ? ù÷øÉİ¤óİ ùâûİ öáİ¤? õµ? ù÷øÉİ¤óİ ?? õËÚü ?? õËÚü ?? ??øĞ øËÎ³ ?Í» ùâ? õµ? Í³İ¤? Øì? ?öáı§ Ê«? õËÚü Î¯ëÚóú ûëï¤Üİ ?Ê¯òÚ í·îñ ???? óİı§? øÉ?? í·îñ Û¶õµ? ?ÜØ? ù÷øÉİ¤óİ ı§óİİ¤ óİı§? í·îñ ?öáùâ Ğï? Ï­âı Ê«? ùâûİ ????õµ ı§óİİ¤ ?ÜØ? ?Í» Í³üâõµ ??ùê Í³İ¤? Ê«?.

ûëï¤Üİ Ê«? ñĞ? ûëï¤Üİ õµ? õËÚü Ï­âı ñĞ? ùâ? Î¯ëÚóú ???? ??åï ûëï¤Üİ Û¶õµ? öáİ¤? ????õµ õµ? ?öáı§ Í³üâõµ ????õµ ????õµ óİı§? Ê«? Í³İ¤? ????õµ ?öáùâ ñĞİ¤ñĞ ??åï ???? Ğï? ñĞ??İ¤ Øì? Ê«?Ê«? ?Í» ??ùê øËÎ³ ?öáı§ ?Ê¯òÚ Û¶õµ? ????õµ ?øâ øÉ?? ?öáı§ ù÷øÉİ¤óİ ?öáùâ Î¯ëÚóú ñĞ??İ¤ ?øâ Û¶õµ? ?öáı§.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'ñÕóİ? ???ø·', '?øâ ?? ?? ùâûİ ù÷øÉİ¤óİ ñĞ? ñĞ??İ¤ Í³İ¤? øËÎ³ ???? ı§óİİ¤ ?Ê¯ô¾İ¤ ñĞ?äù Øì? ù÷øÉİ¤óİ ????õµ ı§óİİ¤ Øì? ù÷øÉİ¤óİ Í³üâõµ ??ùê õËÚü ??åï ?Ë·Úñ ñĞ? õËÚü ûëï¤Üİ ????õµ ù÷øÉİ¤óİ ù÷øÉİ¤óİ ?ÜØ? ù÷øÉİ¤óİ ?öáı§ ñĞ? ùâûİ ñĞ??İ¤ Í³üâõµ ı§óİİ¤ ??åï Í³üâõµ öáİ¤? ??åï Ê«?Ê«? ????õµ ?øâ ?öáı§ óİı§? ùâ? ñĞ? óİı§?.

ùâ? õµ? Øì? óİı§? ????õµ ?öáı§ ûëï¤Üİ ñĞ??İ¤ õµ? õµ? Î¯ëÚóú ?? Ê«?Ê«? ùâ? ????õµ í·îñ öáİ¤? öáİ¤? Í³üâõµ ?øâ ?Ê¯òÚ ùâ? øËÎ³ ?Ë·Úñ øÉ?? ı§óİİ¤ ????õµ ????õµ ñĞ? ??ùê ??øĞ ???? ?ÜØ? õµ? Øì? ûëï¤Üİ í·îñ ñĞİ¤ñĞ Í³üâõµ ?öáùâ Í³üâõµ Ë¯?? Ï­âı ù÷øÉİ¤óİ ??åï Øì? Í³üâõµ Î¯ëÚóú ?? ??øĞ.

Ï­âı ù÷øÉİ¤óİ ñĞ? ù÷øÉİ¤óİ ùâûİ öáİ¤? õµ? ù÷øÉİ¤óİ ?? õËÚü ?? õËÚü ?? ??øĞ øËÎ³ ?Í» ùâ? õµ? Í³İ¤? Øì? ?öáı§ Ê«? õËÚü Î¯ëÚóú ûëï¤Üİ ?Ê¯òÚ í·îñ ???? óİı§? øÉ?? í·îñ Û¶õµ? ?ÜØ? ù÷øÉİ¤óİ ı§óİİ¤ óİı§? í·îñ ?öáùâ Ğï? Ï­âı Ê«? ùâûİ ????õµ ı§óİİ¤ ?ÜØ? ?Í» Í³üâõµ ??ùê Í³İ¤? Ê«?.

ûëï¤Üİ Ê«? ñĞ? ûëï¤Üİ õµ? õËÚü Ï­âı ñĞ? ùâ? Î¯ëÚóú ???? ??åï ûëï¤Üİ Û¶õµ? öáİ¤? ????õµ õµ? ?öáı§ Í³üâõµ ????õµ ????õµ óİı§? Ê«? Í³İ¤? ????õµ ?öáùâ ñĞİ¤ñĞ ??åï ???? Ğï? ñĞ??İ¤ Øì? Ê«?Ê«? ?Í» ??ùê øËÎ³ ?öáı§ ?Ê¯òÚ Û¶õµ? ????õµ ?øâ øÉ?? ?öáı§ ù÷øÉİ¤óİ ?öáùâ Î¯ëÚóú ñĞ??İ¤ ?øâ Û¶õµ? ?öáı§.', 10, '2023-04-23', 'member10');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, '?? ???ø·', '?øâ ?? ?? ùâûİ ù÷øÉİ¤óİ ñĞ? ñĞ??İ¤ Í³İ¤? øËÎ³ ???? ı§óİİ¤ ?Ê¯ô¾İ¤ ñĞ?äù Øì? ù÷øÉİ¤óİ ????õµ ı§óİİ¤ Øì? ù÷øÉİ¤óİ Í³üâõµ ??ùê õËÚü ??åï ?Ë·Úñ ñĞ? õËÚü ûëï¤Üİ ????õµ ù÷øÉİ¤óİ ù÷øÉİ¤óİ ?ÜØ? ù÷øÉİ¤óİ ?öáı§ ñĞ? ùâûİ ñĞ??İ¤ Í³üâõµ ı§óİİ¤ ??åï Í³üâõµ öáİ¤? ??åï Ê«?Ê«? ????õµ ?øâ ?öáı§ óİı§? ùâ? ñĞ? óİı§?.

ùâ? õµ? Øì? óİı§? ????õµ ?öáı§ ûëï¤Üİ ñĞ??İ¤ õµ? õµ? Î¯ëÚóú ?? Ê«?Ê«? ùâ? ????õµ í·îñ öáİ¤? öáİ¤? Í³üâõµ ?øâ ?Ê¯òÚ ùâ? øËÎ³ ?Ë·Úñ øÉ?? ı§óİİ¤ ????õµ ????õµ ñĞ? ??ùê ??øĞ ???? ?ÜØ? õµ? Øì? ûëï¤Üİ í·îñ ñĞİ¤ñĞ Í³üâõµ ?öáùâ Í³üâõµ Ë¯?? Ï­âı ù÷øÉİ¤óİ ??åï Øì? Í³üâõµ Î¯ëÚóú ?? ??øĞ.

Ï­âı ù÷øÉİ¤óİ ñĞ? ù÷øÉİ¤óİ ùâûİ öáİ¤? õµ? ù÷øÉİ¤óİ ?? õËÚü ?? õËÚü ?? ??øĞ øËÎ³ ?Í» ùâ? õµ? Í³İ¤? Øì? ?öáı§ Ê«? õËÚü Î¯ëÚóú ûëï¤Üİ ?Ê¯òÚ í·îñ ???? óİı§? øÉ?? í·îñ Û¶õµ? ?ÜØ? ù÷øÉİ¤óİ ı§óİİ¤ óİı§? í·îñ ?öáùâ Ğï? Ï­âı Ê«? ùâûİ ????õµ ı§óİİ¤ ?ÜØ? ?Í» Í³üâõµ ??ùê Í³İ¤? Ê«?.

ûëï¤Üİ Ê«? ñĞ? ûëï¤Üİ õµ? õËÚü Ï­âı ñĞ? ùâ? Î¯ëÚóú ???? ??åï ûëï¤Üİ Û¶õµ? öáİ¤? ????õµ õµ? ?öáı§ Í³üâõµ ????õµ ????õµ óİı§? Ê«? Í³İ¤? ????õµ ?öáùâ ñĞİ¤ñĞ ??åï ???? Ğï? ñĞ??İ¤ Øì? Ê«?Ê«? ?Í» ??ùê øËÎ³ ?öáı§ ?Ê¯òÚ Û¶õµ? ????õµ ?øâ øÉ?? ?öáı§ ù÷øÉİ¤óİ ?öáùâ Î¯ëÚóú ñĞ??İ¤ ?øâ Û¶õµ? ?öáı§.', 10, '2023-04-23', 'member10');

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

--?îõ?????

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

insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '? ?ø·Úè??ÌùÚñ ???? ?ø·Úèùì?ÌùÚñ ?? ?', 'Ï­âı?Ğü? ?ø·Úè??ÌùÚñ??õµ.^^

???ğÂ ???? ?ø·ÓúÍò ø²?ãµ??? ??øåÕÉ,
?ø·Úè??ÌùÚñ ???? ??ÔôĞ¶íÄ?õµ.

?ø·Úè??ÌùÚñÕÉ åïĞã? ???? ?ø·ÓúÍò ØÔø·ÜË ??ø²??øË,
?õµ ??ûÏÜØ? Ì³Öï?ÊÇ ? ???? ÷é? Ì«××?Ê¨,
?ø·Úèİ«? ñĞ?äù ?ø·Íí Î² ä¹? ?ø·ÓúÍòñÕ ğÂÊµ ?? ??Úñ?
Ì³Öï?ÊÇ ? ?? ÕôÛ¨???íÄ?õµ.

?Êµ Ï­?? Î² ×à?ø· ?×»ÜË ÍİÊµ ?ø·ÓúÍò ùì? Î² ùì?Î¸ø· ÙÍÍµ?øÃ ?ïĞ? åïĞãÔô???? ÜÙ? ???îÖ?,
???? ?ÛªÓúÍòñÕ? ?××ÕÉ Ïç÷ú? ÕôÛ¨òÚ×ù?Ü© Î¯ì»?õµ.

ÜÙ? ?? ù¼??İ¤?íÄ?õµ. ????õµ. ^^', '2013-01-31', 4248, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '	Ï­???×»! ?ø·ÓúÍò? ?Úè?????~¡Á', '?? ??øË ?ø·Úè,?ø·Íí,?ø·ÓúÍò? ???? ??ÊÇ ÷úöá,
×¶? "?ø·ÓúÍò ??×ğ??õµ" ?ïĞñÕ ?Ûª×ù?ø· Î¯ì»?õµ.

øÉİ¤? õ»×Ø ??ó¦ ??? Ï­ÔôÊÇ ÷úöá,
òÚõ» ÊÇ?×»?ÕÉ ?ø·ÓúÍò??Ê«ñÕ ú¬??? ?ø·?? Ôô×»İ«,
( http://www.zooseyo.or.kr/Yu_board/safecenter.html )

?ø·ÓúÍò??Ê«ñÕ ?ø·ÊÇ ÷úöá 1×ù~2×ùÓúÏ­ ×ùÖï? ØÔñĞ?×» Ï¿?? Ï­??ÜË ?ùË? ÷úöá? ğÂù¼ùì?ÍéøË,
?Ûí ÷úöá Ê«×ğÊµ ??? ÍİòÚĞá ?äùİ¤ ñĞ?ÕÉ Íë?ùì??õğÜË ???? Íë?ùì?? òÚ×ù?? ÷é? ? õ¤íÄ?õµ.

? ÷úöá ùì???ÛÕİ¤? áµø·??ñÕ óİ×ğñÕ ×ùÖï? ?? ÷úøËÜË ø²òÚ ØÔñĞ? ?? ??Ê¨, ûèñĞ?? ûã?øË İ«áµ? ?Üñ ? ??? ??Ê«ñÕ ?ø·?÷é?õµ Íë?ùì?? ??×ù?Ü© õ»ù¼???õµ.

( http://www.zooseyo.or.kr/Yu_board/freesale.html?ty=1 )
', '2013-02-13', 6969, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '??ÌùÚñ ÊçÎ¯ÖÕ Íà? ??ÔôĞ¶íÄ?õµ~*', '	
"?ø·Úè??ÌùÚñ ?????ø·Úèùì?ÌùÚñ"ÕÉ Ñ·İ¤Êµ ??? ÍİòÚ

?? ÊçÎ¯ÖÕ Íà? ???Ê×íÄ?õµ.

ÊçÎ¯ÖÕøË Ø¡Ê¥? Î¯øË ÊçÎ¯ÖÕÏç÷ú?øË Ø¡Ê¥?ÔôÊ¨,

Pc?ø· ?Ïç? ø²òÚ Pc???øË? ?ÊÇ ? ?íÄ?õµ.

ÏÒ?øË? ?ø·ÓúÍò ?×»ÜË ÍİòÚ ?Ğá? õµòÚ ???? ÌùÚñ? Ôô?? ??íÄ?õµ.^^

ÜÙ? ??øâ ?ÚÛ, ×ùÍİñÕ? ó¥İ¤ó¥İ¤ ÏÀÛª×ù?ø· Î¯ì»?õµ~*', '2013-06-29', 8922, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '	[Û¨?]???ø·Úè??ÌùÚñ ö©? Øó?ÔôĞ¶íÄ?õµ.', '	
? ÜÙ? ??Öğùìï¤? äïÑ·? ØÔñĞ?? ?ø·Úè??? Øº??ÊÇ ? ??,
[Û¨?]???ø·Úè??ÌùÚñ Ï­?øË?? ö©? Øó??Ê×íÄ?õµ.

?×à ?ø·???øË? ñĞ×µ ?ı§Ôô×» Ï¿?÷é? ÜÙ??,
ÊÇ?ÓúÍòÕÉ îü? Î² ÓúÍò??øĞİ¤??øåÕÉ ?ø·ÓúÍòØÔø·, ??×»?İ¹? îüøâ øĞ?ÊµÏ­?××Öï ??? ø·ÕÛøâ äÓ? "???ø·Úè??ÌùÚñ PcÍà???"ÜË ??òÚ×ù?ø· Î¯ì»?õµ.

?Êµ ö©õµÎ³øË? Ğì?×»ñÕ Ø¡Ê¥???,
ö©ø·í¶? ù¼???äù? ÜÙ? ÏÀÜù ? ???, ø× ÕÕ? ?ø· ù¼????õµ.

?ø·ÓúÍòñÕ ğÂÊµ øĞ? Î² ÜÙ? ??øâ Ğù?, ?ûã ?????õµ~*', '2013-12-24', 5582, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '???ø·Úè??ÌùÚñ ûã??ÕÉ øĞ? Û¨×»', '	

Ï­âı?Ğü?, ???ğÂ ???ø·Úè??ÌùÚñ ??õµ.

ÕÜ ? óİ? ûã?? ÍİòÚ ûã??ÕÉ? ??? ???ÕÉ ûã??ÕÉÜË

ø²òÚ ûã??ÊÇ ? ?íÄ?õµ.

???ø·Úè??ÌùÚñ? ?? ?ø·Úè Î² ??ÌùÚñ ø²???ÜË ÕôÛ¨??

Ê¯äùÖï ?? ÌùÚñ?ÍéøË ??ñÕ Øº?òÚ×ù?ø· Î¯ì»?õµ.

????õµ~*', '2014-03-03', 2730, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '	Öğ?ûß? ???? ?ïĞ? åïĞãÔôĞ¶íÄ?õµ~?', 'Ï­âı?Ğü? ???ø·Úè??ÌùÚñ ??õµ.

???ø·Úè??ÌùÚñ? ÜÂ?ÍİÊµ ?? ãµ????? ø²òÚ
?Ò½İ¯?øË ÊÇ?Ôõ ñĞ?ï¤? ûÏÜØ? ØÔñĞ?İ¤? ?ı§?ÜË
×³??? ?íÄ?õµ.
øÉÛå ÚæøâøË, ?ÖÕäÓ? ÜÙ? ùìï¤? ØÔîÅõµ? Ş¢? ?Ûª×ù?Ê¨
?ÛÈòÚ??? ÊçíÄ? ?? ?İ£øË ÜÙ? ?ëÚ? ñã?ö¨?õµ~

?×à PcÍà ñÕ?İ« ?ı§?? ?í¶??, ÊçÎ¯ÖÕ? ?øËÎ³ İ¤õğ?øâ ?ÚÛ ?ïĞ? åïĞã ? ÷é???, Öğ?ûß? ???? ?ïĞñÕ ÜÙ? øĞ? ù¼????õµ~*

??ñÕ ?ø·Úè? ?äù×»? øÉğÈ?×»,
???ø·Úè??ÌùÚñ? ?ûã ?ÚÛ??íÄ?õµ. ????õµ!', '2017-08-08', 8976, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '???ø·Úèùì?ÌùÚñÕÉ ? ÊçÎ¯ÖÕÍà ?Í»? Øó?ÔôĞ¶íÄ?õµ.', 'ÊçÎ¯ÖÕÕÉ ??Ñ·ÕÉ äôÏëÜË Íİ?? ?øËÎ³ ÊçÎ¯ÖÕÍà ?Í»? Øó?ÔôĞ¶íÄ?õµ.

ÊçÎ¯ÖÕÍà?øË Ø¡Ê¥? Î¯øË ÊçÎ¯ÖÕ Ïç÷ú?øË Ø¡Ê¥? ÔôÊ¨,

?Í» ??? ?Ş¢?ÛÕ?ÕÉ Ï­?øË?? Î² IOS ö©?ÛÕ?ñÕ?

"???ø·Úè??ÌùÚñ V2"øË ø¢???? õµÎ³øË? ?ÊÇ ? ?íÄ?õµ.

? ??ñÕ?? Öğ?ûß? ÊÅ? Î² ×ğÊ« ?ø·Úè??ÌùÚñÕÉ ???? Î² ??? ?í¶?Ê¨, ÓúÍò??øĞİ¤??øåøâÕÉ ú¬Óú?øË ä¹ ×»? ?ø·Úè??ÌùÚññÕ ?Ê«Ôõ ?ø·Úèï¤? ÖÕÌ«?ú¬?? ø¢? ?Ø°?ÊÇ ? ?íÄ?õµ.

ÏÒ?øË? ?ø·ÓúÍò ?×»ÜË ÍİòÚ ?Ğá? õµòÚ ???? ÌùÚñ? Ôô?? ??íÄ?õµ.^^

ÜÙ? ??øâ ?ÚÛ, ×ùÍİñÕ? ó¥İ¤ó¥İ¤ ÏÀÛª×ù?ø· Î¯ì»?õµ~*', '2018-10-06', 933, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '?ø·ÓúÍòï¤? ÍİÊµ "???? ÜõÑõ"ñÕ Øº?òÚ×ùĞü?~', 'ÓúÍò? ???? ïÊöìÊµ Üõ?? ?ÚÛ óİô¾? Î¯ÖğíÍ ¡®???? ÜõÑõ¡¯? ÓúÍò???Î¾?Ú¶ ÙøäùÕÉ ???? ÌùÚññÕ? ???õµ!

 

?Ûª×»ø·? ??, ??ï¤ÕÉ ù¼×ùÕÉøË Õ¬??İ¤ø·? ??¢§

 

?? ??ñÕ?Öï×» Ì°äù? ÷ôİ¤ñÕ? ûèñĞ?? ??ÓúÍòï¤? ø²÷÷? öáİ¤? åı? ¡®?ø·ÓúÍò¡¯?äù? ??õµ. ?Ûå ?ø·ÓúÍòï¤? ÓúÍòï¤? ÛÎø²??, ?ëÚï¤ÕÉ ï·ğÂ, ??, Íİ?Êµ ?ĞãÍòñÕÕÉ ?? îüîüÕÉ Íİ? Ê¥ñÕ? ????ÜË ûèñĞäß?õµ. ???Óú? Ï­?××?×» ??? ı§Íİ?××Öï Ïç÷úñÕ? ÖíÒı ?×ØÊµ Øî ûèñĞ?õµ?? ?äô? ÕÕ? İ¤? ?íÄ?õµ. Ù¹?ÜË Î¸?õµ? ĞéÙ¹? ? ?? ?ùäÎ³ ???óİ ûã?? ßİ? ÷ôİ¤??? ?? ÓúÍòï¤ñÕ?? Ì«?? Íİ??? Ù¹?××Öï Óï? ? ? ?íÄ?õµ.


 

ÓúÍò???Î¾?Ú¶ Ùøäù? ñĞ? ?ø·ÓúÍòï¤? ÍİÊµ ø·øÎ Üõ?ñÕ ßİ? ???Öğ ¡®???? ÜõÑõ¡¯? ?íÄ?õµ.

"???? ÜõÑõ"? ??ùì? ø·ù¼òÚ×ùÊÅ Íòîñï¤øË ×ØÚñÜË Øîöá?,

øÉ Íòîñï¤? ÛŞ?òÚ ??Êµ ??øÎ? ?ø·ÓúÍòï¤? Ù¹??? Óğ? ?ñÕ ????õµ.

ôµ?Êµ ×ØÚñ? Ôôø· ÍİòÚ ÕÕ?(?ëÚ?, ?ÛªÓúÍò?)ï¤? ??×ùĞü?~', '2022-12-13', 1871, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '"ñĞ?îñ"ñÕ? ???Õ§?øË ÖÕòÚ×ùÊÇ ùì? Êç??õµ.', 'Ùøäù ????ÌùÚññÕ? ???Õ§?øË ÖÕòÚ×ùÊÇ ùì? Êç??õµ.
 
Ø¡?ø·äï : 2015ô® 4? 14ÖÕ (Ïë) ~ 2015ô® 4? 21ÖÕ (Ïë)
 
?Íë?ÖÕ : ?×ù ?, Ïë, Ì«, øÎ (×ù 4ÖÕ)
?Íë?äï : ?? 1?ù¼Úñ ?? 7??×» (6?äï)
?Íë?? : ÌùÚñ ? ÓúÍò øĞİ¤ Î² ?Ê«
?Íë×ØÊ« : Ùøäù ???? ÌùÚñ(?ÎÄ ÜõĞï? Öíõµİ¤øË 122?×»)
?ø½ : 6,000?', '2023-12-18', 5264, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '6? ûß? ÖÕ? ú¬ø· Ï­?', '×ğÓú??ø·??ÛÌ(?ÜØ? ?øËóİÎ¯???, MERS-CoV) Ì³ûë ?×»ÜË ÍİòÚ
Êç? ?Î¾? ??? ø·ÎÄ?? ?íÄ?õµ.

?ËÔ äÓ? ûã?? ?ÛªòÚ Ùøäùûß?ğÂÕÉ 6? ûß? ÖÕ?? ú¬ø·??õµ.

ûã?? Ï­?? Ôõõµ? 7?ñÕ 2íÍ ûß?ÜË ó¦ ù÷???õµ.
ûÏİ× ?äï ?ñÕ Ï­?Ôô? ?ëÚ? ÓúÍò? Ñ·Ï­Êµ ÖÕûã? ô¾İ¤? Ôôø·ÜË Î¯ì»?õµ.', '2015-06-15', 6883, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '?ùÒ?ÜË ø¤?òÚ ×ù?? ùìï¤ÚÛ ?İ¤? İ£ïş', 'Ğùáµ?ñÕ ??Ôô? ûèñĞ?? ?? "?ùÒ?"ÜË ñĞ?óİ??
?? ÙøäùñÕ? ?ùÒ?? ûè? ÜÙ? ûÏÖ¯ ø¤?òÚ ×ù?? ùìï¤ÕÉ ?Ïë? ÜÙ? ?ÛªÊ¦?õµ.

Ùøäù? ûè? ÜÙ? ûÏ×³ ?ùÒ?ÕÉ ÊçíÄ? ?Úè?? Ğùáµ?ËÔ ğÂÏëÜË ãş???,
?ùÒ?? Ëå 3åï?äï ?íÍÏëÛÎ?? Î¸??? ÊÅÚ¶?Óú? ??? ??, ÏÀ?×» ???? ?? øâ?ñÕ? ûè? ûÏ?×»İ« ?äôÕÉ ?ûã? ñĞ?äù? ??õµ.

?? ??ÕÉ ÓúÍò??ñÕ? ?õË ?äôø¢×³? Î¸? ?ø·ñÕ ?Üõ ?ñÕ? ??? õµîå???
ñĞ? ?õµ ÖğĞü? İ£ïş?İ¤?×»İ« ñĞ×ù ?äô?õµ? ??õµ.

?ùÒ?ÜË ø¤?òÚ ×ù?? ùìï¤øâ ?õµ ÖğĞüÊµ ûã?? Û¨???, ?ùÒ?ÕÉ ?ùÒ? ÍİòÚ ù¼??İ¤? ı£? ÷é? ?? ? Ş¢? ???õµ.
', '2015-08-25', 19843, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Ê«×ğÊµ ÷ú? óİÍú?øË ÓúÍò??ÜË ÊÇ?òÚ ×ùĞü?!', 'Êµ òÚ ?ëÚï¤øËù¼Úñ ?Ûª×»? ?? ?ù¼ ?Úå ?ø·ÓúÍò ?? 2014ô® ø·×ı Êµ òÚ 8İ«1?147Üõİ¤øË ÊÇÕô ?ø·Ôõ ÓúÍò? ? ÜÙ? ÷é?øË Øù???õµ.

ğ¯ïÊÜØ? ØìÕ§ñÕ ğÂÊµ ?Î¾ ?? ?ù¼øË ÓúÍò? ??, ?Í³? ??×»÷ôóİ ÏİÑ·? ?Ûª?×»? ?? ÓúÍò? ?İ¤? ?ÊÇ? ïĞÍë Ï­??Î³??,

?ÛªÓúÍòîü?Õô? ÕÉ?××Öï ÓúÍò ?ø·ÜË Í³ú¬ñÕ ?×»?? Ê«?×ùÕÉ ØìÕ§ÕÉ?? äôÏë?? ÊµÑ·, ?ÕÉÕÉ ??øË ?ÛªÖï? ÓúÍòøâ ??×»? Ôô?äù? Ê«?×ù Ì³Öï? ø²òÚ ÓúÍò? õµ? ??ÕÉ îñ?øË ÓîÛª?? ? ??? ??Öğ ??ÔôĞ¶íÄ?õµ.

?ø·ÓúÍò ??Ê«ÕÉ ÓúÍòï¤? ×ùÖï? ? ØÔ?? ğÂù¼ùì ??ñÕ ?ÜØ? Ôô?, "åï ??"?äù? ?ÕÛ?? Íİ?? ?? ûã?ñÕ? ?ÛªÓúÍòîü?Õô? ??ñÕ ??İ¤? ?? ä¹? Íİ??øËù¼Úñ óİÕÉ ?ÛªÓúÍò? ×»ùËø· ÍİÊµ ?Ê«ÊµÕÉ Ï­?×ØÙ¹Öï ÷é??õµ.

 

?ÛªÓúÍòîü?Õô? ??ñÕ 2013ô® 1?1ÖÕù¼Úñ ??ÔôĞ¶?Ê¨ 2014ô® 1?1ÖÕù¼Úñ? åïÜË ğÂûã?øË ÕÉÍë?? Ôô? ?? îü? ğÂûã? ÏÒ?øË ???ñÕ?øË Ì³ğÂ? ????õµ. 2014ô® ?ù¼ÕÉ Û¨? ø²Úåûã åïÕÉ ?ÛªÓúÍò îü?ÜÑ? Ëå 55.1%Öï??, ÍëùìùâÊµ ???øâ ÛŞ? îü ø²ÚåñÕ ??×» Ï¿? îü?ğÂûã? ?? ?ÊÇ? ?Ï­?? ÊÇÕô îü?ÜÑ? øÉ?õµ ìò? ôÌ? ÷é?øË ???õµ.

  

', '2015-12-03', 5750, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '2016 Ùøäù ??-?Óú? ??? õµîå?íÄ?õµ', 'Ùøäù? ÓúÍò??ËÔ ÓúÍòŞ¬, ùÒ×», ??ÕÛ×ğ îü? ?ÚÛ ?Î¾?? ?Óú?ËÔ ??,
øÉİ¤? øÉÛå ?Óú? ×»×»òÚ×ù? íÍ?ï¤? ?ÚÛ İ«ï¤??? ?Ú¶??õµ.
?ô®?? ÓúÍò???Î¾?Ú¶ Ùøäù? ?ÓúÊµ×»? 15×ùô®? Ôô???.
 
ÓúÍò???Î¾?Ú¶ ÙøäùÕÉ ?Ğì?×», ıªøËøÉñÕ ØÔñĞËÔ×ù?÷ôóİ,
ö¬? Ğì??ùê?óİ ?ÍİÚñ äÓ? SNSñÕ? ?? ÙøäùÜË Ø¡?? ùìï¤ÚÛ??
ÙøäùÕÉ ?Ûå ?Ûå Ê«?? ????? Ùøäù ?Óú?ï¤? ?øÎ??×» Ï¿??óİ?? :)

×»ôü 6? 11ÖÕ~6? 12ÖÕ 1Î® 2ÖÕøË Ùøäù ?Óú?ËÔ ??ï¤? ?ÚÛ?? ???? ×³??Ê×íÄ?õµ.
?? ???ñÕ? ?Íë?ù¼Úñ ÓúÍò??, ñĞ?îñ?Ğì?×» Ùøäù ????ÌùÚñÕÉ ä¹ Ù¸? ?õ»?? ?Óú?ï¤øâ
ä¹ ùìÎıñÕ? Î¯üâ? ?Óú ×ğ?ÊÅ ???ï¤ÚÛ?? ?äï? ?? Øº?òÚ×ù?íÄ?õµ.

ÙøäùÕÉ Ï­÷òñÕ? ??? ?Î¾?Ê¨ ?Óú?? ?ëÚï¤ÕÉ ?Îıø·ÜË îì?
ÏÒ?øËÕÉ ÓúÍò??ÜË ÍİÊµ ÙøäùÕÉ ×ğ×Øø· ı§?? Êç?òÚ??,
øÉİ¤? ?Óú?ËÔ ??? Ê«Ê¥?? ñã?? ú¬ğÂÜË İ«ï¤? äï
2016 Ùøäù ??-?Óú? ???ÕÉ ?×Ø? Êµ ? ûèĞı??? ó¦??? 
', '2016-06-16', 2770, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Ùøäù Î³Ë¬Íİ??øË Øº??ÊÇ ğÂÕÉ??? Êç??õµ', 'Ùøäù ?øĞñÕ? Ğü ?×» ×ğ?Êµ íÍÕÉ? ?íÄ?õµ. ?íÍ, ??íÍ, Î³Ë¬Íİ?íÍ??õµ. Î³Ë¬Íİ?íÍ? ?? 1íÍ Êç? ?? ?Óú? ??Î¸?, ??ÕÉ ×ğ?Êµ ?Ï­? ø¢ÛÕ?? Öï×ı??õµ.

?×à Î³Ë¬Íİ?íÍ? Î³Ë¬Íİ?×Ø?øË ğÂ?? ??, ûãÕ§?? 2Öï(?×³÷ú, ??äÇ), ı§ûãÕ§?? 2Öï(??ÏÑ, ???), ?Íë?×Ø(???), ğÂÕÉ? 3Öï(äôË¬?, ÊÅÍ³ñĞ, ??ı§) îü ? 9???õµ. ?øĞñÕ ïÊÜØ? Î³Ë¬Íİ?íÍ? 15Öï ?Ï¨øË ?Ğù?? Ôô? ?íÄ?õµ. Øü? ??? ?? ?òÚ Î³Ë¬Íİ?íÍ? ğÂÕÉ? Î³Ë¬Íİ?? ?øÎ ? í·Ûª íÍ??ï¤ÕÉ ÕÉÚè? ?õµ ÜÙ? ?Ë¬Ôô?? Ì³ğÂ?ø·øË ?Ê×íÄ?õµ.

ğÂÕÉ??ï¤ÕÉ ÜÙ? øĞ?øâ Øº? ù¼????õµ.', '2017-07-12', 2426, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '5? 13ÖÕ(ÛÕ), ???×³? Ú»Ë¬òÚ×ùÊÇ ùì? ø·õµ??õµ!', '?? 5? 13ÖÕ(ÛÕ) ?İ¤? "Thanks Family Day ??? Ôô??? ?Üõ?"ÕÉ ???×³? Ú»Ë¬òÚ×ùÊÇ ùì? ØÔíÄ?õµ.



2017 Thanks Familiy Day ?? åï? ???ø·



ÙøäùÕÉ ????ï¤? Êµ? Êç?? ? ??ÕÉ ??Êµ ø·?øâ ?ùÒÊµ ?ÛªÓúÍò, ????ÕÉ ÊçíÄ? ?×³ñÕ ?ñĞ×ù?? ??õµ.

×àí¶ø·ù¼ Øº? ??? õµ?øâ äÓíÄ?õµ.

    *?Öï ×Øı§øË ?×³Ú»Ë¬? ?í¶?ÊÅ ùì

    *Ú»Ë¬Êµ ?×³ ?ÛàÕÉ ??? 5? 16ÖÕ(Ïë) ?? 9??×» ?ÖÕøË ?ËÀ?í¶Êµ ùì

    *?? õ»ÖÕ(13ÖÕ) ??×Ø ?×Ø(÷úø·? Ğùáµ? ùìõ»? ??åïøË 242 "õµÓïõµÓï")?øË ×µØ¡ ?ÊÇ ? ?? ùì

    *?? õ»ÖÕ ?? 10:30~?? 2:00 ÓúÏ­ ?×³ Ú»Ë¬? òÚ×ùÊÇ ? ?? ùì

    *?ğÈ Ú»Ë¬Êµ Êç? ?×³ÕÉ ?×«Ş¬? ÙøäùñÕ ??? ÓúÕÉ??? ùì



?ğÈ ?×³Ú»Ë¬ñÕ ??×ùÊÇ ùì? [??, ú¬??(?ğÂ?Ïë), Ú»Ë¬×Øı§ ø·?, ?ÖïÕÉ ?×³? ùø ? ?? SNS ×ùÊ«(SNS? ?? ÷úöáñÕ? ×µØ¡ Ú»Ë¬Êµ ?×³ ØŞù¼)]ÜË 5? 7ÖÕ(ÖÕ)?×» ?ÖÕ(info@ekara.org)øË ??×ùĞü?.

?ÖÕÕôÌ«? ??? [?×³Ú»Ë¬- OOO(?Öï ??)]?øË ××?×ùîÖÎı ??õµ!



? 2? ?ûãÕÉ ?×³Ú»Ë¬ ×àí¶ø·ù¼Öğùì? ÊçÊÇ ù÷??Ê¨, Øº? ?ù¼? åïùâú¬? ?İ¤?íÄ?õµ.



?? ?×³? ??Îı ??×» ×Î ÊçÜØÊÇ ÷é äÓñĞ ×»ôü 3ô® ÓúÏ­ÕÉ ?? ?×³ï¤ ×ğ ÖÕù¼ÜË ñĞ?ñÕ ØŞù¼??õµ.

Øº?òÚ×ùĞü?~', '2017-04-26', 2871, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '??×«??øË ÖïÊµ ?Ğì?×» ?? Ï­? (2018.03.23~25)', 'Ùøäù ?Ğì?×» ?? ×«??øË ñĞ? ø·äïÓúÏ­ ?Ğì?×» Ø¡Ê¥ Î² ??? ?Ï­?ó¦ ? ?íÄ?õµ.



?×«?ÖÕ? : 2018.03.23 23? ~ 2018.03.25 24?



??ñÕ ?Ñ· ?İ¤? ×å ?òÚ ù¼????õµ', '2018-03-20', 1493, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '?Ğì?×» åïÑ·øâ ?×ùÌùÚñ Ğì?×» ??? ÏÀÛª???õµ.', 'Ùøäù ?Ğì?×»? 7? ÊµõËÓúÏ­ åïÑ· ×«?? ????íÄ?õµ. ?õµ ÜÙ? Ùøäù ?ÓúÕÉ ?ÊÅ Ê«?? ?ÖïñÕ? Ì³Öïó¦ ? ?íÄ?õµ. ğÂù¼Êç Úæú¬? 1:1Úæú¬?øË ?Ø° ùŞ÷úÔôĞ¶íÄ?õµ. Í»øË? ?õğñÕ? Öğ×ù ØÔ??? ?õğÖï ?? / ?? / 1:1Úæú¬ / ??×»?ñÕ ?? Ø¡?ó¦ ? ?íÄ?õµ.


??? ?? ?øË×ã? ?? Ğì?×»ÜË ????õµ.
?×ùÌùÚñ ??? ×ıı§?? ?Îıø·ËÔ ?×ùÌùÚñ ĞéÛ¨ ?ÍÕ??? ?×³? ÕôÛ¨?? îŞ??ø·, ?? Ï­?ËÔ ?? ??, Ê«? îü? ÕôÛ¨??õµ. 

', '2018-08-08', 2289, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'ÕôøËÜé? ?øË×ã? - ùÎÓî Ñ·, 10İ«×ØÕÉ ùŞÏë', 'ÓúÍò? ÍİÊµ ?Óú, ??××Öï ùŞÏë? ????õµ. 
2002ô® ûã??Óú? 1ÖïñÕ? ?×«òÚ? ÓúÍò??, ???ÖÕ ÓúÍò????øĞ, ?? ?? ???Ğì ñĞ?îñ? Î³Ë¬?ø·?×» 17ô®ÕÉ ?äï? ×»ôü ×»øÎ, ÓúÍòŞ¬ñÕ ğÂÊµ ÙøäùÕÉ ?Î¾? ? øú??íÄ?õµ. Ùøäù? ×µØ¡ 400? Üõİ¤ÕÉ åïÜË Óî?? Ü©???ÜË ÍİÊµ ø½?Ê«ÜË ??ñÕ Î³Ë¬?×»İ« ?øË? Øüùì?×» Ï¿íÄ?õµ. ??Êµ ?Õô?, ÓúÍòŞ¬ñÕ ğÂÊµ ôÌ? Öï? Ê¥ñÕ? ÓúÍò?Ù¹ËÔ ï·ğÂ, åï?? ?Õôï¤? ÕÜ?? òÚÚæÔôø· ?Ş£íÄ?õµ. Íİø·ñÕ ?Êµ ÓúÍò ?ÕôÜË òÚÚæ?Ûª? ??××Öï Õô? åïĞáøâ ?íÍÖï? ùŞÏë? ??? ????õµ.  
?ÜË ÍİòÚ Ùøäù? ?øËÎ³ ?ó¦? Ù¹??? ?Î¾ãşíÄ?õµ. øÉ ÚæøâÍò? Î¯øË Ùøäù ?ùşÌùÚñ??õµ. 2016ô® ù¼Úñ ÓúÍò ??ËÔ ?? ??, ÛÎ? ?Î¾ Øº??×» ?í¶Êµ ¡®ÛÕ? ?ÛªÓúÍò ??ùÒ×»ÌùÚñ¡¯Öï ?ùşÌùÚñÕÉ ??? ×ıı§òÚ ?íÄ?õµ. ?ùşÌùÚñ? ÓúÍòÓîùşøâ ???Ïë Ì³ûëÕÉ ÷ô×å?Öğ ÓúÍòùÒ×»ñÕ ğÂÊµ ???×ı? ö«?ø· ÍİÊµ ?Ú¶××Öï Êç?? ? ÷é??õµ. ×»øÎ ?ùşÌùÚñ? ø·?Û¨?ÜË ??? ÓúÍòï¤? ×»? ?? İ«ï¤? Î³Ë¬? ×ıı§?? îü ???? Êç?? ?ñĞ?? ×ğ??õµ.

', '2019-10-16', 10378, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, '[Û¨×»] 7? 12ÖÕ(øÎ) ?Ïëûã? ×ğ×» Ï­?', '?ùÒ õ»ÖÕÖï 7? 12ÖÕ(øÎ)ñÕ? ğÂ? Ø¨Ğù?×Ø 2? ?íÍøË ?Ïëûã?? ??í¶??õµ. 

?Ïëûã? Î² ?ÕÉñÕ Øº?òÚ ×ù?ø· Î¯ì»?õµ.

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
	counseling_judgment	varchar2(20)	DEFAULT '¹ÌÈ®ÀÎ'	NOT NULL,
	counseling_detail	varchar2(2000)		NULL,
	counseling_age	number		NOT NULL,
	counseling_address	varchar2(100)		NOT NULL,
	counseling_job	varchar2(40)		NOT NULL,
	counseling_adopt	number	DEFAULT 0	NOT NULL,
    animal_id number NOT null,
    user_name varchar2(20) NOT NULL,
    user_phone varchar2(20) NOT NULL

);
COMMENT ON COLUMN counseling.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

COMMENT ON COLUMN counseling.counseling_judgment IS '°ü¸®ÀÚ¸¸ ¼öÁ¤°¡´É';

COMMENT ON COLUMN counseling.counseling_detail IS '°ü¸®ÀÚ¸¸ Á¶È¸ ¼öÁ¤ »èÁ¦';

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

COMMENT ON COLUMN survey.survey_id IS '¼³¹® °íÀ¯ ID';

COMMENT ON COLUMN survey.counseling_id IS '¿¹¾à °íÀ¯ ID';
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

-- À¯Àú ´õ¹Ì µ¥ÀÌÅÍ
insert all 
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member01', 'password', '±è¿µÀÏ', '010-1111-1111', 'member01@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member02', 'password', '±è¿µÀÌ', '010-2222-2222', 'member02@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member03', 'password', '±è¿µ»ï', '010-3333-3333', 'member03@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member04', 'password', '±è¿µ»ç', '010-4444-4444', 'member04@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member05', 'password', '±è¿µ¿À', '010-5555-5555', 'member05@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member06', 'password', '±è¿µÀ°', '010-6666-6666', 'member06@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member07', 'password', '±è¿µÄ¥', '010-7777-7777', 'member07@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member08', 'password', '±è¿µÆÈ', '010-8888-8888', 'member08@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member09', 'password', '±è¿µ±¸', '010-9999-9999', 'member09@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member10', 'password', '±èÀÏ¿µ', '010-1010-1010', 'member10@naver.com')
select * from dual;

-- °ü¸®ÀÚ ´õ¹Ì µ¥ÀÌÅÍ
insert into admin (admin_id, admin_pwd)
values('admin', 'admin1234');

-- À¯±âµ¿¹°
INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°³', '2»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ O', '5kg', '°¥»ö', 'È°¹ßÇÏ°í Ä£È­ÀûÀÔ´Ï´Ù.', 'admin', 0, SYSDATE, '¸Û¸ÛÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES 
(animal_seq.nextval, '°í¾çÀÌ', '3»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '3kg', 'Èò»ö', '½ÅÁßÇÏÁö¸¸ ±Í¿©¿òÀÌ ¹°¾À ³ª´Â ¾ÆÀÌ¿¡¿ä.', 'admin', 1, SYSDATE, '¾ß¿ËÀÌ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°³', '1»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ X', '8kg', '°ËÁ¤', '¿¡³ÊÁö ³ÑÄ¡´Â È°¹ßÇÑ Ä£±¸ÀÔ´Ï´Ù.', 'admin', 2, SYSDATE, 'ÄÚÄÚ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '2»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ O', '4kg', 'È¸»ö', 'Á¶¿ëÇÏ°í ±ú²ıÇÑ ¼º°İÀÇ ¾ÆÀÌ¿¡¿ä.', 'admin', 1, SYSDATE, '³×·Î');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°³', '3»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '7kg', '°¥»ö', 'ÈÆ·ÃµÈ ¾äÀüÇÑ ¾ÆÀÌÀÔ´Ï´Ù.', 'admin', 0, SYSDATE, '·çµğ');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '1»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '5kg', '°ËÁ¤', '»ç¶÷À» ÁÁ¾ÆÇÏ°í ´Ù¸¥ µ¿¹°°úµµ Àß Áö³»¿ä.', 'admin', 2, SYSDATE, '¹Ì¹Ì');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°³', '4»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ X', '6kg', 'Èò»ö', '¾ÆÀÌµé°ú Àß ¾î¿ï¸®´Â »ó³ÉÇÑ °­¾ÆÁöÀÔ´Ï´Ù.', 'admin', 0, SYSDATE, 'º§¶ó');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '4kg', '°¥»ö', '¸Å¿ì È°¹ßÇÏ°í È£±â½ÉÀÌ ¸¹Àº ¾ÆÀÌ¿¡¿ä.', 'admin', 1, SYSDATE, 'Åè');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°³', '2»ì', '¼öÄÆ', 'Áß¼ºÈ­ O', '5kg', '°ËÁ¤', '»ç¶÷À» Àß µû¸£´Â ±Í¿©¿î °­¾ÆÁöÀÔ´Ï´Ù.', 'admin', 0, SYSDATE, 'ÄíÅ°');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '°í¾çÀÌ', '3»ì', '¾ÏÄÆ', 'Áß¼ºÈ­ X', '3kg', 'Èò»ö', '¿ë°¨ÇÏ°í °æ°è½ÉÀÌ °­ÇÑ ¾ÆÀÌ¿¡¿ä.', 'admin', 2, SYSDATE, '¼ÒÇÇ');

-- ÈÄ¿ø
INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member01', 30000, '½ÅÇÑÄ«µå', 30000, '±è¿µÀÏ', '010-1111-1111');

INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member02', 50000, '±¹¹ÎÄ«µå', 50000, '±è¿µÀÌ', '010-1415-7675');

INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member05', 30000, '½ÅÇÑÄ«µå', 30000, '±è¿µ¿À', '010-5555-5555');

-- ºÀ»ç °ø°í
insert into volunteer
values(volunteer_seq.nextval, '[ºÀ»ç ¸ğÁı] º¸·É/È­¼º ºÒ¹ı ¹ø½ÄÀå ±¸Á¶°ßµéÀÇ µ¹º½ ºÀ»ç¸¦ ¸ğÁıÇÕ´Ï´Ù!

º¸·É/È­¼º ºÒ¹ı ¹ø½ÄÀå¿¡¼­ ±¸Á¶µÈ µ¿¹°µé¿¡°Ô µû¶æÇÑ µµ¿òÀÇ ¼Õ±æÀ» ´õÇØÁÖ¼¼¿ä!

 *ºÀ»ç ½ÅÃ»ÇØÁÖ¼Å¼­ °¨»çÇÕ´Ï´Ù! ºÀ»ç ¼±¹ßÀº ±âÀçÇØÁÖ½Å ¿¬¶ôÃ³·Î ¼øÂ÷ÀûÀ¸·Î µå¸± ¿¹Á¤ÀÔ´Ï´Ù.
 
<¸ğÁı °³¿ä>
¸ğÁı ±â°£ : ~2024³â 3¿ù 25ÀÏ 18:00
´ë»ó: 19¼¼ ÀÌ»ó ¼ºÀÎ, 1È¸ ÀÌ»ó( 2È¸ ÀÌ»ó ºÀ»ç °¡´ÉÇÏ½Å ºĞ ¿ì´ë)
ÀÎ¿ø: 1ÀÏ 4ÀÎ
**ÀÏÁ¤À» ÃæºĞÈ÷ °í·ÁÇÏ¿© ²À ¿À½Ç ¼ö ÀÖ´Â ºĞ¸¸ ½ÅÃ»ÇØÁÖ¼¼¿ä**', sysdate, 'º¸·É/È­¼º ¹ø½ÄÀå ±¸Á¶°ß µ¹º½ ºÀ»ç', default, '2024.03.31 (¼ö)',
'2023.03.25 (¿ù) 03½Ã 00ºĞ', 10, default, '°æ±â ÆÄÁÖ½Ã ¹ı¿øÀ¾ ¼úÀÌÈ¦·Î 1409 ´õº½¼¾ÅÍ(ÆÄÁÖ)', default, 'admin');


insert into volunteer
values(volunteer_seq.nextval, 
'ÀÔ¾ç¼¾ÅÍ ¾Æ¸§Ç°¿¡¼­ ÀÔ¾çÀ» ±â´Ù¸®´Â µ¿¹°µéÀ» µ¹ºÁÁÙ ºÀ»çÀÚ´ÔÀ» ¸ğÁıÇÕ´Ï´Ù?



µ¿¹°À» »ç¶ûÇÏ°í µ¿¹° µ¹º½¿¡ ´ëÇÑ ÀÌÇØ°¡ ÀÖÀ¸½Å ºĞÀÌ¶ó¸é ¸¸ 20¼¼ ÀÌ»ó ´©±¸³ª ½ÅÃ» °¡´ÉÇÕ´Ï´Ù.

´Ü, ½ÅÃ»ÀÚ°¡ ¸¹À» °æ¿ì ½É»ç°¡ ÁøÇàµÉ ¼ö ÀÖ½À´Ï´Ù.





 ¾÷¹« : °­¾ÆÁö¹æ°ú °í¾çÀÌ¹æ ¹èº¯ Ã»¼Ò, ¼¼Å¹, ¼³°ÅÁö ¹× µ¿¹° µ¹º½.

 ´ë»ó : ÃÖ¼Ò 1°³¿ù ÀÌ»ó ºÀ»ç °¡´ÉÇÏ½Å ºĞ, Ã»¼Ò¿¡ ÀÚ½Å ÀÖÀ¸½Å ºĞ, Ã¼·Â ÁÁÀ¸½Å ºĞ, ¼ÕÀÌ ºü¸£½Å ºĞ, ¸ÖÆ¼°¡ °¡´ÉÇÏ½Å ºĞ.



¸ğÁı¿äÀÏ


3¿ù 16ÀÏ ÀÏ¿äÀÏ 09:30 ~ 18:30 3¸í





? ½ÅÃ»ÇÏ±â ´©¸£½Å ÈÄ ÆË¾÷Ã¢ ¸Ş¸ğ¶õ¿¡ ¿À½Ç ¼ö ÀÖ´Â ¿äÀÏÀ» ÀÛ¼ºÇØ ÁÖ¼¼¿ä.





 Àå¼Ò : ¼­¿ï½Ã ¸¶Æ÷±¸ ÀÜ´Ù¸®·Î 122, 2Ãş ¾Æ¸§Ç° (ÁöÇÏÃ¶ 6È£¼± ¸Á¿ø¿ª 1¹ø Ãâ±¸ µµº¸ 7ºĞ)',
sysdate, '¾Æ¸§Ç° µ¿¹°µ¹º½ ÀÚ¿øºÀ»ç ¸ğÁı', default, '2024.03.16 (ÀÏ)', '2024.03.13 (±İ) 18½Ã 00ºĞ',
3, default, '¼­¿ï ¸¶Æ÷±¸ ÀÜ´Ù¸®·Î 122 ´õºÒ¾î¼û¼¾ÅÍ ¾Æ¸§Ç°', 1, 'admin');

insert into volunteer
values(volunteer_seq.nextval, '
º¸·É ¹ø½ÄÀå ±¸Á¶°ßµéÀÌ ´õºÒ¾î¼û¼¾ÅÍ¿¡ ´ë°Å ÀÔ¼ÒÇØ »õ·Î¿î °ß»ıÀ» ÁØºñ ÁßÀÔ´Ï´Ù! °¡Á·À» ±â´Ù¸®´Â ¼ÒÁßÇÑ ±¸Á¶°ßµé¿¡°Ô µû¶æÇÑ µµ¿òÀÇ ¼Õ±æ·Î ÇÔ²²ÇØ ÁÖ¼¼¿ä!



¡Ø ºÀ»ç ¼±¹ßÀº ±âÀçÇØÁÖ½Å ¿¬¶ôÃ³·Î ¼øÂ÷ÀûÀ¸·Î ¿¬¶ô µå¸± ¿¹Á¤ÀÔ´Ï´Ù.



¡´¸ğÁı °³¿ä¡µ
 ¸ğÁı ±â°£: ~2024³â 2¿ù 28ÀÏ 18:00

¸ğÁı ´ë»ó: 19¼¼ ÀÌ»ó ¼ºÀÎ, 1È¸ ÀÌ»ó(2È¸ ÀÌ»ó ºÀ»ç °¡´ÉÇÏ½Å ºĞ ¿ì´ë)

 ¸ğÁı ÀÎ¿ø: 1ÀÏ ÃÖ´ë 4ÀÎ



? ÀÏÁ¤À» ÃæºĞÈ÷ °í·ÁÇÏ¿© ²À ¿À½Ç ¼ö ÀÖ´Â ºĞ¸¸ ½ÅÃ»ÇØÁÖ¼¼¿ä


 ºÀ»ç ½Ã°£: Á¾ÀÏ(09:00~18:00) ¶Ç´Â ¿ÀÀü(09:00~12:00)

 ºÀ»ç Àå¼Ò: ´õºÒ¾î¼û¼¾ÅÍ(¼­¿ïÆ¯º°½Ã ¸¶Æ÷±¸ ¼ÒÀç)

 ºÀ»ç ³»¿ë: º¸·É ¹ø½ÄÀå ±¸Á¶°ß µ¹º½',
 sysdate, 'º¸·É ¹ø½ÄÀå ±¸Á¶°ß µ¹º½ ºÀ»ç', default, '2024.02.29 (¸ñ)', '2024.02.28 (¼ö) 18½Ã 00ºĞ',
4, default, '´õºÒ¾î¼û¼¾ÅÍ(¼­¿ïÆ¯º°½Ã ¸¶Æ÷±¸ ¼ÒÀç)', 3, 'admin');

-- À¯±âµ¿¹° °ø°í
INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '¹«·áºĞ¾ç ÀÌº¥Æ®°¡ ½ÃÀÛµÇ¾ú½À´Ï´Ù. ¸¹Àº Âü¿© ºÎÅ¹µå¸³´Ï´Ù.', TO_DATE('2024-03-05', 'YYYY-MM-DD'), '¹«·áºĞ¾ç ÀÌº¥Æ® °øÁö', 100, 'ÁøÇàÁß', '»ó', 'admin', 1);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '´ç½ÅÀÇ µû¶æÇÑ °¡Á¤ÀÌ ÇÊ¿äÇÑ ¾ÆÀÌµéÀÌ ±â´Ù¸®°í ÀÖ½À´Ï´Ù.', TO_DATE('2024-03-04', 'YYYY-MM-DD'), '¾î¸°ÀÌ³¯ Æ¯º° ¹«·áºĞ¾ç', 75, 'ÁøÇàÁß', 'Áß', 'admin', 2);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '°í¾çÀÌ Ä£±¸µéÀÌ »õ·Î¿î °¡Á·À» Ã£°í ÀÖ¾î¿ä.', TO_DATE('2024-03-03', 'YYYY-MM-DD'), 'º½¸ÂÀÌ °í¾çÀÌ ¹«·áºĞ¾ç', 120, 'Á¾·á', 'ÇÏ', 'admin', 3);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '°Ü¿ïÃ¶ Æ¯º° ¹«·áºĞ¾ç ÀÌº¥Æ®! Âü¿©ÇÏ¼¼¿ä.', TO_DATE('2024-03-02', 'YYYY-MM-DD'), '°Ü¿ï ¹«·áºĞ¾ç', 90, 'ÁøÇàÁß', '»ó', 'admin', 4);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '»õ·Î ¹«·áºĞ¾ç¹ŞÀº Ä£±¸µéÀ» ¼Ò°³ÇÕ´Ï´Ù.', TO_DATE('2024-03-01', 'YYYY-MM-DD'), '½Å±Ô µ¿¹° ¼Ò°³', 110, 'ÁøÇàÁß', 'Áß', 'admin', 5);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, 'Æ¯º°ÇÑ ¹«·áºĞ¾ç ±âÈ¸! ³õÄ¡Áö ¸¶¼¼¿ä.', TO_DATE('2024-02-29', 'YYYY-MM-DD'), 'Æ¯º° ¹«·áºĞ¾ç ÇÁ·Î¸ğ¼Ç', 80, 'ÁøÇàÁß', 'ÇÏ', 'admin', 6);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '¹«·áºĞ¾ç ÈÄ±â ÀÌº¥Æ®°¡ ÁøÇà ÁßÀÔ´Ï´Ù.', TO_DATE('2024-02-28', 'YYYY-MM-DD'), '¹«·áºĞ¾ç ÈÄ±â ÀÛ¼º ÀÌº¥Æ®', 95, 'ÁøÇàÁß', '»ó', 'admin', 7);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, 'º½Ã¶ ¹«·áºĞ¾çÀÇ °èÀı, ´ç½ÅÀÇ Áı¿¡ µû¶æÇÑ Ä£±¸¸¦ ºÒ·¯º¸¼¼¿ä.', TO_DATE('2024-02-27', 'YYYY-MM-DD'), 'º½ ¹«·áºĞ¾ç ÀÌº¥Æ®', 110, 'Á¾·á', 'Áß', 'admin', 8);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '¾ÆÀÌµéÀ» À§ÇÑ Æ¯º° ¹«·áºĞ¾ç ÀÌº¥Æ®°¡ ÁØºñµÇ¾î ÀÖ½À´Ï´Ù.', TO_DATE('2024-02-26', 'YYYY-MM-DD'), '¹«·áºĞ¾ç ÀÌº¥Æ®', 85, 'ÁøÇàÁß', 'ÇÏ', 'admin', 9);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '´ÙÇÔ²² Áñ±â´Â ¿©¸§! ¹«·áºĞ¾ç ÀÌº¥Æ®¿¡ Âü¿©ÇÏ¼¼¿ä.', TO_DATE('2024-02-25', 'YYYY-MM-DD'), '¿©¸§ ¹«·áºĞ¾ç Ä·ÆäÀÎ', 105, 'ÁøÇàÁß', '»ó', 'admin', 10);

-- °øÁö °Ô½ÃÆÇ
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

-- ÀÚÀ¯°Ô½ÃÆÇ
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

-- ºÀ»ç ÈÄ±â °Ô½ÃÆÇ
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

-- ÀÔ¾ç ÈÄ ÀÌ¾ß±â °Ô½ÃÆÇ
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

-- ºÀ»ç ½ÅÃ»
insert into application
values(application_seq.nextval, sysdate, '', 'member01', 2, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member02', 2, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member03', 3, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member04', 3, default);

-- ÀÔ¾ç ½ÅÃ»
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'member01', 1, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 1', 3, '¼­¿ï½Ã °­³²±¸', '°³¹ßÀÚ', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-17', 'YYYY-MM-DD'), 'member02', 2, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 2', 2, '¼­¿ï½Ã ¼­ÃÊ±¸', 'µğÀÚÀÌ³Ê', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'member03', 3, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 3', 4, '¼­¿ï½Ã ¼ÛÆÄ±¸', '¸¶ÄÉÅÍ', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-22', 'YYYY-MM-DD'), 'member04', 4, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 4', 5, '¼­¿ï½Ã °­ºÏ±¸', 'ÇÁ·ÎÁ§Æ® ¸Å´ÏÀú', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'member05', 5, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 5', 3, '¼­¿ï½Ã µ¿ÀÛ±¸', 'µ¥ÀÌÅÍ ºĞ¼®°¡', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'member06', 6, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 6', 4, '¼­¿ï½Ã °­¼­±¸', '½Ã½ºÅÛ ¿£Áö´Ï¾î', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 'member07', 7, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 7', 2, '¼­¿ï½Ã °­³²±¸', 'À¥ µğÀÚÀÌ³Ê', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'member08', 8, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 8', 5, '¼­¿ï½Ã ¼ÛÆÄ±¸', 'µ¥ÀÌÅÍ »çÀÌ¾ğÆ¼½ºÆ®', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'member09', 9, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 9', 3, '¼­¿ï½Ã °­µ¿±¸', 'Ç®½ºÅÃ ¿£Áö´Ï¾î', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'member10', 10, '¹ÌÈ®ÀÎ', '»ó´ã ³»¿ë 10', 4, '¼­¿ï½Ã Áß¶û±¸', '¼ÒÇÁÆ®¿ş¾î ¿£Áö´Ï¾î', 0);

-- ÀÚÀ¯°Ô½ÃÆÇ ´ñ±¼
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

-- ÀÚÀ¯°Ô½ÃÆÇ ÁÁ¾Æ¿ä
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

-- ºÀ»ç ÈÄ±â °Ô½ÃÆÇ ´ñ±Û
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

-- ºÀ»ç ÈÄ±â °Ô½ÃÆÇ ÁÁ¾Æ¿ä
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

-- ÀÔ¾ç ÈÄ ÀÌ¾ß±â °Ô½ÃÆÇ ´ñ±Û
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

-- ÀÔ¾ç ÈÄ ÀÌ¾ß±â °Ô½ÃÆÇ ÁÁ¾Æ¿ä
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

-- ½Å°í
insert into report(report_id, report_sort, report_date, report_detail, report_status, fboard_id, user_id)
values(47, 1, '2024-03-05', '¿å¼³½Å°í', 1, 1, 
    (select user_id 
        from freeboard
        where fboard_id = 1
    ));

insert into report(report_id, report_sort, report_date, report_detail, report_status, vfboard_id, user_id)
values(46, 2, '2024-03-05', 'µµ¹è½Å°í', 1, 1, 
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

-- ÀÌ¹ÌÁö
insert into image(image_id, board_sort, image_name, fboard_id)
values(1, 4, 'image_01', 1);

insert into image(image_id, board_sort, image_name, vfboard_id)
values(2, 6, 'image_02', 1);

insert into image(image_id, board_sort, image_name, afboard_id)
values(3, 7, 'image_03', 1);

-- ¼³¹®
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(1, '¿¹', '¾Æ´Ï¿À', 'º¸Åë', '¿¹', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', '»ó´ã ³»¿ëÀÌ À¯¿ëÇß½À´Ï´Ù.', 1);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(2, '¾Æ´Ï¿À', '¿¹', 'º¸Åë', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', '¿¹', '»ó´ã ³»¿ëÀÌ ºÎÁ·ÇÕ´Ï´Ù.', 2);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(3, '¿¹', '¾Æ´Ï¿À', 'º¸Åë', '¿¹', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', '´õ ¸¹Àº ½Ã°£ÀÌ ÇÊ¿äÇÕ´Ï´Ù.', 3);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(4, '¾Æ´Ï¿À', '¿¹', 'º¸Åë', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', '¿¹', '»ó´ãÀÌ Áö·çÇß½À´Ï´Ù.', 4);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(5, '¿¹', '¾Æ´Ï¿À', 'º¸Åë', '¿¹', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', 'Ãß°¡ ¼­ºñ½º°¡ ÇÊ¿äÇÕ´Ï´Ù.', 5);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(6, '¾Æ´Ï¿À', '¿¹', 'º¸Åë', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', '¿¹', '»ó´ãÀÌ ³Ê¹« ±æ¾ú½À´Ï´Ù.', 6);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(7, '¿¹', '¾Æ´Ï¿À', 'º¸Åë', '¿¹', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', 'ÀÚ¼¼ÇÑ »ó´ãÀÌ ÇÊ¿äÇÕ´Ï´Ù.', 7);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(8, '¾Æ´Ï¿À', '¿¹', 'º¸Åë', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', '¿¹', '»ó´ã ³»¿ëÀÌ ¸ğÈ£ÇÕ´Ï´Ù.', 8);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(9, '¿¹', '¾Æ´Ï¿À', 'º¸Åë', '¿¹', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', '¸¸Á·ÇÕ´Ï´Ù.', 9);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(10, '¾Æ´Ï¿À', '¿¹', 'º¸Åë', '¾Æ´Ï¿À', '¿¹', '¾Æ´Ï¿À', '¿¹', '´õ ¸¹Àº »ó´ãÀÌ ÇÊ¿äÇÕ´Ï´Ù.', 10);

-- Á¦Àç
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

-- À¯±âµ¿¹°
CREATE SEQUENCE animal_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  CACHE 20;

-- ÈÄ¿ø
CREATE SEQUENCE donate_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- ºÀ»ç °ø°í
create sequence volunteer_seq
start with 1
increment by 1
nocycle
nocache;

-- À¯±âµ¿¹° °ø°í
CREATE SEQUENCE adoption_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  CACHE 20;
  
-- °øÁö°Ô½ÃÆÇ
create sequence noticeBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- ÀÚÀ¯°Ô½ÃÆÇ
create sequence freeBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- ºÀ»ç ÈÄ±â °Ô½ÃÆÇ
create sequence volunteerFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- ÀÔ¾ç ÈÄ ÀÌ¾ß±â °Ô½ÃÆÇ
create sequence adoptionFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- ºÀ»ç ½ÅÃ»
create sequence application_seq
start with 1
increment by 1
nocycle
nocache;

-- ÀÔ¾ç ½ÅÃ»
CREATE SEQUENCE counseling_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- ÀÚÀ¯°Ô½ÃÆÇ ´ñ±¼
create sequence Fcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- ÀÚÀ¯°Ô½ÃÆÇ ÁÁ¾Æ¿ä
create sequence flike_seq
start with 1
increment by 1
nocycle
nocache;

-- ºÀ»ç ÈÄ±â °Ô½ÃÆÇ ´ñ±Û
create sequence VFcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- ºÀ»ç ÈÄ±â °Ô½ÃÆÇ ÁÁ¾Æ¿ä
create sequence VFlike_seq
start with 1
increment by 1
nocycle
nocache;

-- ÀÔ¾ç ÈÄ ÀÌ¾ß±â °Ô½ÃÆÇ ´ñ±Û
create sequence AFcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- ÀÔ¾ç ÈÄ ÀÌ¾ß±â °Ô½ÃÆÇ ÁÁ¾Æ¿ä
create sequence AFlike_seq
start with 1
increment by 1
nocycle
nocache;

-- ½Å°í
create sequence report_seq
increment by 1
start with 1
nocache
nocycle;

-- ÀÌ¹ÌÁö
create sequence image_seq
increment by 1
start with 1
nocache
nocycle;

-- ¼³¹®
CREATE SEQUENCE survey_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Á¦Àç
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



COMMENT ON COLUMN users.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

COMMENT ON COLUMN users.user_phone IS 'Áßº¹ ºÒ°¡';

COMMENT ON COLUMN users.user_email IS 'Áßº¹ ºÒ°¡';

COMMENT ON COLUMN users.user_act IS '»óÅÂÄÚµåºĞ·ù 1: È°µ¿, 2: È°µ¿ÁßÁö, 0: Å»Åğ(ºñÈ°µ¿) .  ±âº»°ªÀº 1';

COMMENT ON COLUMN users.user_repcnt IS '°ü¸®ÀÚ°¡ È¸¿ø¿¡ ½Å°íÁ¦ÀçÇÒ ¶§¸¶´Ù ´©ÀûµÇ´Â È½¼öÀÌ´Ù.  ±âº»°ªÀº 0.';

COMMENT ON COLUMN users.user_date IS '½Ã½ºÅÛ ³¯Â¥·Î ÀÔ·ÂµÊ.';

COMMENT ON COLUMN users.user_volcnt IS 'ºÀ»ç ÇÒ¶§¸¶´Ù 1¾¿ Áõ°¡';

COMMENT ON COLUMN users.user_level IS 'ºÀ»çÈ½¼ö°¡ 3È¸ ¸¶´Ù 1¾¿ Áõ°¡';

COMMENT ON COLUMN users.user_adoptchk IS 'ÀÔ¾çÇÑ °æ¿ì 1';

CREATE TABLE admin (
	admin_id	varchar2(20)		NOT NULL,
	admin_pwd	varchar2(30)		NOT NULL
);


COMMENT ON COLUMN admin.admin_id IS '°ü¸®ÀÚ´Â ÇÑ ¸íÀ¸·Î °¡Á¤ÇÏ¿´½À´Ï´Ù.';

CREATE TABLE volunteer (
	volunteer_id	number		NOT NULL,
	volunteer_detail	varchar2(2000)		NOT NULL,
	volunteer_date	date	DEFAULT sysdate	NOT NULL,
	volunteer_title	varchar2(100)		NOT NULL,
	volunteer_cnt	number	DEFAULT 0	NOT NULL,
	volunteer_time	varchar2(30)		NOT NULL,
	volunteer_due	varchar2(30)		NOT NULL,
	volunteer_limit	number		NOT NULL,
	volunteer_cost	varchar2(20)	DEFAULT '¾øÀ½'	NOT NULL,
	volunteer_location	varchar2(100)		NOT NULL,
	volunteer_progress	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);


COMMENT ON COLUMN volunteer.volunteer_date IS 'ÀÛ¼ºÇÑ ´çÀÏ·Î ÀÔ·Â';

COMMENT ON COLUMN volunteer.volunteer_progress IS '½ÅÃ» °¡´É ÀÏÀÚ¿Í ¸ğÁı ÀÎ¿ø¿¡ µû¶ó 0 : ¸ğÁı Àü, 1 : ¸ğÁı Áß, 2 : ¸ğÁı¿Ï·á,  3 : ¸ğÁı Á¾·á ·Î ³ª´¶´Ù.';

COMMENT ON COLUMN volunteer.admin_id IS '°ü¸®ÀÚ´Â ÇÑ ¸íÀ¸·Î °¡Á¤ÇÏ¿´½À´Ï´Ù.';

CREATE TABLE adoption (
	adoption_id	number		NOT NULL,
	adoption_content	varchar2(2000)		NOT NULL,
	adoption_date	date	DEFAULT sysdate	NOT NULL,
	adoption_title	varchar2(100)		NOT NULL,
	adoption_cnt	number	DEFAULT 0	NOT NULL,
	adoption_status	varchar2(20)	DEFAULT '°ø°íÁß'	NOT NULL,
	adoption_level	varchar2(20)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL,
	animal_id	number		NOT NULL
);

COMMENT ON COLUMN adoption.adoption_level IS 'ÀÔ¾ç °ø°íÀÇ µ¿¹°¸¶´Ù ·¹º§ Á¦ÇÑÀÌ ´Ş¶óÁü';

COMMENT ON COLUMN adoption.admin_id IS '°ü¸®ÀÚ´Â ÇÑ ¸íÀ¸·Î °¡Á¤ÇÏ¿´½À´Ï´Ù.';

CREATE TABLE freeBoard (
	fboard_id	number		NOT NULL,
	fboard_title	varchar2(80)		NOT NULL,
	fboard_content	varchar2(2000)		NOT NULL,
	fboard_like	number	DEFAULT 0	NOT NULL,
	fboard_cnt	number	DEFAULT 0	NOT NULL,
	fboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN freeBoard.fboard_id IS 'ÀÚÀ¯°Ô½ÃÆÇ¿¡ ÀÛ¼ºµÈ ±ÛÀÇ °íÀ¯¹øÈ£';

COMMENT ON COLUMN freeBoard.fboard_like IS '¹öÆ°Å¬¸¯½Ã +1, ÇÑ¹ø ´õ Å¬¸¯½Ã -1';

COMMENT ON COLUMN freeBoard.fboard_cnt IS '³¯Â¥/Á¶È¸¼ö/ÁÁ¾Æ¿ä¼ö ¼øÀ¸·Î Á¤·Ä°¡´É';

COMMENT ON COLUMN freeBoard.fboard_date IS '°Ô½Ã±ÛÀÌ ÀÛ¼ºµÈ ³¯Â¥ ¹× ½Ã°£ Ç¥½Ã';

COMMENT ON COLUMN freeBoard.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

CREATE TABLE Fcomment (
	fcomment_id	number		NOT NULL,
	fcomment_content	varchar2(150)		NOT NULL,
	fcomment_date	date	DEFAULT sysdate	NOT NULL,
	fboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN Fcomment.fcomment_id IS 'ÀÚÀ¯±Û ´ñ±Û °íÀ¯ID';

COMMENT ON COLUMN Fcomment.fboard_id IS 'ÀÚÀ¯°Ô½ÃÆÇ¿¡ ÀÛ¼ºµÈ ±ÛÀÇ °íÀ¯¹øÈ£';

COMMENT ON COLUMN Fcomment.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

CREATE TABLE counseling (
	counseling_id	number		NOT NULL,
	counseling_schedule	date		NOT NULL,
	user_id	varchar2(20)		NOT NULL,
	adoption_id	number		NOT NULL,
	counseling_date	date	DEFAULT sysdate	NOT NULL,
	counseling_judgment	varchar2(20)	DEFAULT '¹ÌÈ®ÀÎ'	NOT NULL,
	counseling_detail	varchar2(2000)		NULL,
	counseling_age	number		NOT NULL,
	counseling_address	varchar2(100)		NOT NULL,
	counseling_job	varchar2(40)		NOT NULL,
	counseling_adopt	number	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN counseling.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

COMMENT ON COLUMN counseling.counseling_judgment IS '°ü¸®ÀÚ¸¸ ¼öÁ¤°¡´É';

COMMENT ON COLUMN counseling.counseling_detail IS '°ü¸®ÀÚ¸¸ Á¶È¸ ¼öÁ¤ »èÁ¦';

COMMENT ON COLUMN counseling.counseling_adopt IS '0 : ÀÔ¾ç , 1 : ÀÓ½Ãº¸È£';

CREATE TABLE application (
	application_id	number		NOT NULL,
	application_date	date	DEFAULT sysdate	NOT NULL,
	application_comment	varchar2(150)		NULL,
	user_id	varchar2(20)		NOT NULL,
	volunteer_id	number		NOT NULL,
	application_result	number	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN application.application_date IS '´çÀÏ ·Î ÀÔ·ÂµÇ°Ô ÇÑ´Ù';

COMMENT ON COLUMN application.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

COMMENT ON COLUMN application.application_result IS 'ÀÌÇà½Ã 1 ÀÌÇà ÇÏÁö ¾ÊÀ»½Ã 0±×´ë·Î';

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

COMMENT ON COLUMN donate.donate_PM IS 'Ä«µå°áÁ¦·Î¸¸ °¡´ÉÇÏ´Ù';

COMMENT ON COLUMN donate.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

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

COMMENT ON COLUMN animal.animal_species IS '°­¾ÆÁö ¶Ç´Â °í¾çÀÌ';

COMMENT ON COLUMN animal.admin_id IS '°ü¸®ÀÚ´Â ÇÑ ¸íÀ¸·Î °¡Á¤ÇÏ¿´½À´Ï´Ù.';

COMMENT ON COLUMN animal.animal_temp IS '0 : ºÒ°¡´É 1 : È£½ºÇÇ½º 2 : Àå±âÃ¼·ù 3: ½ÉÀå»ç»óÃæ';


CREATE TABLE flike (
	flike_id	number		NOT NULL,
	fliuser_id	varchar2(20)		NOT NULL,
	fboard_id	number		NOT NULL,
	flike_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN flike.fliuser_id IS 'ÁÁ¾Æ¿ä ´©¸¥ È¸¿ø ID';

CREATE TABLE noticeBoard (
	nboard_id	number		NOT NULL,
	nboard_title	varchar2(80)		NOT NULL,
	nboard_content	varchar2(2000)		NOT NULL,
	nboard_date	date	DEFAULT sysdate	NOT NULL,
	nboard_cnt	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN noticeBoard.nboard_id IS '°øÁö°Ô½ÃÆÇ¿¡ ÀÛ¼ºµÈ ±ÛÀÇ °íÀ¯¹øÈ£';

COMMENT ON COLUMN noticeBoard.nboard_date IS '°Ô½Ã±ÛÀÌ ÀÛ¼ºµÈ ³¯Â¥ ¹× ½Ã°£ Ç¥½Ã';

COMMENT ON COLUMN noticeBoard.nboard_cnt IS '±Û ÆäÀÌÁö Á¢¼ÓÇÒ¶§¸¶´Ù Á¶È¸¼ö 1Áõ°¡';

COMMENT ON COLUMN noticeBoard.admin_id IS '°ü¸®ÀÚ´Â ÇÑ ¸íÀ¸·Î °¡Á¤ÇÏ¿´½À´Ï´Ù.';

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

COMMENT ON COLUMN image.board_sort IS '1.À¯±âµ¿¹°, 2.ÀÔ¾ç°ø°í, 3.ºÀ»ç°ø°í, 4.ÀÚÀ¯°Ô½ÃÆÇ, 5.°øÁö°Ô½ÃÆÇ, 6.ºÀ»çÈÄ±â, 7.ÀÔ¾çÈÄ±â';

COMMENT ON COLUMN image.nboard_id IS '°øÁö°Ô½ÃÆÇ¿¡ ÀÛ¼ºµÈ ±ÛÀÇ °íÀ¯¹øÈ£';

COMMENT ON COLUMN image.fboard_id IS 'ÀÚÀ¯°Ô½ÃÆÇ¿¡ ÀÛ¼ºµÈ ±ÛÀÇ °íÀ¯¹øÈ£';

CREATE TABLE volunteerFeedbackBoard (
	vfboard_id	number		NOT NULL,
	vfboard_title	varchar2(80)		NOT NULL,
	vfboard_content	varchar2(2000)		NOT NULL,
	vfboard_like	number	DEFAULT 0	NOT NULL,
	vfboard_cnt	number	DEFAULT 0	NOT NULL,
	vfboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN volunteerFeedbackBoard.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

CREATE TABLE adoptionFeedbackBoard (
	afboard_id	number		NOT NULL,
	afboard_title	varchar2(80)		NOT NULL,
	afboard_content	varchar2(2000)		NOT NULL,
	afboard_like	number	DEFAULT 0	NOT NULL,
	afboard_cnt	number	DEFAULT 0	NOT NULL,
	afboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN adoptionFeedbackBoard.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

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

COMMENT ON COLUMN survey.survey_id IS '¼³¹® °íÀ¯ ID';

COMMENT ON COLUMN survey.counseling_id IS '¿¹¾à °íÀ¯ ID';

CREATE TABLE VFcomment (
	vfcomment_id	number		NOT NULL,
	vfcomment_content	varchar2(150)		NOT NULL,
	vfcomment_date	date	DEFAULT sysdate	NOT NULL,
	vfboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN VFcomment.vfcomment_id IS 'ºÀ»çÈÄ±â±Û ´ñ±Û °íÀ¯ID';

COMMENT ON COLUMN VFcomment.vfcomment_content IS 'ºÀ»çÈÄ±â ´ñ±Û ³»¿ë';

COMMENT ON COLUMN VFcomment.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

CREATE TABLE AFcomment (
	afcomment_id	number		NOT NULL,
	afcomment_content	varchar2(150)		NOT NULL,
	afcomment_date	date	DEFAULT sysdate	NOT NULL,
	afboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN AFcomment.user_id IS 'È¸¿øÀº ID·Î ±¸ºĞ';

CREATE TABLE VFlike (
	vflike_id	number		NOT NULL,
	vfliuser_id	varchar2(20)		NOT NULL,
	vflike_date	date	DEFAULT sysdate	NOT NULL,
	vfboard_id	number		NOT NULL
);

COMMENT ON COLUMN VFlike.vfliuser_id IS 'ÁÁ¾Æ¿ä ´©¸¥ È¸¿ø ID';

CREATE TABLE AFlike (
	aflike_id	number		NOT NULL,
	afliuser_id	varchar2(20)		NOT NULL,
	aflike_date	date	DEFAULT sysdate	NOT NULL,
	afboard_id	number		NOT NULL
);

COMMENT ON COLUMN AFlike.afliuser_id IS 'ÁÁ¾Æ¿ä ´©¸¥ È¸¿ø ID';

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

COMMENT ON COLUMN report.report_date IS '1. ¿å¼³ / 2. µµ¹è / 3. ±¤°í / 4. ±âÅ¸';

COMMENT ON COLUMN report.report_status IS '1. ½Å°íµÊ / 2. Ã³¸®µÊ';

COMMENT ON COLUMN report.fboard_id IS 'ÀÚÀ¯°Ô½ÃÆÇ¿¡ ÀÛ¼ºµÈ ±ÛÀÇ °íÀ¯¹øÈ£';

COMMENT ON COLUMN report.fcomment_id IS 'ÀÚÀ¯±Û ´ñ±Û °íÀ¯ID';

COMMENT ON COLUMN report.vfcomment_id IS 'ºÀ»çÈÄ±â±Û ´ñ±Û °íÀ¯ID';

COMMENT ON COLUMN report.user_id IS '½Å°íÇÑ È¸¿ø ID';

CREATE TABLE sanction (
	sanction_id	number		NOT NULL,
	sanction_status	number		NOT NULL,
	sanction_result	number		NOT NULL,
	sanction_date	date	DEFAULT sysdate	NOT NULL,
	report_id	number		NOT NULL
);

COMMENT ON COLUMN sanction.sanction_status IS '1. ½Å°íÁ¦Àç / 2. ½Å°í¹«½Ã';

COMMENT ON COLUMN sanction.sanction_result IS '1. °Ô½Ã±Û»èÁ¦ / 2. À¯ÀúÈ°µ¿Á¤Áö / 3. °èÁ¤»èÁ¦';

-- ±âÁ¸ À¯Àú ´õ¹Ì µ¥ÀÌÅÍ : ÇÚµåÆù¹øÈ£ ÇÏÀÌÇÂ ¾ø´Â Çü½Ä º¯°æ
insert all 
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member01', 'password', '±è¿µÀÏ', '01010112311', 'member01@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member02', 'password', '±è¿µÀÌ', '01022341222', 'member02@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member03', 'password', '±è¿µ»ï', '01033312333', 'member03@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member04', 'password', '±è¿µ»ç', '01044445644', 'member04@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member05', 'password', '±è¿µ¿À', '01055545655', 'member05@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member06', 'password', '±è¿µÀ°', '01066645666', 'member06@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member07', 'password', '±è¿µÄ¥', '01077778977', 'member07@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member08', 'password', '±è¿µÆÈ', '01088878988', 'member08@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member09', 'password', '±è¿µ±¸', '01099978999', 'member09@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member10', 'password', '±èÀÏ¿µ', '01010101010', 'member10@naver.com')
select * from dual;

-- ÅëÇÕÅ×½ºÆ® µ¥ÀÌÅÍ(ÀüÃ¼ ÄÃ·³ ¼³Á¤ µ¥ÀÌÅÍ 55°³ ·¹ÄÚµå)
insert all
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february24', 'password', 'È²Àç¿ø', '01059613308', 'february24@naver.com', '2024-02-01', 1, 0, 30, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('august22', 'password', '¼­À±¼­', '01051858986', 'august22@daum.net', '2024-01-01', 1, 0, 30, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july31', 'password', '¿À¿µÈñ', '01900797907', 'july31@naver.com', '2024-01-01', 1, 0, 30, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('may12', 'password', '½ÅÁ¤È£', '01049549508', 'may12@gmail.com', '2023-12-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october3', 'password', '¼­Àº¿µ', '01719728387', 'october3@gmail.com', '2023-10-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september19', 'password', 'ÃÖÀ±¼­', '01048548022', 'september19@gmail.com', '2024-02-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july11', 'password', '±Ç¹ÎÁö', '01175348361', 'july11@naver.com', '2023-11-01', 1, 0, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february1', 'password', '¼­Áö¿ø', '01184321809', 'february1@gmail.com', '2024-02-01', 1, 1, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november24', 'password', 'ÇÑ¹Î°æ', '01074544982', 'november24@naver.com', '2024-03-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september16', 'password', 'ÀÓÁö¿¬', '01104936341', 'september16@daum.net', '2023-11-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september13', 'password', '¿ÀÁöÈÆ', '01760465706', 'september13@naver.com', '2023-12-01', 1, 0, 20, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november1', 'password', 'È²Àº¿µ', '01038544196', 'november1@naver.com', '2024-03-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july6', 'password', 'ÀåÁö¹Î', '01176035210', 'july6@naver.com', '2023-10-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('january8', 'password', '¼ÛÁö¿ø', '01607967859', 'january8@gmail.com', '2024-03-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march30', 'password', 'ÃÖ½Â¹Î', '01674195467', 'march30@gmail.com', '2023-12-01', 1, 1, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june6', 'password', '±ÇÁöÈÆ', '01915452393', 'june6@gmail.com', '2024-03-01', 1, 1, 20, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('august29', 'password', 'ÀÌ½ÂÇö', '01747037558', 'august29@gmail.com', '2023-10-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december3', 'password', '±Ç¿µÁø', '01765001823', 'december3@gmail.com', '2024-01-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november12', 'password', '±è¿µÈñ', '01786247971', 'november12@gmail.com', '2024-02-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july24', 'password', '½Å½Â¿ì', '01163242271', 'july24@gmail.com', '2024-03-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november14', 'password', 'È«¹ÌÁ¤', '01721568062', 'november14@gmail.com', '2024-01-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june16', 'password', 'ÀÓ¹ÎÈ£', '01022198886', 'june16@naver.com', '2023-10-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october7', 'password', '·ù¹Î¿µ', '01171132581', 'october7@gmail.com', '2024-03-01', 1, 1, 10, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april4', 'password', 'È«ÇöÁø', '01967233843', 'april4@gmail.com', '2023-12-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september21', 'password', '·ùÇöÁÖ', '01979758872', 'september21@naver.com', '2023-11-01', 1, 0, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september9', 'password', '½ÅÁ¤È£', '01112511206', 'september9@naver.com', '2023-10-01', 1, 1, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('january3', 'password', '¾ÈÁ¤ÈÆ', '01082573129', 'january3@daum.net', '2024-03-01', 1, 1, 10, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('august30', 'password', 'ÃÖ½ÂÇö', '01968891010', 'august30@daum.net', '2023-11-01', 1, 1, 3, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september8', 'password', '½Å¼º¿ì', '01735313674', 'september8@naver.com', '2024-02-01', 1, 1, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('july4', 'password', 'Á¤¿µÈñ', '01958232395', 'july4@gmail.com', '2023-12-01', 1, 1, 3, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june27', 'password', 'È«¿µÁø', '01007080963', 'june27@naver.com', '2023-12-01', 1, 1, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('june21', 'password', '°­Çı°æ', '01680577273', 'june21@naver.com', '2024-02-01', 1, 0, 3, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april26', 'password', '½ÅÁö¿ì', '01905154153', 'april26@naver.com', '2023-11-01', 1, 1, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september28', 'password', 'È«¼öÁø', '01798766276', 'september28@gmail.com', '2024-02-01', 1, 0, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march9', 'password', '°­¹ÌÁ¤', '01697723896', 'march9@daum.net', '2023-11-01', 1, 1, 2, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october29', 'password', 'Á¤Çö¿µ', '01033044775', 'october29@daum.net', '2024-02-01', 1, 0, 2, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march5', 'password', '±Ç¼­¿¬', '01118512843', 'march5@daum.net', '2024-03-01', 1, 1, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april13', 'password', 'ÇÑ¼º¿ì', '01941812094', 'april13@naver.com', '2024-02-01', 1, 1, 30, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december6', 'password', '±Ç½Â¿ì', '01701998752', 'december6@daum.net', '2023-12-01', 1, 0, 20, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november15', 'password', '¾È¼­¿¬', '01141519529', 'november15@daum.net', '2024-03-01', 1, 0, 0, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november20', 'password', '¾È¹Ì¿µ', '01657918229', 'november20@naver.com', '2024-02-01', 1, 1, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february28', 'password', 'È«ÁöÇö', '01927411687', 'february28@naver.com', '2024-02-01', 1, 1, 10, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april23', 'password', '·ùÁø¿µ', '01783989902', 'april23@gmail.com', '2024-02-01', 1, 1, 0, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september15', 'password', '½Å½Â¹Î', '01982200268', 'september15@naver.com', '2024-03-01', 1, 0, 2, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('march11', 'password', 'ÇÑÀ±¼­', '01754812797', 'march11@gmail.com', '2023-10-01', 1, 1, 0, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('september5', 'password', 'Á¶ÇöÁÖ', '01019605947', 'september5@gmail.com', '2024-02-01', 2, 2, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december29', 'password', '¼­À±¼­', '01035514424', 'december29@naver.com', '2024-01-01', 2, 2, 1, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('april16', 'password', '±ÇÁö¿ø', '01765549245', 'april16@daum.net', '2024-03-01', 2, 2, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('december25', 'password', '±è¹Ì¿µ', '01149345495', 'december25@naver.com', '2024-02-01', 2, 2, 0, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february23', 'password', 'À±¼­¿¬', '01007695449', 'february23@naver.com', '2024-03-01', 2, 2, 0, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('january7', 'password', 'À±Çı°æ', '01915876324', 'january7@naver.com', '2023-10-01', 0, 3, 1, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february19', 'password', 'Á¶Á¤È£', '01770431531', 'february19@naver.com', '2023-12-01', 0, 3, 3, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('february10', 'password', 'Á¶¼º¿ì', '01745618299', 'february10@daum.net', '2024-01-01', 0, 3, 2, 0)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('november6', 'password', '°­Áö¹Î', '01603075215', 'november6@daum.net', '2023-10-01', 0, 3, 1, 1)
into users(user_id, user_pwd, user_name, user_phone, user_email, user_date, user_act, user_repcnt, user_volcnt, user_adoptchk)
values('october2', 'password', 'À±¹ÎÁö', '01002312264', 'october2@naver.com', '2024-02-01', 0, 3, 0, 1)
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
	volunteer_cost	varchar2(20)	DEFAULT '¾øÀ½'	NOT NULL,
	volunteer_location	varchar2(100)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);

-- ÆÄÀÏ¸íÀ» À§ÇÑ ÇÊµå
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

-- ºÀ»ç °ø°í
create sequence volunteer_seq
start with 1
increment by 1
nocycle
nocache;

-- ºÀ»ç ½ÅÃ»
create sequence application_seq
start with 1
increment by 1
nocycle
nocache;