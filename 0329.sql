//<����Ǯ��>//
//<<1>>  �μ���ȣ�� 10���� �μ��� ����� �����ȣ, �̸�, �޿��� ����϶�.
select empno, ename, sal from emp where deptno = 10;

//<<2>>  �����ȣ�� 7839�� ����� �̸�, �Ի�����, �μ���ȣ�� ����϶�.
select ename, hiredate, deptno from emp where empno = 7839;

//<<3>>  �̸��� ALLEN�� ����� ��� ������ ����϶�.
select * from emp ,dept where emp.deptno = dept.deptno AND emp.ename='ALLEN';

//<<4>>  �Ի����ڰ� 82/01/23�� ����� �̸�, �μ���ȣ, �޿��� ����϶�.
select ename, deptno,sal from emp where hiredate='82/01/23';

//<<5>>  ������ MANAGER�� �ƴ� ����� ��� ������ ����϶�.
select * from emp,dept where emp.deptno = dept.deptno AND emp.job !='MANAGER';

//<<6>>  �Ի����ڰ� 81/04/02 ���Ŀ� �Ի��� ����� ������ ����϶�.
select * from emp,dept where emp.deptno = dept.deptno AND emp.hiredate >='81/04/02';

//<<7>>  �޿��� 800�̻��� ����� �̸�, �޿�, �μ���ȣ�� ����϶�.
select ename,sal,deptno from emp where sal >=800;

//<<8>>  �μ���ȣ�� 20�� �̻��� ����� ��� ������ ����϶�.
select * from emp e, dept d where e.deptno = d.deptno AND e.deptno >=20;

//<<9>>  ������ K�� �����ϴ� ������� ���� �̸��� ���� ����� ��� ������ ����϶�.
select * from emp e, dept d where e.deptno= d.deptno AND e.ename >='L%';

//<<10>>  �Ի����ڰ� 81/12/09 ���� ���� �Ի��� ������� ��� ������ ����϶�.
select * from emp e, dept d where e.deptno = d.deptno AND e.hiredate < '81/12/09';

//<<11>>  �Ի��ȣ�� 7698 ���� �۰ų� ���� ������� �Ի��ȣ�� �̸��� ����϶�.
select empno, ename	from emp where empno <=7698;

//<<12>>  �Ի����ڰ� 81/04/02 ���� �ʰ� 82/12/09 ���� ���� ����� �̸�, �޿�, �μ���ȣ�� ����϶�.
select ename, sal, deptno from emp where hiredate >'81/04/02' AND hiredate <'82/12/09';	

//<<13>>  �޿��� 1,600 ���� ũ�� 3,000 ���� ���� ����� �̸�, ����, �޿��� ����϶�.
select ename, job,sal from emp where sal >1600 AND sal <3000;	

//<<14>>  �����ȣ�� 7654�� 7782 ���� �̿��� ����� ��� ������ ����϶�.
select * from emp e, dept d where e.deptno = d.deptno  AND e.empno not between 7654 AND 7782;

//<<15>> �̸��� B�� J ������ ��� ����� ������ ����϶�.
select * from emp e, dept d where e.deptno = d.deptno AND e.ename between 'B%' AND 'J%';

//<<16>>  �Ի����ڰ� 81�� �̿ܿ� �Ի��� ����� ��� ������ ����϶�.
select * from emp e, dept d where e.deptno = d.deptno AND e.hiredate not like '81%';

//<<17>>  ������ MANAGER�� SALESMAN�� ����� ��� ������ ����϶�.
select * from emp e , dept d where e.deptno = d.deptno AND e.job in('MANAGER','SALESMAN');

//<<18>>  �μ���ȣ�� 20,30���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ����϶�.
select ename, empno, deptno from emp where deptno	not in(20,30);

//<<19>>  �̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �Ի�����, �μ���ȣ�� ����϶�.
select empno, ename, hiredate,deptno from emp where ename like'S%';

//<<20>>  �Ի����ڰ� 81�⵵�� ����� ��������� ����϶�.
select * from emp e ,dept d where e.deptno = d.deptno AND e.hiredate like'81%';	

//<<21>>  �̸� �� S�ڰ� ���ִ� ����� ��������� ����϶�.
select * from emp e , dept d where e.deptno = d.deptno AND e.ename like'%S%';

//<<22>>  �̸��� S�� �����ϰ� ������ ���ڰ� T�� ����� ��� ������ ����϶� (��, �̸��� ��ü 5�ڸ��̴�.)
select * from emp e ,dept d where e.deptno = d.deptno AND e.ename like'S___T' ;

//<<23>>  ù��° ���ڴ� ���� ���� �ι�° ���ڰ� A�� ����� ������ ����϶�.
select * from emp e, dept d where e.deptno = d.deptno AND e.ename like'_A%';	

//<<24>>  Ŀ�̼��� NULL�� ����� ������ ����϶�.
select * from emp e,dept d where e.deptno = d.deptno AND e.comm is null;

//<<25>>  Ŀ�̼��� NULL�̾ƴѻ���Ǹ������������϶�.
select * from emp e , dept d where e.deptno = d.deptno AND e.comm is not null;

//<<26>>  �μ��� 30���μ��̰�޿��� 1,500 �̻��� ����� �̸�, �μ�, ������ ����϶�.
select ename,deptno , sal from emp where deptno=30 AND sal >=1500;

//<<27>>  �̸��� ù���ڰ� K�� �����ϰų� �μ���ȣ�� 30�� ����� �����ȣ, �̸�, �μ���ȣ�� ����϶�.
select empno, ename, deptno from emp where ename like('K%') or deptno = 30;

//<<28>>  �޿��� 1,500 �̻��̰� �μ���ȣ�� 30���� ����� ������ MANAGER�� ����� ������ ����϶�.
select * from emp e, dept d where e.deptno = d.deptno AND e.sal >=1500 AND e.deptno = 30 AND job in('MANAGER');

--<<29>>  �μ���ȣ�� 30�� ����� �����ȣ�� SORT �϶�.
select * from emp where deptno=30 order by empno;

--<<30>>  �޿��� ���������� SORT�϶�.
select * from emp order by sal desc;

--<<31>>  �μ���ȣ�� ASCENDING SORT�� �� �޿��� ���� ��������� ����϶�.
select * from emp order by deptno asc, sal desc;

--<<32>>  �μ���ȣ�� DESCENDING SORT�ϰ� �̸������� ASCENDING SORT, �޿������� DESCENDING SORT�϶�.
select * from emp order by deptno desc,ename asc,sal desc;

--------------------------JOIN--------------------------
--<<1>> EMP�� DEPT TABLE�� JOIN�Ͽ� �μ���ȣ, �μ���, �̸�, �޿��� ����϶�.
select e.deptno, d.dname,e.ename,e.sal from emp e , dept d where e.deptno = d.deptno ;

--<<2>> �̸��� 'ALLEN'�� ����� �μ����� ����϶�.
select d.dname from emp e , dept d where e.deptno = d.deptno AND e.ename in('ALLEN');

--<<3>> EMP TABLE�� �����͸� ����ϵ� �ش����� ���� �����ȣ�� ����� �̸��� �Բ� ����϶�.
select  a.ename as junier , a.mgr as mgrno, b.ename as manager 
from emp a, emp  b 
where a.mgr= b.empno;


--<<4>> DEPT TABLE���� �����ϴ� �μ��ڵ� ������ �ش�μ��� �ٹ��ϴ� ����� �������� �ʴ� ����� ����� ����϶�.
select * from dept
where deptno 
not in
(select deptno from emp group by deptno  having count(*)>0);  
                 
--<<5>> 'ALLEN'�� ������ ���� ����� �̸�, �μ���, �޿�, ������ ����϶�.
select e.ename , d.dname, e.sal, e.job 
    from emp e , dept d 
    where e.deptno = d.deptno   
    AND e.job in(
        select job 
        from emp 
        where ename ='ALLEN');

--<<6>> 'JONES'�� ���� �ִ� �μ��� ��� ����� �����ȣ, �̸�, �Ի�����, �޿��� ����϶�.
select deptno, ename,hiredate, sal 
    from emp 
    where deptno in(
        select deptno 
        from emp 
        where ename='JONES');       
 
--<<7>> ��ü ����� ��� �ӱ� ���� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ��ġ, �޿��� ����϶�.
select e.empno, e.ename,d.dname,e.hiredate,d.loc,e.sal 
    from emp e, dept d 
    where e.deptno = d.deptno 
    AND e.sal  > (
        select trunc(avg(sal)) 
        from emp ); 


--<<8>> 10�� �μ� ����� �߿��� 20�� �μ��� ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���, �Ի���, ������ ����϶�.
select e.empno, e.ename, d.dname,e.hiredate,d.loc 
    from emp e , dept d 
    where e.deptno = d.deptno 
    AND e.deptno=10 
    AND e.job in(
        select job 
        from emp 
        where deptno = 20);

--<<9>> 10�� �μ� �߿��� 30�� �μ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���, �Ի�����, ������ ����϶�.
select e.empno, e.ename , d.dname ,e.hiredate,d.loc 
    from emp e , dept d 
    where e.deptno = d.deptno 
    AND e.deptno = 10
    AND e.job not in(
        select job 
        from emp 
        where deptno = 30);

--<<10>> 10�� �μ��� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���, ����, �޿��� �޿��� ���� ������ ����϶�.
select e.empno, e.ename,d.dname,d.loc,e.sal from emp e, dept d where e.deptno = d.deptno AND e.deptno =10 order by sal desc;

--<<11>> 'MARTIN'�̳� 'SCOTT'�� �޿��� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select empno, ename,sal 
    from emp 
    where sal in(
        select sal 
        from emp 
        where ename in('MARTIN','SCOTT'));


--<<12>> �޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select empno,ename,sal 
    from emp 
    where sal >(select max(sal) from emp where deptno=30);

--<<13>> �޿��� 30�� �μ��� �����޿� ���� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select empno,ename,sal 
    from emp 
    where sal  > (select min(sal) from emp where deptno=30);
    
    // * CRUD*
    /*
        create, read(select),update,delete
        ������ - �ɼ� ���� ,����� �˰��ְ� ��ó�
        
        SQL ���
        - ���ڴ� ������ "(Ȭ����ǥ)
        -,(��ǥ) �������� ��� ����
        - commit;
        
        * ���� - create
            create table ���̺��(
                    �÷��̸�        Ÿ��          �ɼ�,
                    �÷��̸�        Ÿ��          �ɼ�,
                    �÷��̸�        Ÿ��          �ɼ�
            );
             - Ÿ��
                        ���� �ƴ� �ʼ�
                        varchar2(��������)   - ����
                        number                      - ����/ ���� �Ǽ� �������
                        date                            - ��¥ 
            - �ɼ�
                        �ʼ� �ƴ� ����
                        primary key     :   ������(Ű), �÷������� �ߺ� �Ұ�
                                                        �ϳ��� �÷��� ����
                        not null             :  null�� �Ұ���
                        default              :  �Է��� �����ʾ����� ���� �⺻��
                        unique              :   �� �ߺ� �Ұ�
                        check                :   ���ǹ�, �˻� ���� ���
                                                    check �÷���  > 0 and �÷��� <100
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
    insert ������ �߰�
        insert into ���̺�� values(��,��,��,);
        : ���̺��� ��� �÷��� ���� �ִ´�
         �÷��� ���� , Ÿ�Կ� �°�  ���� �־���Ѵ�
*/
insert into member 

values('java','1234','00/08/09',25,'oracle',sysdate);

select * from member;
insert into member values('spring','1111','00/11/11',25,'postgreSQL',sysdate);

// name = null
insert into member values('test','2222','11/11/11',26,Null,sysdate);

//�÷��� �����ؼ� ������
// insert into ���̺��(�÷���, �÷���,�÷���)values(��,��,��);

insert into member(id,pw) values('min','11'); 

insert into member(id,pw,name)values('jsp','2222','aaaa');
--insert into member(id,pw,birth)values('css');
--�÷� �ɼ�
    --pw�� not null �̶� �ʼ��� �߰��ؾ���
    --primary key �� ����
insert into member(id,pw,birth)values('css','1234','12/12/12');

-- update - ����
-- update ���̺�� set �÷��� = ��;
-- update ���̺�� set �÷��� = ��, �÷��� = ��;
update member set pw='5555';

update member set pw ='1234', name='guest',age=20;

--update ���̺�� set �÷��� = �� where ���ǽ�;
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
    delete ����
        delete from ���̺��;
*/
delete from member;
-- where ���ǽ��� ������ select ������ ������ ����.
-- delete from ���̺�� where ���ǽ�;
delete from member where id='test'; 

-- ���̺� ���� drop table ���̺��;
drop table member;