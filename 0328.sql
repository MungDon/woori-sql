//자료형의 변환 - to_char, to_date,to_number
//* to_char - 문자로 변경
//* to_date - 날짜로 변경
//* to_number - 숫자로 변경
select to_char(sysdate) from dual;// 현재 날짜를 문자형으로 변경
select to_date('24/03/28')+8 from dual;// 문자열로 적은 날짜를 date타입으로 변경하는데 8일지난 값을 구한다
select to_date('24/03')+8 from dual;//날짜 형식에 맞지않아 변환 불가능
select to_number('100')from dual;//문자열 100을 숫자 100으로 변경
select to_number('100')+100 from dual;//문자열 100을 숫자 100으로 변경후 숫자 100을 더해서 출력
select to_number('abcd')+100 from dual;// 숫자형으로 바꿀수 없는 문자열이기때문에 에러발생

select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') as 현재날짜시간  from dual;//현재날짜를 데이터 형식 포맷을 이용해서 문자열로 출력
select to_char(to_date('0207', 'MM/YY'), 'MM/YY') from dual;//0207문자열을 MM/YY형식에 맞게 포맷,데이터타입으로 변환후 문자열로 변경, 다시 포맷후 출력



//null 처리함수, NVL, NVL2
/*NVL - null 값을 대체할 값
* NVL2 (null이 아닐때 값,  null 일때 값)
            처리 방식이 자바의 삼항연산자와 같다
*/
select comm, nvl(comm,0)from emp;// comm값중 null값들을 0으로 대체함
select sal, comm, sal+comm as 총급여 from emp;//값이 null이면 연산불가
select sal, comm, sal+nvl(comm,0) as 총급여 from emp;// null은 연산불가하기에 null값을 0으로 대체한뒤 연산하고 출력
select comm,nvl2(comm,'O','X') as 보너스여부 from emp;//null이라면 x, null이 아니라면 o
select sal as 월급, nvl(comm,0) as 보너스, nvl2(comm,sal*12+comm ,sal*12) as 연봉 from emp;//보너스 null이면 월급에서 x12 보너스 있으면 보너스+월급x12

//decode 조건함수 , 자바의 스위치문과 비슷
select job,nvl(decode(job,
    'MANAGER',sal*1.1,
    'SALESMAN',sal*1.2,
    'ANALYST',sal*1.3
),0)as upsal from emp;

select job, sal,decode(job,
    'MANAGER',sal*1.1,
    'SALESMAN',sal*1.2,
    'ANALYST', sal*1.3,
    sal*1.03
)as upsal from emp;

//CASE 조건함수  - 자바의 if-else if-else 와 비슷
select job,sal, case job 
when 'MANAGER' then sal*1.1
when 'SALESMAN' then sal*1.2
when 'ANALYST' then sal*1.3
else sal
end as upsal from emp;// 기준컬럼이 있는 경우에는 switch문에 더 비슷하다고 생각된다

//기준컬럼이 없이 비교가능
select job,sal, case 
when comm is null then '해당사항없음'
when comm = 0  then '보너스없음'
when comm >0  then '보너스 '||sal*1.1
end as upsal from emp;// 기준컬럼이 없는경우에는 if문에 가깝다고 생각됨.

//다중 행 함수 또는 집계함수 - sum , max, min,count,avg
select sum(sal) as 총_급여  from emp;// 사원테이블의 모든 급여의 합


select 
    sum(sal) as 총급여, 
    max(sal) as 최대월급자, 
    min(sal) as 최소월급자, 
    round(avg(sal)) as 급여평균,  
    count(*) as 직원수 
    from emp;
    
select count(comm) from emp;// 보너스를 받는사람이 4명이다/ null은 카운트안함

select
    sum(sal)as 급여합, 
    max(sal) as 최대값,
    min(sal)as 최소값,
    trunc(avg(sal))as 평균, 
    count(*) as 개수
    from emp 
    where deptno=10 ;// 평균의 소수점을 trunc 함수로 날림
    
//group by, having
//group by - 특정 컬럼을 그룹으로 구분한다
//having - 그룹에서 조건처리시 사용된다.
select deptno, count(*) from emp group by deptno;// 부서를 그룹으로 묶고 그룹 마다 총 행(값)을 카운트해서 출력

select 
    deptno as 부서번호, 
    sum(sal)as 부서별_총급여,
    count(*) as 사원수 
    from emp 
    group by deptno;

select 
    deptno      as 부서번호, 
    sum(sal)   as 부서별_총급여,
    max(sal)   as 부서별_최대월급자,
    min(sal)    as 부서별_최저월급자,
    trunc(avg(sal)) as 부서별_월급평균,
    count(*)    as 부서별_직원수 
    from emp 
    group by deptno
    order by deptno;
    
select deptno, trunc(avg(sal)) from emp group by deptno having avg(sal) >=2000;

//급여가 5000초과하는 직무, 단 salesman  제외 job,급여합 내림차순정렬
select 
    job as 직무,
    sum(sal) as 급여합
    from emp 
    where job!='SALESMAN'
    group by job 
    having sum(sal)>5000
    order by  sum(sal) desc ;

select ename, count(*) from emp ;// 단일행은 결과의행이 여러개이고 다중행은 결과의 행이 한개다

select lower(ename), count(*), max(sal)from emp ;// 단일행과 다중행은 같이 사용불가 -> 그룹으로 묶어야함

select deptno, job, count(*), max(sal), min(sal) from emp group by deptno,job order by deptno; 

// 그룹함수 rollup, cube
/*
    rollup - 데이터를 그룹화하고 각 그룹의 부모 그룹까지 포함한 집계 함수 결과 제공
    cube - group by절에 지정된 모든 컬럼의 모든 조합에 대한 정보를 제공한다
*/
select deptno, job , count(*), max(sal), min(sal) from emp group by rollup(deptno,job) order by deptno;
    //부서별 직무로 그룹화를하고 부서기준의 정보를 출력
    
select deptno , job, count(*), max(sal), min(sal) from emp group by cube(deptno,job) order by deptno;
//부서별직무로그룹화하고 부서기준 정보와 직무기준 정보를 모두 출력한다

// 그룹함수 listagg
select deptno, listagg(ename,',')
within group(order by sal desc) as enames 
from emp group by deptno;
//부서별로 그룹화 한뒤 listagg(ename,',') 콤마로 구분해서 ename 을 sal 이 높은 순으로 한 행에 리스트로 정렬


//join
select * from emp, dept where emp.deptno = dept.deptno;

select e.*,d.* from emp  e, dept d
    where e.deptno = d.deptno;

// emp * , dept - dname
select e.*,d.dname from emp e , dept d
    where e.deptno = d.deptno;
    
    
//외부조인  outer - 등가조인에서 값이 없는행 조회/(+)
select * from emp , dept
where emp.deptno(+) = dept.deptno;

// self join - 하나의 테이블을  두번사용하여 join함
select  a.ename , b.ename as manager from emp a, emp  b where a.empno= b.mgr; 

// 서브쿼리 - select 문안에 select 문 사용
//select (select )
select e.ename, e.sal, d.dname
from emp e, dept d
where e.deptno = d.deptno AND e.sal > (select avg(sal) from emp);

select * from emp
where sal > (select sal from emp where ename = 'JONES');


// <문제 풀이> //
//사원의 이름, 직무, 부서명, 부서위치를 출력
select e.ename, e.job, d.dname, d.loc 
from emp e , dept d
where e.deptno = d.deptno;

//이름이 'FORD'인 사원의 이름, 부서명을 출력
select e.ename , d.dname 
from emp e, dept d
where e.deptno = d.deptno AND e.ename = 'FORD';

// 급여가 3000이상인 사원의 사원번호, 이름, 급여, 부서이름, 부서위치 출력
select e.empno,e.ename,e.sal, d.dname, d.loc
from emp e, dept d 
where e.deptno = d.deptno AND e.sal >= 3000;

//10번 부서 사람과 20번 부서 사원이 같은직무
select job from emp
where deptno = 10 AND job in(
    select job
    from emp 
    where deptno = 20) ;
    
// 'MARTIN'이나 'SCOTT' 의 급여가 같은사원이 이름, 급여 출력(MARTIN'이나 'SCOTT' 의 급여가 같은사원 을 먼저 select 로뽑고 그다음에 select문으로 같은사원을 조회
select ename, sal
from emp
where sal in(select sal from emp where ename='MARTIN') or 
sal in(select sal from emp where ename = 'SCOTT');// 

// 10번부서 중에서 30번 부서에서 없는 업무를 하는 사원이 의름, 업무, 부서명 출력
select e.ename, e.job, d.dname
    from emp e , dept d
    where e.deptno = d.deptno
    AND e.deptno =10 
    AND job not in(
    select job 
    from emp 
    where deptno=30);


    
    
    
    
    
create table tb_test(
    test_sid            number(20)         generated always as IDENTITY,
    user_sid            number(20)         ,
    title                   varchar2(10)        not null,
    content             varchar2(20)        not null,
    createdDate    timestamp            not null           
);

alter table tb_test add constraint pk_test_sid primary key(test_sid);
alter table tb_test add constraint fk_user_sid foreign key(user_sid) references tb_user(user_sid);

insert into tb_test(user_sid, title, content, createdDate)values(user_sid,'제목','내용',systimestamp);
create table tb_user(
    user_sid                number(20)         generated always as IDENTITY,
    user_email           varchar2(30)               not null,
    password              varchar2(12)        not null,
    user_name           varchar2(10)          not null
);
alter table tb_user add constraint pk_user_sid primary key(user_sid);

insert into tb_user(user_email,password,user_name)values('sung@naver.com','1234','민형');
select * from tb_user;
select * from tb_test;
 
drop table tb_test;
    
