
/* Drop Triggers */

DROP TRIGGER TRI_keyword_kw_no;
DROP TRIGGER TRI_letter_ltr_no;
DROP TRIGGER TRI_like_board_li_bo_no;
DROP TRIGGER TRI_like_reply_li_re_no;
DROP TRIGGER TRI_notify_nof_no;
DROP TRIGGER TRI_timetable_tt_no;



/* Drop Tables */

DROP TABLE free_board CASCADE CONSTRAINTS;
DROP TABLE info_board CASCADE CONSTRAINTS;
DROP TABLE keyword CASCADE CONSTRAINTS;
DROP TABLE letter CASCADE CONSTRAINTS;
DROP TABLE like_board CASCADE CONSTRAINTS;
DROP TABLE like_reply CASCADE CONSTRAINTS;
DROP TABLE notify CASCADE CONSTRAINTS;
DROP TABLE rereply CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE timetable CASCADE CONSTRAINTS;
DROP TABLE student CASCADE CONSTRAINTS;
DROP TABLE subject CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_keyword_kw_no;
DROP SEQUENCE SEQ_letter_ltr_no;
DROP SEQUENCE SEQ_like_board_li_bo_no;
DROP SEQUENCE SEQ_like_reply_li_re_no;
DROP SEQUENCE SEQ_notify_nof_no;
DROP SEQUENCE SEQ_timetable_tt_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_keyword_kw_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_letter_ltr_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_like_board_li_bo_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_like_reply_li_re_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_notify_nof_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_timetable_tt_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE free_board
(
	bo_no number NOT NULL CONSTRAINT free_pk UNIQUE,
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	fr_head varchar2(30) NOT NULL,
	fr_title varchar2(300) NOT NULL,
	fr_content varchar2(1000) NOT NULL,
	fr_pic varchar2(500),
	fr_tag varchar2(500),
	fr_hit number DEFAULT 0 NOT NULL,
	fr_time date DEFAULT LOCALTIMESTAMP NOT NULL,
	PRIMARY KEY (bo_no)
);


CREATE TABLE info_board
(
	bo_no number NOT NULL CONSTRAINT info_pk UNIQUE,
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	info_head varchar2(30) NOT NULL,
	info_title varchar2(300) NOT NULL,
	info_content varchar2(1000) NOT NULL,
	info_file varchar2(500),
	info_tag varchar2(500),
	info_hit number DEFAULT 0 NOT NULL,
	info_time date DEFAULT LOCALTIMESTAMP NOT NULL,
	PRIMARY KEY (bo_no)
);


CREATE TABLE keyword
(
	kw_no number NOT NULL CONSTRAINT kw_pk UNIQUE,
	keyword varchar2(30),
	reword varchar2(30) NOT NULL,
	kw_time date DEFAULT LOCALTIMESTAMP,
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	-- 적용-true
	-- 미적용-false
	kw_type varchar2(5) DEFAULT '0' NOT NULL,
	PRIMARY KEY (kw_no)
);


CREATE TABLE letter
(
	ltr_no number NOT NULL CONSTRAINT ltr_pk UNIQUE,
	send_time date DEFAULT LOCALTIMESTAMP NOT NULL,
	send_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	receive_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	ltr_title varchar2(300),
	ltr_content varchar2(500),
	ltr_read varchar2(5) DEFAULT '0' NOT NULL,
	PRIMARY KEY (ltr_no)
);


CREATE TABLE like_board
(
	li_bo_no number NOT NULL CONSTRAINT li_bo_pk UNIQUE,
	-- 같은 시퀀스 -> fk 적용x
	bo_no number NOT NULL,
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	PRIMARY KEY (li_bo_no)
);


CREATE TABLE like_reply
(
	li_re_no number NOT NULL CONSTRAINT li_re_pk UNIQUE,
	-- 댓글, 대댓글 같은 시퀀스
	-- fk 적용x
	re_no number NOT NULL,
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	PRIMARY KEY (li_re_no)
);


CREATE TABLE notify
(
	nof_no number NOT NULL CONSTRAINT nof_pk UNIQUE,
	nof_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	bo_no number,
	re_no number,
	-- 비방욕설/광고/음란물/도배 등등
	nof_type varchar2(50) NOT NULL,
	nof_content varchar2(500) NOT NULL,
	PRIMARY KEY (nof_no)
);


CREATE TABLE reply
(
	re_no number NOT NULL CONSTRAINT re_pk UNIQUE,
	-- 정보게시판, 자유게시판 두 테이블의 pk를 저장할 것이기 때문에 fk는 연결하지 않음
	bo_no number NOT NULL,
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	re_content varchar2(500) NOT NULL,
	re_time date DEFAULT LOCALTIMESTAMP NOT NULL,
	PRIMARY KEY (re_no)
);


CREATE TABLE rereply
(
	rere_no number NOT NULL CONSTRAINT rere_pk UNIQUE,
	re_no number NOT NULL CONSTRAINT re_pk UNIQUE,
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	rere_content varchar2(500) NOT NULL,
	rere_time date DEFAULT LOCALTIMESTAMP NOT NULL,
	PRIMARY KEY (rere_no)
);


CREATE TABLE student
(
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	st_pw varchar2(300) NOT NULL,
	st_name varchar2(50) NOT NULL,
	school varchar2(100) NOT NULL,
	major varchar2(100) NOT NULL,
	grade varchar2(20) NOT NULL,
	black varchar2(5) DEFAULT '0' NOT NULL,
	PRIMARY KEY (st_id)
);


CREATE TABLE subject
(
	sb_id varchar2(30) NOT NULL CONSTRAINT sb_pk UNIQUE,
	sb_name varchar2(100) NOT NULL,
	sb_time varchar2(20) NOT NULL,
	PRIMARY KEY (sb_id)
);


CREATE TABLE timetable
(
	tt_no number NOT NULL CONSTRAINT tt_pk UNIQUE,
	st_id varchar2(30) NOT NULL CONSTRAINT st_pk UNIQUE,
	sb_id varchar2(30) NOT NULL UNIQUE,
	week varchar2(10) NOT NULL,
	tt_time varchar2(10) NOT NULL,
	PRIMARY KEY (tt_no)
);



/* Create Foreign Keys */

ALTER TABLE rereply
	ADD FOREIGN KEY (re_no)
	REFERENCES reply (re_no)
;


ALTER TABLE free_board
	ADD FOREIGN KEY (st_id)
	REFERENCES student (st_id)
;


ALTER TABLE info_board
	ADD FOREIGN KEY (st_id)
	REFERENCES student (st_id)
;


ALTER TABLE keyword
	ADD FOREIGN KEY (st_id)
	REFERENCES student (st_id)
;


ALTER TABLE letter
	ADD FOREIGN KEY (receive_id)
	REFERENCES student (st_id)
;


ALTER TABLE letter
	ADD FOREIGN KEY (send_id)
	REFERENCES student (st_id)
;


ALTER TABLE like_board
	ADD FOREIGN KEY (st_id)
	REFERENCES student (st_id)
;


ALTER TABLE like_reply
	ADD FOREIGN KEY (st_id)
	REFERENCES student (st_id)
;


ALTER TABLE notify
	ADD FOREIGN KEY (nof_id)
	REFERENCES student (st_id)
;


ALTER TABLE notify
	ADD FOREIGN KEY (st_id)
	REFERENCES student (st_id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (st_id)
	REFERENCES student (st_id)
;


ALTER TABLE rereply
	ADD FOREIGN KEY (st_id)
	REFERENCES student (st_id)
;


ALTER TABLE timetable
	ADD FOREIGN KEY (st_id)
	REFERENCES student (st_id)
;


ALTER TABLE timetable
	ADD FOREIGN KEY (sb_id)
	REFERENCES subject (sb_id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_keyword_kw_no BEFORE INSERT ON keyword
FOR EACH ROW
BEGIN
	SELECT SEQ_keyword_kw_no.nextval
	INTO :new.kw_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_letter_ltr_no BEFORE INSERT ON letter
FOR EACH ROW
BEGIN
	SELECT SEQ_letter_ltr_no.nextval
	INTO :new.ltr_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_like_board_li_bo_no BEFORE INSERT ON like_board
FOR EACH ROW
BEGIN
	SELECT SEQ_like_board_li_bo_no.nextval
	INTO :new.li_bo_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_like_reply_li_re_no BEFORE INSERT ON like_reply
FOR EACH ROW
BEGIN
	SELECT SEQ_like_reply_li_re_no.nextval
	INTO :new.li_re_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_notify_nof_no BEFORE INSERT ON notify
FOR EACH ROW
BEGIN
	SELECT SEQ_notify_nof_no.nextval
	INTO :new.nof_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_timetable_tt_no BEFORE INSERT ON timetable
FOR EACH ROW
BEGIN
	SELECT SEQ_timetable_tt_no.nextval
	INTO :new.tt_no
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN keyword.kw_type IS '적용-true
미적용-false';
COMMENT ON COLUMN like_board.bo_no IS '같은 시퀀스 -> fk 적용x';
COMMENT ON COLUMN like_reply.re_no IS '댓글, 대댓글 같은 시퀀스
fk 적용x';
COMMENT ON COLUMN notify.nof_type IS '비방욕설/광고/음란물/도배 등등';
COMMENT ON COLUMN reply.bo_no IS '정보게시판, 자유게시판 두 테이블의 pk를 저장할 것이기 때문에 fk는 연결하지 않음';



