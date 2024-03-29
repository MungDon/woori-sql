//<문제풀이>//
//<<1>>  부서번호가 10번인 부서의 사람중 사원번호, 이름, 급여를 출력하라.
select empno, ename, sal from emp where deptno = 10;

//<<2>>  사원번호가 7839인 사람중 이름, 입사일자, 부서번호를 출력하라.
select ename, hiredate, deptno from emp where empno = 7839;

//<<3>>  이름이 ALLEN인 사람의 모든 정보를 출력하라.
select * from emp ,dept where emp.deptno = dept.deptno AND emp.ename='ALLEN';

//<<4>>  입사일자가 82/01/23인 사원의 이름, 부서번호, 급여를 출력하라.
select ename, deptno,sal from emp where hiredate='82/01/23';

//<<5>>  직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라.
select * from emp,dept where emp.deptno = dept.deptno AND emp.job !='MANAGER';

//<<6>>  입사일자가 81/04/02 이후에 입사한 사원의 정보를 출력하라.
select * from emp,dept where emp.deptno = dept.deptno AND emp.hiredate >='81/04/02';

//<<7>>  급여가 800이상인 사람의 이름, 급여, 부서번호를 출력하라.
select ename,sal,deptno from emp where sal >=800;

//<<8>>  부서번호가 20번 이상인 사원의 모든 정보를 출력하라.
select * from emp e, dept d where e.deptno = d.deptno AND e.deptno >=20;

//<<9>>  성명이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든 정보를 출력하라.
select * from emp e, dept d where e.deptno= d.deptno AND e.ename >='L%';

//<<10>>  입사일자가 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라.
select * from emp e, dept d where e.deptno = d.deptno AND e.hiredate < '81/12/09';

//<<11>>  입사번호가 7698 보다 작거나 같은 사람들의 입사번호와 이름을 출력하라.
select empno, ename	from emp where empno <=7698;

//<<12>>  입사일자가 81/04/02 보다 늦고 82/12/09 보다 빠른 사원의 이름, 급여, 부서번호를 출력하라.
select ename, sal, deptno from emp where hiredate >'81/04/02' AND hiredate <'82/12/09';	

//<<13>>  급여가 1,600 보다 크고 3,000 보다 작은 사람의 이름, 직무, 급여를 출력하라.
select ename, job,sal from emp where sal >1600 AND sal <3000;	

//<<14>>  사원번호가 7654와 7782 사이 이외의 사원의 모든 정보를 출력하라.
select * from emp e, dept d where e.deptno = d.deptno  AND e.empno not between 7654 AND 7782;

//<<15>> 이름이 B와 J 사이의 모든 사원의 정보를 출력하라.
select * from emp e, dept d where e.deptno = d.deptno AND e.ename between 'B%' AND 'J%';

//<<16>>  입사일자가 81년 이외에 입사한 사람의 모든 정보를 출력하라.
select * from emp e, dept d where e.deptno = d.deptno AND e.hiredate not like '81%';

//<<17>>  직무가 MANAGER와 SALESMAN인 사람의 모든 정보를 출력하라.
select * from emp e , dept d where e.deptno = d.deptno AND e.job in('MANAGER','SALESMAN');

//<<18>>  부서번호가 20,30번을 제외한 모든 사람의 이름, 사원번호, 부서번호를 출력하라.
select ename, empno, deptno from emp where deptno	not in(20,30);

//<<19>>  이름이 S로 시작하는 사원의 사원번호, 이름, 입사일자, 부서번호를 출력하라.
select empno, ename, hiredate,deptno from emp where ename like'S%';

//<<20>>  입사일자가 81년도인 사람의 모든정보를 출력하라.
select * from emp e ,dept d where e.deptno = d.deptno AND e.hiredate like'81%';	

//<<21>>  이름 중 S자가 들어가있는 사람만 모든정보를 출력하라.
select * from emp e , dept d where e.deptno = d.deptno AND e.ename like'%S%';

//<<22>>  이름이 S로 시작하고 마지막 글자가 T인 사람의 모든 정보를 출력하라 (단, 이름은 전체 5자리이다.)
select * from emp e ,dept d where e.deptno = d.deptno AND e.ename like'S___T' ;

//<<23>>  첫번째 문자는 관계 없고 두번째 문자가 A인 사람의 정보를 출력하라.
select * from emp e, dept d where e.deptno = d.deptno AND e.ename like'_A%';	

//<<24>>  커미션이 NULL인 사람의 정보를 출력하라.
select * from emp e,dept d where e.deptno = d.deptno AND e.comm is null;

//<<25>>  커미션이 NULL이아닌사람의모든정보를출력하라.
select * from emp e , dept d where e.deptno = d.deptno AND e.comm is not null;

//<<26>>  부서가 30번부서이고급여가 1,500 이상인 사람의 이름, 부서, 월급을 출력하라.
select ename,deptno , sal from emp where deptno=30 AND sal >=1500;

//<<27>>  이름의 첫글자가 K로 시작하거나 부서번호가 30인 사람의 사원번호, 이름, 부서번호를 출력하라.
select empno, ename, deptno from emp where ename like('K%') or deptno = 30;

//<<28>>  급여가 1,500 이상이고 부서번호가 30번인 사원중 직업이 MANAGER인 사람의 정보를 출력하라.
select * from emp e, dept d where e.deptno = d.deptno AND e.sal >=1500 AND e.deptno = 30 AND job in('MANAGER');

--<<29>>  부서번호가 30인 사람중 사원번호를 SORT 하라.
select * from emp where deptno=30 order by empno;

--<<30>>  급여가 많은순으로 SORT하라.
select * from emp order by sal desc;

--<<31>>  부서번호로 ASCENDING SORT한 후 급여가 많은 사람순으로 출력하라.
select * from emp order by deptno asc, sal desc;

--<<32>>  부서번호로 DESCENDING SORT하고 이름순으로 ASCENDING SORT, 급여순으로 DESCENDING SORT하라.
select * from emp order by deptno desc,ename asc,sal desc;

--------------------------JOIN--------------------------
--<<1>> EMP와 DEPT TABLE을 JOIN하여 부서번호, 부서명, 이름, 급여를 출력하라.
select e.deptno, d.dname,e.ename,e.sal from emp e , dept d where e.deptno = d.deptno ;

--<<2>> 이름이 'ALLEN'인 사원의 부서명을 출력하라.
select d.dname from emp e , dept d where e.deptno = d.deptno AND e.ename in('ALLEN');

--<<3>> EMP TABLE의 데이터를 출력하되 해당사원에 대한 상관번호와 상관의 이름을 함께 출력하라.
select  a.ename as junier , a.mgr as mgrno, b.ename as manager 
from emp a, emp  b 
where a.mgr= b.empno;


--<<4>> DEPT TABLE에는 존재하는 부서코드 이지만 해당부서에 근무하는 사람이 존재하지 않는 경우의 결과를 출력하라.
select * from dept
where deptno 
not in
(select deptno from emp group by deptno  having count(*)>0);  
                 
--<<5>> 'ALLEN'의 직무와 같은 사람의 이름, 부서명, 급여, 직무를 출력하라.
select e.ename , d.dname, e.sal, e.job 
    from emp e , dept d 
    where e.deptno = d.deptno   
    AND e.job in(
        select job 
        from emp 
        where ename ='ALLEN');

--<<6>> 'JONES'가 속해 있는 부서의 모든 사람의 사원번호, 이름, 입사일자, 급여를 출력하라.
select deptno, ename,hiredate, sal 
    from emp 
    where deptno in(
        select deptno 
        from emp 
        where ename='JONES');       
 
--<<7>> 전체 사원의 평균 임금 보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 위치, 급여를 출력하라.
select e.empno, e.ename,d.dname,e.hiredate,d.loc,e.sal 
    from emp e, dept d 
    where e.deptno = d.deptno 
    AND e.sal  > (
        select trunc(avg(sal)) 
        from emp ); 


--<<8>> 10번 부서 사람들 중에서 20번 부서의 사원과 같은 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일, 지역을 출력하라.
select e.empno, e.ename, d.dname,e.hiredate,d.loc 
    from emp e , dept d 
    where e.deptno = d.deptno 
    AND e.deptno=10 
    AND e.job in(
        select job 
        from emp 
        where deptno = 20);

--<<9>> 10번 부서 중에서 30번 부서에는 없는 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일자, 지역을 출력하라.
select e.empno, e.ename , d.dname ,e.hiredate,d.loc 
    from emp e , dept d 
    where e.deptno = d.deptno 
    AND e.deptno = 10
    AND e.job not in(
        select job 
        from emp 
        where deptno = 30);

--<<10>> 10번 부서에 근무하는 사원의 사원번호, 이름, 부서명, 지역, 급여를 급여가 많은 순으로 출력하라.
select e.empno, e.ename,d.dname,d.loc,e.sal from emp e, dept d where e.deptno = d.deptno AND e.deptno =10 order by sal desc;

--<<11>> 'MARTIN'이나 'SCOTT'의 급여와 같은 사원의 사원번호, 이름, 급여를 출력하라.
select empno, ename,sal 
    from emp 
    where sal in(
        select sal 
        from emp 
        where ename in('MARTIN','SCOTT'));


--<<12>> 급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select empno,ename,sal 
    from emp 
    where sal >(select max(sal) from emp where deptno=30);

--<<13>> 급여가 30번 부서의 최저급여 보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select empno,ename,sal 
    from emp 
    where sal  > (select min(sal) from emp where deptno=30);
    
    // * CRUD*
    /*
        create, read(select),update,delete
        우대사항 - 능숙 ㄴㄴ ,배웠고 알고있고 써봤나
        
        SQL 사용
        - 글자는 무조건 "(홑따옴표)
        -,(쉼표) 마지막에 사용 ㄴㄴ
        - commit;
        
        * 생성 - create
            create table 테이블명(
                    컬럼이름        타입          옵션,
                    컬럼이름        타입          옵션,
                    컬럼이름        타입          옵션
            );
             - 타입
                        선택 아님 필수
                        varchar2(가변길이)   - 문자
                        number                      - 숫자/ 정수 실수 모두포함
                        date                            - 날짜 
            - 옵션
                        필수 아님 선택
                        primary key     :   고유값(키), 컬럼값에서 중복 불가
                                                        하나의 컬럼만 가능
                        not null             :  null값 불가능
                        default              :  입력을 하지않았을때 들어가는 기본값
                        unique              :   값 중복 불가
                        check                :   조건문, 검사 같은 기능
                                                    check 컬럼명  > 0 and 컬럼명 <100
*/
create table member(
    id        varchar2(50)       primary key, 
    pw      varchar2(50)      not null,
    birth      date                 ,
    age     number              default 1,
    name  varchar2(50)      ,
    reg        date                    default     sysdate
);
commit;
/*
    insert 데이터 추가
        insert into 테이블명 values(값,값,값,);
        : 테이블의 모든 컬럼에 값을 넣는다
         컬럼의 순서 , 타입에 맞게  값을 넣어야한다
*/
insert into member 

values('java','1234','00/08/09',25,'oracle',sysdate);

select * from member;
insert into member values('spring','1111','00/11/11',25,'postgreSQL',sysdate);

// name = null
insert into member values('test','2222','11/11/11',26,Null,sysdate);

//컬럼을 지정해서 값넣음
// insert into 테이블명(컬럼명, 컬럼명,컬럼명)values(값,값,값);

insert into member(id,pw) values('min','11'); 

insert into member(id,pw,name)values('jsp','2222','aaaa');
--insert into member(id,pw,birth)values('css');
--컬럼 옵션
    --pw는 not null 이라 필수로 추가해야함
    --primary key 도 같다
insert into member(id,pw,birth)values('css','1234','12/12/12');

-- update - 수정
-- update 테이블명 set 컬럼명 = 값;
-- update 테이블명 set 컬럼명 = 값, 컬럼명 = 값;
update member set pw='5555';

update member set pw ='1234', name='guest',age=20;

--update 테이블명 set 컬럼명 = 값 where 조건식;
update member set pw='0000' where id= 'test';

update member set pw= '1212' where birth > '11/11/11';

select * from member;

update member set pw='2223',age = 30 , name='takSSAM' where id='css';
update member set pw='2323',age = 32 , birth='12/04/24' ,name='min' where id='min';
update member set pw='3223',age = 20 , birth='12/03/14' ,name='hyeong' where id='jsp';
update member set pw='4544',age = 34 , name='sung' where id='spring';
update member set pw='2443',age = 35 , name='smh' where id='test';
select * from member;
commit;
/*
    delete 삭제
        delete from 테이블명;
*/
delete from member;
-- where 조건식의 사용법은 select 문에서 사용법과 같다.
-- delete from 테이블명 where 조건식;
delete from member where id='test'; 

-- 테이블 삭제 drop table 테이블명;
drop table member;