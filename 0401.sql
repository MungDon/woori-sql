/*
    DBMS    - 데이터 베이스 관리 시스템
    SQL        - 구조화된 질의 언어
                    - 데이터 베이스의 생성, 레코드 검색 등의 작업을 수행할 때 사용이 된다
                    - 정의문(DDL) - CREATE, ALTER, DROP
                    - 제어문(DCL) - GRANT, REVOKE
                    - 조작문(DML) - UPDATE, INSERT, DELETE
                    - 쿼리               - SELECT
                    - 트랜잭션 처리 - COMMIT, ROLLBACK
                        : JSP 와의 연동을 위한
                            테이블 생성, 삭제
                            레코드 삽입/ 수정/ 삭제/ 검색 위주로 공부하고 사용함
                                = CRUD   
                                
    SQL Developer
        - 명령문 대소문자  구별안함 -> 대부분 소문자 사용
        - 보관되는 값은 대소문자 구별
        - 줄바꿈해도 줄글로 들어가기 때문에
            : 반드시 ; (세미콜론) 으로 끝내줘야함
        - 문자는 무조건 ''(홑따옴표) 사용
        - ,( 쉼표) 나열하고 마지막은 쓰지않는다.
        - CRUD 후 반드시 commit; 해야함
        - 실행 : 초록색 재생버튼/ Ctrl + Enter

    트랜잭션
        - 데이터베이스 작업의 단위중 하나이다.
        - 하나의 트랜잭션은 여러 SQL 문장으로 구성될 수 있다
        
        COMMIT          :   트랜잭션을 완료하고 변경 사항을 저장(최종저장)
        ROLLBACK    :   트랜잭션을 취소하고 변경사항을 되돌린다.
        
        - insert, update, delete 쿼리 실행 후 commit;
        - 추가완료! 수정완료! 삭제완료! 이며
            commit 후에는 rollback 으로 되돌아 갈 수 없다.
            쿼리 실행후 commit 하지 않고 rollback하면 실행전으로 되돌아 간다.
            
*/
create table test(
    num         number          primary key,
    name        varchar2(100)                   ,
    reg             date              default   sysdate,
    age         number              default 1
);
-- alter table 테이블명 add (컬럼명 타입 옵션);
--not null, primary key 사용못함
-- 컬럼의 순서 변경 불가 = 맨 마지막 순서에 추가
-- 테이블에 레코드(데이터) 가 있을때 옵션 사용 불가
alter table test add (age   number      default 1);
alter table test add(pw     varchar2(50)  not null ); // 레코드( 데이터) 가 있을때 not null 옵션 사용 불가를 확인하기 위한 쿼리문
insert into test values(1, 'java', sysdate, 10);

-- 테이블 컬럼 이름 변경
--alter table 테이블명 rename column 컬럼명 to 변경명;
alter table test rename column name to nick;

-- 테이블 컬럼 삭제
-- alter table 테이블명 drop column 컬럼명;
alter table test drop column pw;


commit;
select * from test;