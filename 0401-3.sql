/*
    ROWNUM
        - rownum은 쿼리 결과에서 각 행의 순번을 나타내는 가상의 컬럼이다.
*/
select empno, ename, sal from emp; -- 기본 (rownum 순번 적용X)
select empno, ename, sal, rownum from emp; --rownum 순번 적용
select empno, ename, sal, rownum from emp order by sal;-- rownum 순번이 먼저 적용되고 sal의 정렬이 적용됨
select e.*, rownum from (select empno,ename,sal from emp order by sal)  e; 

// sal기준으로 정렬후 rownum 적용 그다음에 rownum 1~5까지 출력
select e.*, rownum  from(select empno,ename,sal from emp order by sal) e  where rownum between 1 and 5;-- 방법1
select * from(select e.*, rownum as r  from(select empno,ename,sal from emp order by sal) e )  where r between 1 and 5;-- 방법2

/*
    시퀀스 ( 1씩 자동 증가 번호 명령어)
        - 시퀀스는 자동으로 증가하는 일련번호를 생성하는 객체
        - 테이블의 특정컬럼에 유일한 값을 지정하기위해 사용
        - 이름을 마음대로 지어도 되지만 
            테이블명_seq라고 유추가능하게 지어준다.
        
        기본형
            create sequence 시퀀스명 옵션 ;
        
        시퀀스옵션
/*
commit;
create sequence test_seq ;
drop table test;
insert  into test values(test_seq.nextval,'test01');
select * from test;

create table test_1(
    num numner primary key,
    name varchar2(100)
);
create sequence test_1_seq ;
insert into test_1 values(test_1_seq.nextval, 'test01');
insert into test_1 values(test_1_seq.nextval, 'test02');
insert into test_1 values(test_1_seq.nextval, 'test03');
select * from test_1;
commit;