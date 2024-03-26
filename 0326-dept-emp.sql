
// 테이블 컬럼 조회 /검색(select)
// select 컬럼명 from 테이블명;
// select * from 테이블명; - 해당 테이블 전체 조회
select * from dept;
select * from emp;
select empno from emp;
select empno,ename,sal from emp;

//중복제거 후 검색 - DISTINCT
//select DISTINCT 컬럼명 FROM 테이블명
select distinct deptno from dept;
select distinct job from emp;
select distinct deptno, job from emp;

// 별칭 붙여 검색
// select 컬럼명 as 별칭 from 테이블명;
//          * as 생략가능
select job as j from emp;
select empno ep, ename em from emp;
select empno,sal, sal+500 as b from emp;

// 정렬(desc 내림차순, asc 오름차순)
//select 컬럼명 from 테이블명 order by 컬럼명;
select * from emp order by sal ;
select * from emp order by deptno, sal desc, hiredate;

/*where 조건문
    select 컬럼명 from 테이블 명  where 조건식;
    등가비교
    select 컬럼명 from 테이블명 where 컬럼명 = 값;
*/
select * from emp where deptno = 10;
select * from emp where job ='salesman';// 소문자라서 값이 나오지 않음
select * from emp where job ='SALESMAN';// 컬럼명의 값은 대소문자를 구분한다.

// 비교 연산자 >,<,>=,<=
//select 컬럼명 from 테이블명 where 컬럼명  > 값;
select * from emp where sal >= 3000;
select * from emp where ename > 'C';// 문자로 비교할때 > 는 초과가아닌 이상이다
select ename, hiredate from emp where hiredate > '1985/01/01';//날짜 > 는 초과다

/*AND 연산자
    select 컬럼명 from 테이블명 where 컬럼명 > 값 AND 컬럼명 = 값;
*/
select * from emp where sal >= 1500 AND deptno = 30;
select * from emp where sal >=1500 AND deptno = 30 AND job = 'MANAGER';

//or 연산자
// select 컬러명 from 테이블명 where 컬럼명 > 값 or 컬럼명 = 값;
select * from emp where deptno = 10 or deptno=20;
select ename, job from emp where job='MANAGER' or job= 'CLERK';

//not 연산자
//select 컬럼명 from 테이블명 where not 컬럼명 >값;
select *from emp where not sal = 3000;
select *from emp where sal != 3000;

//in 연산
//select 컬럼명 from 테이블명 where 컬럼명 in(값, 값, 값);
select * from emp where deptno in(10,20,50);
select * from emp where deptno = 10 or deptno=20 or deptno=50;
select * from emp where job in('MANAGER','SALESMAN');

// NOT IN 연산자
// select 컬럼명 from 테이블명 where 컬럼명 not in(값, 값, 값,....);
select * from emp where deptno not in(10,30,50);

// BETWEEN ~ AND 연산자
// select 컬럼명 from 테이블명 where 컬럼명  between 값 and 값;
select * from emp where sal between 1500 and 3000;
select * from emp where sal >= 1500 and sal <=3000;

//NOT BETWEEN ~ AND연산
// select 컬럼명 from 테이블명 where 컬럼명 not between 값 and 값;
select * from emp where sal not between 1500 and 3000;

//is null,is not null 연산
//select 컬럼명 from 테이블명 where 컬럼명 is null;
select * from emp where comm is null;
select * from emp where comm is not null;

//LIKE 연산자  
//select 컬럼명 from 테이블명 where 컬럼명 like '%%';
//*'A%' - A로 시작하는 문자
//*'%A' - A로 끝나는 문자
//*'%A%' - 문자중 A가 포함된 문자 
//*'_A%' - 두번째 문자가 A인 문자
//&'__A%'- 세번째 문자가 A인 문자

select ename from emp where ename like 'S%';    // s로시작
select ename from emp where ename like '%T';    // t로 끝남
select ename from emp where ename like '%S%';   // 이름중 S포함
select ename from emp where ename like '_A%';   // 이름중 두번째 글자가 A인 사원

//UNION 합집합 연산자
//* 비교하는 대상의 컬럼수와 타입이 같아야한다
//select 컬럼명 from 테이블명 union select 컬럼명 from 테이블명;
select * from emp where deptno=10 union select * from emp where deptno=20;

//다른경우(컬럼수)
select * from emp where deptno=10; 
//union 
select * from dept where deptno=20;

//다른경우 (데이터 타입)
select job from emp where deptno = 10;// varchar2
//union 
select deptno from dept where deptno=20;//number





create table dept( 
  deptno     number(2,0),   // 부서번호
  dname      varchar2(14),  // 부서이름
  loc        varchar2(13),  // 부서위치
  constraint pk_dept primary key (deptno) 
);

/*
    Create the EMP table which has a foreign key reference to the DEPT table.
    The foreign key will require that the DEPTNO in the EMP table exist in the DEPTNO column in the DEPT table.
*/
create table emp( //사원
  empno    number(4,0),     // 사원번호
  ename    varchar2(10),    // 사원이름
  job      varchar2(9),     // 업무
  mgr      number(4,0),     // 상관
  hiredate date,            // 입사 일자
  sal      number(7,2),     // 급여
  comm     number(7,2),     // 수당
  deptno   number(2,0),     // 부서번호
  constraint pk_emp primary key (empno), 
  constraint fk_deptno foreign key (deptno) references dept (deptno) 
);




insert into DEPT (DEPTNO, DNAME, LOC)
values(10, 'ACCOUNTING', 'NEW YORK');

/*
    Insert a row into DEPT table by column position.
*/
insert into dept 
values(20, 'RESEARCH', 'DALLAS');

insert into dept 
values(30, 'SALES', 'CHICAGO');

insert into dept 
values(40, 'OPERATIONS', 'BOSTON');

/*
    Insert EMP row, using TO_DATE function to cast string literal into an oracle DATE format.
*/
insert into emp 
values( 
 7839, 'KING', 'PRESIDENT', null, 
 to_date('17-11-1981','dd-mm-yyyy'), 
 5000, null, 10 
);

insert into emp 
values( 
 7698, 'BLAKE', 'MANAGER', 7839, 
 to_date('1-5-1981','dd-mm-yyyy'), 
 2850, null, 30 
);

insert into emp 
values( 
 7782, 'CLARK', 'MANAGER', 7839, 
 to_date('9-6-1981','dd-mm-yyyy'), 
 2450, null, 10 
);

insert into emp 
values( 
 7566, 'JONES', 'MANAGER', 7839, 
 to_date('2-4-1981','dd-mm-yyyy'), 
 2975, null, 20 
);

insert into emp 
values( 
 7788, 'SCOTT', 'ANALYST', 7566, 
 to_date('13-07-1987','dd-mm-yyyy') - 85, 
 3000, null, 20 
);

insert into emp 
values( 
 7902, 'FORD', 'ANALYST', 7566, 
 to_date('3-12-1981','dd-mm-yyyy'), 
 3000, null, 20 
);

insert into emp 
values( 
 7369, 'SMITH', 'CLERK', 7902, 
 to_date('17-12-1980','dd-mm-yyyy'), 
 800, null, 20 
);

insert into emp 
values( 
 7499, 'ALLEN', 'SALESMAN', 7698, 
 to_date('20-2-1981','dd-mm-yyyy'), 
 1600, 300, 30 
);

insert into emp 
values( 
 7521, 'WARD', 'SALESMAN', 7698, 
 to_date('22-2-1981','dd-mm-yyyy'), 
 1250, 500, 30 
);

insert into emp 
values( 
 7654, 'MARTIN', 'SALESMAN', 7698, 
 to_date('28-9-1981','dd-mm-yyyy'), 
 1250, 1400, 30 
);

insert into emp 
values( 
 7844, 'TURNER', 'SALESMAN', 7698, 
 to_date('8-9-1981','dd-mm-yyyy'), 
 1500, 0, 30 
);

insert into emp 
values( 
 7876, 'ADAMS', 'CLERK', 7788, 
 to_date('13-07-1987', 'dd-mm-yyyy') - 51, 
 1100, null, 20 
);

insert into emp 
values( 
 7900, 'JAMES', 'CLERK', 7698, 
 to_date('3-12-1981','dd-mm-yyyy'), 
 950, null, 30 
);

insert into emp 
values( 
 7934, 'MILLER', 'CLERK', 7782, 
 to_date('23-1-1982','dd-mm-yyyy'), 
 1300, null, 10 
);

commit;