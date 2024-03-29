//�ڷ����� ��ȯ - to_char, to_date,to_number
//* to_char - ���ڷ� ����
//* to_date - ��¥�� ����
//* to_number - ���ڷ� ����
select to_char(sysdate) from dual;// ���� ��¥�� ���������� ����
select to_date('24/03/28')+8 from dual;// ���ڿ��� ���� ��¥�� dateŸ������ �����ϴµ� 8������ ���� ���Ѵ�
select to_date('24/03')+8 from dual;//��¥ ���Ŀ� �����ʾ� ��ȯ �Ұ���
select to_number('100')from dual;//���ڿ� 100�� ���� 100���� ����
select to_number('100')+100 from dual;//���ڿ� 100�� ���� 100���� ������ ���� 100�� ���ؼ� ���
select to_number('abcd')+100 from dual;// ���������� �ٲܼ� ���� ���ڿ��̱⶧���� �����߻�

select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') as ���糯¥�ð�  from dual;//���糯¥�� ������ ���� ������ �̿��ؼ� ���ڿ��� ���
select to_char(to_date('0207', 'MM/YY'), 'MM/YY') from dual;//0207���ڿ��� MM/YY���Ŀ� �°� ����,������Ÿ������ ��ȯ�� ���ڿ��� ����, �ٽ� ������ ���



//null ó���Լ�, NVL, NVL2
/*NVL - null ���� ��ü�� ��
* NVL2 (null�� �ƴҶ� ��,  null �϶� ��)
            ó�� ����� �ڹ��� ���׿����ڿ� ����
*/
select comm, nvl(comm,0)from emp;// comm���� null������ 0���� ��ü��
select sal, comm, sal+comm as �ѱ޿� from emp;//���� null�̸� ����Ұ�
select sal, comm, sal+nvl(comm,0) as �ѱ޿� from emp;// null�� ����Ұ��ϱ⿡ null���� 0���� ��ü�ѵ� �����ϰ� ���
select comm,nvl2(comm,'O','X') as ���ʽ����� from emp;//null�̶�� x, null�� �ƴ϶�� o
select sal as ����, nvl(comm,0) as ���ʽ�, nvl2(comm,sal*12+comm ,sal*12) as ���� from emp;//���ʽ� null�̸� ���޿��� x12 ���ʽ� ������ ���ʽ�+����x12

//decode �����Լ� , �ڹ��� ����ġ���� ���
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

//CASE �����Լ�  - �ڹ��� if-else if-else �� ���
select job,sal, case job 
when 'MANAGER' then sal*1.1
when 'SALESMAN' then sal*1.2
when 'ANALYST' then sal*1.3
else sal
end as upsal from emp;// �����÷��� �ִ� ��쿡�� switch���� �� ����ϴٰ� �����ȴ�

//�����÷��� ���� �񱳰���
select job,sal, case 
when comm is null then '�ش���׾���'
when comm = 0  then '���ʽ�����'
when comm >0  then '���ʽ� '||sal*1.1
end as upsal from emp;// �����÷��� ���°�쿡�� if���� �����ٰ� ������.

//���� �� �Լ� �Ǵ� �����Լ� - sum , max, min,count,avg
select sum(sal) as ��_�޿�  from emp;// ������̺��� ��� �޿��� ��


select 
    sum(sal) as �ѱ޿�, 
    max(sal) as �ִ������, 
    min(sal) as �ּҿ�����, 
    round(avg(sal)) as �޿����,  
    count(*) as ������ 
    from emp;
    
select count(comm) from emp;// ���ʽ��� �޴»���� 4���̴�/ null�� ī��Ʈ����

select
    sum(sal)as �޿���, 
    max(sal) as �ִ밪,
    min(sal)as �ּҰ�,
    trunc(avg(sal))as ���, 
    count(*) as ����
    from emp 
    where deptno=10 ;// ����� �Ҽ����� trunc �Լ��� ����
    
//group by, having
//group by - Ư�� �÷��� �׷����� �����Ѵ�
//having - �׷쿡�� ����ó���� ���ȴ�.
select deptno, count(*) from emp group by deptno;// �μ��� �׷����� ���� �׷� ���� �� ��(��)�� ī��Ʈ�ؼ� ���

select 
    deptno as �μ���ȣ, 
    sum(sal)as �μ���_�ѱ޿�,
    count(*) as ����� 
    from emp 
    group by deptno;

select 
    deptno      as �μ���ȣ, 
    sum(sal)   as �μ���_�ѱ޿�,
    max(sal)   as �μ���_�ִ������,
    min(sal)    as �μ���_����������,
    trunc(avg(sal)) as �μ���_�������,
    count(*)    as �μ���_������ 
    from emp 
    group by deptno
    order by deptno;
    
select deptno, trunc(avg(sal)) from emp group by deptno having avg(sal) >=2000;

//�޿��� 5000�ʰ��ϴ� ����, �� salesman  ���� job,�޿��� ������������
select 
    job as ����,
    sum(sal) as �޿���
    from emp 
    where job!='SALESMAN'
    group by job 
    having sum(sal)>5000
    order by  sum(sal) desc ;

select ename, count(*) from emp ;// �������� ��������� �������̰� �������� ����� ���� �Ѱ���

select lower(ename), count(*), max(sal)from emp ;// ������� �������� ���� ���Ұ� -> �׷����� �������

select deptno, job, count(*), max(sal), min(sal) from emp group by deptno,job order by deptno; 

// �׷��Լ� rollup, cube
/*
    rollup - �����͸� �׷�ȭ�ϰ� �� �׷��� �θ� �׷���� ������ ���� �Լ� ��� ����
    cube - group by���� ������ ��� �÷��� ��� ���տ� ���� ������ �����Ѵ�
*/
select deptno, job , count(*), max(sal), min(sal) from emp group by rollup(deptno,job) order by deptno;
    //�μ��� ������ �׷�ȭ���ϰ� �μ������� ������ ���
    
select deptno , job, count(*), max(sal), min(sal) from emp group by cube(deptno,job) order by deptno;
//�μ��������α׷�ȭ�ϰ� �μ����� ������ �������� ������ ��� ����Ѵ�

// �׷��Լ� listagg
select deptno, listagg(ename,',')
within group(order by sal desc) as enames 
from emp group by deptno;
//�μ����� �׷�ȭ �ѵ� listagg(ename,',') �޸��� �����ؼ� ename �� sal �� ���� ������ �� �࿡ ����Ʈ�� ����


//join
select * from emp, dept where emp.deptno = dept.deptno;

select e.*,d.* from emp  e, dept d
    where e.deptno = d.deptno;

// emp * , dept - dname
select e.*,d.dname from emp e , dept d
    where e.deptno = d.deptno;
    
    
//�ܺ�����  outer - ����ο��� ���� ������ ��ȸ/(+)
select * from emp , dept
where emp.deptno(+) = dept.deptno;

// self join - �ϳ��� ���̺���  �ι�����Ͽ� join��
select  a.ename , b.ename as manager from emp a, emp  b where a.empno= b.mgr; 

// �������� - select ���ȿ� select �� ���
//select (select )
select e.ename, e.sal, d.dname
from emp e, dept d
where e.deptno = d.deptno AND e.sal > (select avg(sal) from emp);

select * from emp
where sal > (select sal from emp where ename = 'JONES');


// <���� Ǯ��> //
//����� �̸�, ����, �μ���, �μ���ġ�� ���
select e.ename, e.job, d.dname, d.loc 
from emp e , dept d
where e.deptno = d.deptno;

//�̸��� 'FORD'�� ����� �̸�, �μ����� ���
select e.ename , d.dname 
from emp e, dept d
where e.deptno = d.deptno AND e.ename = 'FORD';

// �޿��� 3000�̻��� ����� �����ȣ, �̸�, �޿�, �μ��̸�, �μ���ġ ���
select e.empno,e.ename,e.sal, d.dname, d.loc
from emp e, dept d 
where e.deptno = d.deptno AND e.sal >= 3000;

//10�� �μ� ����� 20�� �μ� ����� ��������
select job from emp
where deptno = 10 AND job in(
    select job
    from emp 
    where deptno = 20) ;
    
// 'MARTIN'�̳� 'SCOTT' �� �޿��� ��������� �̸�, �޿� ���(MARTIN'�̳� 'SCOTT' �� �޿��� ������� �� ���� select �λ̰� �״����� select������ ��������� ��ȸ
select ename, sal
from emp
where sal in(select sal from emp where ename='MARTIN') or 
sal in(select sal from emp where ename = 'SCOTT');// 

// 10���μ� �߿��� 30�� �μ����� ���� ������ �ϴ� ����� �Ǹ�, ����, �μ��� ���
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

insert into tb_test(user_sid, title, content, createdDate)values(user_sid,'����','����',systimestamp);
create table tb_user(
    user_sid                number(20)         generated always as IDENTITY,
    user_email           varchar2(30)               not null,
    password              varchar2(12)        not null,
    user_name           varchar2(10)          not null
);
alter table tb_user add constraint pk_user_sid primary key(user_sid);

insert into tb_user(user_email,password,user_name)values('sung@naver.com','1234','����');
select * from tb_user;
select * from tb_test;
 
drop table tb_test;
    
