create table tbl_reply (
    bno number not null,
    rno number not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replydate date default sysdate,
    updatedate date default sysdate,
    primary key(bno, rno)
);

alter table tbl_reply add constraint tbl_reply_bno foreign key(bno)
references tbl_board(bno);

create sequence tbl_reply_seq START WITH 1 MINVALUE 0;

commit

푸시용!!!!