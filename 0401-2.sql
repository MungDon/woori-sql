/*
    DB의 계정과 테이블 확인
    계정의 생성된 모든 테이블 확인
    select table_name from user_tables;
*/
select table_name from user_tables;
/*
    DB의 모든 계정 테이블 확인
    select owner, table_name from all_tables;
*/
select owner, table_name from all_tables;
/*
    DB의 모든 계정 테이블의 상세정보 확인
    select * from dba_tables;
*/
select * from dba_tables;
/*
    DB의 모든 계정 확인
    select * from dba_users;
*/
select * from dba_users;

/*
    DB의 'SCOTT' 계정 확인
    select * from dba_users where username = 'SCOTT';
    * group by 의 조건문만 having*
*/
select * from dba_users where username = 'SCOTT';
/*
    인덱스
        - 오라클 인덱스는 테이블의 특정 컬럼(열)에 대한 검색 속도를 향상시키는 데이터 구조이다.
        - 책의 목차와 비슷하게 
            인덱스는 데이터베이스 검색엔진이 특정 값을 지닌 행(레코드)을 빠르게 찾을 수 있도록 돕는다.
        - 테이블에 인덱스를 적용 시켜놓으면 where , join  , order by , group by  에서
            인덱스가 적용된 컬럼을 사용한다면 
            검색속도가 향상된다.
        
        현재 계정의 모든 인덱스에 대한 정보를 조회
        select * form user_indexes;
*/
select * from user_indexes;
/*
    현재 계정의 모든 인덱스에 속한 컬럼 정보 조회
    select * from user_ind_columns;
*/
select * from user_ind_columns;
/*
    IND_EMP_SAL 인덱스생성 EMP 테이블에 SAL컬럼에 인덱스추가
    create index ind_emp_sal on emp(sal);
*/
create index ind_emp_sal on emp(sal);
commit;
/*
    인덱스삭제
    drop index ind_emp_sal;
*/
drop index ind_emp_sal;
/*
    뷰
        - 오라클 뷰는 실제 테이블에 저장되지않는 가상의 테이블이다.
        - 실제 테이블처럼 사용될 수 있으며 데이터 추가, 수정, 삭제 등을 제외한 대부분의  SQL 작업을 수행 할 수있다
        - select 로 자주 검색하는 테이블의 필요한 컬럼 및 조건으로 검색된 것을 뷰로 만들고 사용한다.
        
       * 장점 *   
        데이터 통합 - 여러 테이블의 데이터를 하나의 뷰로 결합할 수 있다.
        데이터 추상화     :   복잡한 쿼리문을 간단하게 표현 할 수 있다 
        데이터 보안  :   민감한 데이터를 숨길 수 있다.
        데이터 접근제어    :   사용자에게 특정 데이터만 제공 할 수 있다.
        
       * 단점 *

    vw_emp20 이름으로 뷰 생성       
    create view vw_emp20 as(select empno, ename, job,deptno from emp where deptno = 20);
*/
create view vw_emp20 as(select empno, ename, job,deptno from emp where deptno = 20);
commit;
/*
    계정의 모든 뷰를 확인
    select * from user_views;
*/
select * from user_views;
/*
    뷰의 특정 정보만 확인
    select view_name,text_length, text from user_views;
*/
select view_name,text_length, text from user_views;
/*
    뷰 검색 - 테이블 검색과 같다
    select * from vw_emp20;
*/
select * from vw_emp20;
/*
    뷰 삭제
    drop view vw_emp20;
*/
drop view vw_emp20;
commit;

