//함수
//<문자관련 함수>//
/*
    *upper - 모두 대문자로변경
    lower  - 모두 소문자로 변경
    initcap - 첫글자만 대문자
*/
 select  upper(ename), lower(ename), initcap(ename) from emp;
 select * from emp where upper(ename) = upper('scott');
 select * from emp where upper(ename) like upper('%s%');//대문자 S가포함되어있는 대문자ename 중에서 선택
 //%SC% - 두글자가 붙어있는것만 선택
 //%S%C% - 단어중 두글자가 들어가 있는것만 선택
 
 //length
 select ename, length(ename) from emp;// ename 컬럼과 값의 길이를 조회
 select ename, sal, deptno, length(ename) from emp where length(ename) = 4;// 이름길이가 4인 사원의 이름 급여 부서번호 조회
 
 //lengthb
 //*lengthb = 문자의 바이트 수 ( 한글은 한글자당 3바이트)
 //*함수만 실행시 테이블 이름이 불필요한 경우 dual(더미테이블)사용
 select length('한글'), lengthb('한글') from dual;// length = 글자수(2),lengthb=바이트수(6)

 //substr - 문자 추출
 select job, substr(job, 1,3) from emp;// 오라클은 인덱스 1부터 시작 마지막 인덱스 포함
          //substr(컬럼명, 시작index, 글자수)
select job, substr(job, 3, 2) from emp;// 인덱스3번부터 2글자 추출
select job, substr(job,3) from emp;// 인덱스 3번부터 끝까지 추출
select job, substr(job,-1) from emp; // 뒤에서부터 1글자 
select job, substr(job,-3) from emp;//뒤에서부터 3글자
select job, substr(job,-3,2) from emp;//뒤에서 3번째부터 2글자
select job, substr(job,1) from emp;//전체 방법 1
select job, substr(job,-length(job)) from emp;// 전체 방법2 
select substr('성민형성민형', 3,2) from dual;// 함수만 이용할경우 더미테이블사용해서 문자 추출

//instr - 문자 인덱스위치 찾기
//instr(컬럼명, '찾아볼문자', 시작인덱스, 찾고있는 중복된 문자의 번째)
select instr('hello oracle', 'l') from dual;// 중복되는 문자일경우 가장 첫번째 문자의 인덱스번호가 나온다.
select instr('hello oracle', 'l',5)from dual;// 5번인덱스부터 나오는 선택한 문자의 인덱스번호를 추출
select instr('hello oracle', 'l',1,2)from dual;// 인덱스 1번부터 선택한 중복된 문자의 2번째 문자추출

//replace - 문자 변경
//replace(컬럼명, 선택한 문자, 대체할문자)
select replace('010-1234-5678','-',' ')from dual;// 하이픈을 공백으로 대체
select job, replace(job,'M','-')from emp;// job 컬럼 값에 M을 -로 대체

//문자의 빈 공간 채우기 lpad(왼), rpad(오)
// l(r)pad(컬럼명, 전체공간설정, 빈공간채워줄문자)
select lpad('oracle',7)from dual;
select lpad('oracle',10,'*')from dual;// 전체공간 10 
select rpad('oracle',20,'ㅋ')from dual;// 한글은 한글자당 두공간차지
select rpad('890101-1',14,'*')from dual;// 주민번호 표현 느낌쓰(내정보 확인에서쓰면 좋을듯)

// concat - 두문자열 데이터 합치기
//concat(컬럼1, 컬럼2)- 선택한 컬럼 두개의값을 합칩
select concat(ename, job)from emp;// 사원이름+직책
select concat(empno,ename)from emp;//사원번호+사원이름
select empno||'-'||job from emp;// 사원번호 + - + 직책  

//trim, ltrim(왼),rtrim(오) - 특정 문자 지우기
//trim('문자'or컬럼)- 앞뒤 공백 컷
//l(r)trim('문자'or컬럼, '지정문자') - 선택한 문자 또는 컬럼의 값의 왼(오른)쪽 지정문자를 지운다
//l(r)trim('문자'or컬럼)- 지정문자가 없을 경우 선택한문자의 왼(오른)쪽의 공백만 삭제한다. 
select trim('        <oracle>         ')from dual;// 앞뒤 공백지움
select ltrim('<oracle>','<')from dual;      // 왼쪽에있는 < 지우기
select rtrim('<oracle>','>')from dual;      // 오른쪽에있는 > 지우기
select ltrim('    <oracle>     ')from dual; // 왼쪽의 공백 삭제
select rtrim('    <oracle>     ')from dual; // 오른쪽의 공백 삭제


//<숫자관련함수>//

//반올림(round) 올림(ceil)
//round(소수, 반올림할 자리수)
select round(1234.5678)from dual;
select round(1234.5678,0)from dual;
select round(1234.5678,1)from dual; // 소수점 뒤 첫번째자리에서 반올림
select round(1234.5678,2)from dual; // 소수점 뒤 두번째자리에서 반올림
select round(1234.5678,-1)from dual;//소수점 앞 첫번째자리에서 반올림
select round(1234.5678,-2)from dual;//소수점 앞 두번째자리에서 반올림

//ceil()
select ceil(1234.5678)from dual;// 1235 올림
select ceil(-1234.5678)from dual;

//trunc 버림, floor 버림
//trunc(소수, 소수점뒤 자리수)- 선택한 소수의 설정한 소수점 아래 자리부터 버림
select trunc(1234.5678)from dual;   // 소수점 아래 버림
select trunc(1234.5678,1)from dual; // 소수점 아래 첫번째 자리 이후버림
select trunc(1234.5678,2)from dual; // 소수점 아래 두번째 자리 이후버림
select trunc(1234.5678,3)from dual; // 소수점 아래 세번째 자리 이후버림
select sal, trunc(sal/12)from emp;  // 나누고 나온 소수점을 버려버림(= 정수로변환)
select trunc(3.14)from dual;        //소수점 이하버리고 정수로 변환


//floor - 가장 가까운 정수로 변환
select floor(3.14) from dual;
select floor(-3.14) from dual;
//mod 나머지 
//mod(나눠지는수, 나누는수)
select mod(15,6)from dual;// 나머지 3
select mod(15,5)from dual;//나머지 없음


//<날짜 관련 함수>//

//sysdate - 날짜 관련 함수
//sysdate
select sysdate from dual;
select sysdate, sysdate-1, sysdate+8 from dual;

//add_months(지정날,추가할 월(달))- 월(달)을 추가함
select add_months(sysdate,3)from dual;
select ename, hiredate, add_months(hiredate,516) as 정년 from emp;// 입사일로부터 516달지난 정년이라는 컬럼을 출력

select empno||'-'||ename as 사원정보 ,
hiredate as 입사일, 
add_months(hiredate,120) as 승진,
add_months(hiredate,516) as 정년  from emp;

// months_between - 두 날짜의 개월 수 차이를 구할때 사용
select months_between(sysdate,hiredate)from emp;// 날짜 차이가 소수점으로 나옴

select months_between(sysdate,hiredate),
round(months_between(sysdate,hiredate)) as month from emp;// 반올림 한것 안한것

select round(months_between(sysdate,hiredate))from emp;// 반올림

select round(months_between(sysdate,hiredate)) as roundf,
trunc(months_between(sysdate,hiredate)) as truncf from emp;// 소수점 아래 버린것과 반올림 비교











 