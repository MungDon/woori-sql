/*
    DB�� ������ ���̺� Ȯ��
    ������ ������ ��� ���̺� Ȯ��
    select table_name from user_tables;
*/
select table_name from user_tables;
/*
    DB�� ��� ���� ���̺� Ȯ��
    select owner, table_name from all_tables;
*/
select owner, table_name from all_tables;
/*
    DB�� ��� ���� ���̺��� ������ Ȯ��
    select * from dba_tables;
*/
select * from dba_tables;
/*
    DB�� ��� ���� Ȯ��
    select * from dba_users;
*/
select * from dba_users;

/*
    DB�� 'SCOTT' ���� Ȯ��
    select * from dba_users where username = 'SCOTT';
    * group by �� ���ǹ��� having*
*/
select * from dba_users where username = 'SCOTT';
/*
    �ε���
        - ����Ŭ �ε����� ���̺��� Ư�� �÷�(��)�� ���� �˻� �ӵ��� ����Ű�� ������ �����̴�.
        - å�� ������ ����ϰ� 
            �ε����� �����ͺ��̽� �˻������� Ư�� ���� ���� ��(���ڵ�)�� ������ ã�� �� �ֵ��� ���´�.
        - ���̺� �ε����� ���� ���ѳ����� where , join  , order by , group by  ����
            �ε����� ����� �÷��� ����Ѵٸ� 
            �˻��ӵ��� ���ȴ�.
        
        ���� ������ ��� �ε����� ���� ������ ��ȸ
        select * form user_indexes;
*/
select * from user_indexes;
/*
    ���� ������ ��� �ε����� ���� �÷� ���� ��ȸ
    select * from user_ind_columns;
*/
select * from user_ind_columns;
/*
    IND_EMP_SAL �ε������� EMP ���̺� SAL�÷��� �ε����߰�
    create index ind_emp_sal on emp(sal);
*/
create index ind_emp_sal on emp(sal);
commit;
/*
    �ε�������
    drop index ind_emp_sal;
*/
drop index ind_emp_sal;
/*
    ��
        - ����Ŭ ��� ���� ���̺� ��������ʴ� ������ ���̺��̴�.
        - ���� ���̺�ó�� ���� �� ������ ������ �߰�, ����, ���� ���� ������ ��κ���  SQL �۾��� ���� �� ���ִ�
        - select �� ���� �˻��ϴ� ���̺��� �ʿ��� �÷� �� �������� �˻��� ���� ��� ����� ����Ѵ�.
        
       * ���� *   
        ������ ���� - ���� ���̺��� �����͸� �ϳ��� ��� ������ �� �ִ�.
        ������ �߻�ȭ     :   ������ �������� �����ϰ� ǥ�� �� �� �ִ� 
        ������ ����  :   �ΰ��� �����͸� ���� �� �ִ�.
        ������ ��������    :   ����ڿ��� Ư�� �����͸� ���� �� �� �ִ�.
        
       * ���� *

    vw_emp20 �̸����� �� ����       
    create view vw_emp20 as(select empno, ename, job,deptno from emp where deptno = 20);
*/
create view vw_emp20 as(select empno, ename, job,deptno from emp where deptno = 20);
commit;
/*
    ������ ��� �並 Ȯ��
    select * from user_views;
*/
select * from user_views;
/*
    ���� Ư�� ������ Ȯ��
    select view_name,text_length, text from user_views;
*/
select view_name,text_length, text from user_views;
/*
    �� �˻� - ���̺� �˻��� ����
    select * from vw_emp20;
*/
select * from vw_emp20;
/*
    �� ����
    drop view vw_emp20;
*/
drop view vw_emp20;
commit;

