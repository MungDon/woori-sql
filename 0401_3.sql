/*
    ROWNUM
        - rownum�� ���� ������� �� ���� ������ ��Ÿ���� ������ �÷��̴�.
*/

select empno, ename, sal from emp; 
select empno, ename, sal, rownum from emp; --rownum ���� ����
select empno, ename, sal, rownum from emp order by sal;-- rownum ������ ���� ����ǰ� sal�� ������ �����
select e.*, rownum from (select empno,ename,sal from emp order by sal)  e; 

--sal�������� ������ rownum ���� �״����� rownum 1~5���� ���
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
          - start with                :    ���۰�( �⺻�� 1)
          - increment by       :   ������(�⺻�� 1)
          - maxvalue               :    �ִ�������(~����)
          - nomaxvalue           :    �⺻�� (�ִ밪 ����)
          - minvalue                :  �⺻�� 1  
                                                �ּҰ� / �ִ밪 ���� �� 
                                                �ִ� ������ �����ϸ� �ٽ� �ּҰ����� ���۵ȴ�
         - cycle                        :   �⺻�� nocycle
         - nocycle                    :     �ݺ� �������.
         - cache                        :   �⺻�� 20 - �̸� ����������
                                                                     ��� �Ҷ����� ����,
                                                                     ������ ���� ���� ���ȴ�.
        - nocache                    :  �⺻�� cache 20�� �����Ѵٴ� ��
*/
create sequence test1_seq start with 10 increment by 2 maxvalue 100 minvalue 1 cycle nocache;--����
commit;
create sequence test_seq ;
drop table test;
insert  into test values(test_seq.nextval,'test01');
select * from test;

create table test(
    num number primary key,
    name varchar2(100)
);
create sequence test_seq ;
insert into test values(test_seq.nextval, 'test01');
insert into test values(test_seq.nextval, 'test02');
insert into test values(test_seq.nextval, 'test03');
select * from test;
commit;

select * from emp;



