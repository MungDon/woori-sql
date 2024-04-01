/*
    ROWNUM
        - rownum�� ���� ������� �� ���� ������ ��Ÿ���� ������ �÷��̴�.
*/
select empno, ename, sal from emp; -- �⺻ (rownum ���� ����X)
select empno, ename, sal, rownum from emp; --rownum ���� ����
select empno, ename, sal, rownum from emp order by sal;-- rownum ������ ���� ����ǰ� sal�� ������ �����
select e.*, rownum from (select empno,ename,sal from emp order by sal)  e; 

// sal�������� ������ rownum ���� �״����� rownum 1~5���� ���
select e.*, rownum  from(select empno,ename,sal from emp order by sal) e  where rownum between 1 and 5;-- ���1
select * from(select e.*, rownum as r  from(select empno,ename,sal from emp order by sal) e )  where r between 1 and 5;-- ���2

/*
    ������ ( 1�� �ڵ� ���� ��ȣ ��ɾ�)
        - �������� �ڵ����� �����ϴ� �Ϸù�ȣ�� �����ϴ� ��ü
        - ���̺��� Ư���÷��� ������ ���� �����ϱ����� ���
        - �̸��� ������� ��� ������ 
            ���̺��_seq��� ���߰����ϰ� �����ش�.
        
        �⺻��
            create sequence �������� �ɼ� ;
        
        �������ɼ�
/*
commit;
create sequence test_seq ;
drop table test;
insert  into test values(test_seq.nextval,'test01');
select * from test;

create table test_1(
    num numner primary key,
    name varchar2(100)
);
create sequence test_1_seq ;
insert into test_1 values(test_1_seq.nextval, 'test01');
insert into test_1 values(test_1_seq.nextval, 'test02');
insert into test_1 values(test_1_seq.nextval, 'test03');
select * from test_1;
commit;