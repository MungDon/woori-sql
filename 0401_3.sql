/*
    ROWNUM
        - rownum은 쿼리 결과에서 각 행의 순번을 나타내는 가상의 컬럼이다.
*/

select empno, ename, sal from emp; 
select empno, ename, sal, rownum from emp; --rownum 순번 적용
select empno, ename, sal, rownum from emp order by sal;-- rownum 순번이 먼저 적용되고 sal의 정렬이 적용됨
select e.*, rownum from (select empno,ename,sal from emp order by sal)  e; 

--sal기준으로 정렬후 rownum 적용 그다음에 rownum 1~5까지 출력
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
          - start with                :    시작값( 기본값 1)
          - increment by       :   증가값(기본값 1)
          - maxvalue               :    최대증가값(~까지)
          - nomaxvalue           :    기본값 (최대값 없음)
          - minvalue                :  기본값 1  
                                                최소값 / 최대값 설정 시 
                                                최대 값까지 증가하면 다시 최소값부터 시작된다
         - cycle                        :   기본값 nocycle
         - nocycle                    :     반복 적용안함.
         - cache                        :   기본값 20 - 미리 만들어놓은값
                                                                     사용 할때마다 제공,
                                                                     사용되지 못한 값은 폐기된다.
        - nocache                    :  기본값 cache 20을 사용안한다는 뜻
*/
create sequence test1_seq start with 10 increment by 2 maxvalue 100 minvalue 1 cycle nocache;--예시
commit;
create sequence test_seq ;
drop table test;
insert  into test values(test_seq.nextval,'test01');
select * from test;

create table test(
    num number primary key,
    name varchar2(100)
);
create sequence test_seq ;
insert into test values(test_seq.nextval, 'test01');
insert into test values(test_seq.nextval, 'test02');
insert into test values(test_seq.nextval, 'test03');
select * from test;
commit;

select * from emp;



