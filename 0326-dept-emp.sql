
// ���̺� �÷� ��ȸ /�˻�(select)
// select �÷��� from ���̺��;
// select * from ���̺��; - �ش� ���̺� ��ü ��ȸ
select * from dept;
select * from emp;
select empno from emp;
select empno,ename,sal from emp;

//�ߺ����� �� �˻� - DISTINCT
//select DISTINCT �÷��� FROM ���̺��
select distinct deptno from dept;
select distinct job from emp;
select distinct deptno, job from emp;

// ��Ī �ٿ� �˻�
// select �÷��� as ��Ī from ���̺��;
//          * as ��������
select job as j from emp;
select empno ep, ename em from emp;
select empno,sal, sal+500 as b from emp;

// ����(desc ��������, asc ��������)
//select �÷��� from ���̺�� order by �÷���;
select * from emp order by sal ;
select * from emp order by deptno, sal desc, hiredate;

/*where ���ǹ�
    select �÷��� from ���̺� ��  where ���ǽ�;
    ���
    select �÷��� from ���̺�� where �÷��� = ��;
*/
select * from emp where deptno = 10;
select * from emp where job ='salesman';// �ҹ��ڶ� ���� ������ ����
select * from emp where job ='SALESMAN';// �÷����� ���� ��ҹ��ڸ� �����Ѵ�.

// �� ������ >,<,>=,<=
//select �÷��� from ���̺�� where �÷���  > ��;
select * from emp where sal >= 3000;
select * from emp where ename > 'C';// ���ڷ� ���Ҷ� > �� �ʰ����ƴ� �̻��̴�
select ename, hiredate from emp where hiredate > '1985/01/01';//��¥ > �� �ʰ���

/*AND ������
    select �÷��� from ���̺�� where �÷��� > �� AND �÷��� = ��;
*/
select * from emp where sal >= 1500 AND deptno = 30;
select * from emp where sal >=1500 AND deptno = 30 AND job = 'MANAGER';

//or ������
// select �÷��� from ���̺�� where �÷��� > �� or �÷��� = ��;
select * from emp where deptno = 10 or deptno=20;
select ename, job from emp where job='MANAGER' or job= 'CLERK';

//not ������
//select �÷��� from ���̺�� where not �÷��� >��;
select *from emp where not sal = 3000;
select *from emp where sal != 3000;

//in ����
//select �÷��� from ���̺�� where �÷��� in(��, ��, ��);
select * from emp where deptno in(10,20,50);
select * from emp where deptno = 10 or deptno=20 or deptno=50;
select * from emp where job in('MANAGER','SALESMAN');

// NOT IN ������
// select �÷��� from ���̺�� where �÷��� not in(��, ��, ��,....);
select * from emp where deptno not in(10,30,50);

// BETWEEN ~ AND ������
// select �÷��� from ���̺�� where �÷���  between �� and ��;
select * from emp where sal between 1500 and 3000;
select * from emp where sal >= 1500 and sal <=3000;

//NOT BETWEEN ~ AND����
// select �÷��� from ���̺�� where �÷��� not between �� and ��;
select * from emp where sal not between 1500 and 3000;

//is null,is not null ����
//select �÷��� from ���̺�� where �÷��� is null;
select * from emp where comm is null;
select * from emp where comm is not null;

//LIKE ������  
//select �÷��� from ���̺�� where �÷��� like '%%';
//*'A%' - A�� �����ϴ� ����
//*'%A' - A�� ������ ����
//*'%A%' - ������ A�� ���Ե� ���� 
//*'_A%' - �ι�° ���ڰ� A�� ����
//&'__A%'- ����° ���ڰ� A�� ����

select ename from emp where ename like 'S%';    // s�ν���
select ename from emp where ename like '%T';    // t�� ����
select ename from emp where ename like '%S%';   // �̸��� S����
select ename from emp where ename like '_A%';   // �̸��� �ι�° ���ڰ� A�� ���

//UNION ������ ������
//* ���ϴ� ����� �÷����� Ÿ���� ���ƾ��Ѵ�
//select �÷��� from ���̺�� union select �÷��� from ���̺��;
select * from emp where deptno=10 union select * from emp where deptno=20;

//�ٸ����(�÷���)
select * from emp where deptno=10; 
//union 
select * from dept where deptno=20;

//�ٸ���� (������ Ÿ��)
select job from emp where deptno = 10;// varchar2
//union 
select deptno from dept where deptno=20;//number





create table dept( 
  deptno     number(2,0),   // �μ���ȣ
  dname      varchar2(14),  // �μ��̸�
  loc        varchar2(13),  // �μ���ġ
  constraint pk_dept primary key (deptno) 
);

/*
    Create the EMP table which has a foreign key reference to the DEPT table.
    The foreign key will require that the DEPTNO in the EMP table exist in the DEPTNO column in the DEPT table.
*/
create table emp( //���
  empno    number(4,0),     // �����ȣ
  ename    varchar2(10),    // ����̸�
  job      varchar2(9),     // ����
  mgr      number(4,0),     // ���
  hiredate date,            // �Ի� ����
  sal      number(7,2),     // �޿�
  comm     number(7,2),     // ����
  deptno   number(2,0),     // �μ���ȣ
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