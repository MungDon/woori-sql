select * from emp;

create table member(
    id         varchar2(50)     primary key,
    pw       varchar2(50)       not null,
    name    varchar2(50)     not null,
    birth       date                  not null,
    phone1   varchar2(100)   not null,
    phone2  varchar2(100)   not null,
    gender  varchar2(50)    not null,
    reg         date             default sysdate
);
drop table member;
delete from member where id = 'als8218';
select * from member;  
commit;

create table tb_board(
    board_sid   number(20)      generated always as identity,
    title               varchar2(50)    not null,
    content        varchar2(100)    not null,
    writer          varchar2(20)        not null,
    createdDate         timestamp       not null,
    modifiedDate       timestamp        not null
);
alter table tb_board add constraint pk_board_sid primary key(board_sid);
commit;

