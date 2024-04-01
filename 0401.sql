/*
    DBMS    - ������ ���̽� ���� �ý���
    SQL        - ����ȭ�� ���� ���
                    - ������ ���̽��� ����, ���ڵ� �˻� ���� �۾��� ������ �� ����� �ȴ�
                    - ���ǹ�(DDL) - CREATE, ALTER, DROP
                    - ���(DCL) - GRANT, REVOKE
                    - ���۹�(DML) - UPDATE, INSERT, DELETE
                    - ����               - SELECT
                    - Ʈ����� ó�� - COMMIT, ROLLBACK
                        : JSP ���� ������ ����
                            ���̺� ����, ����
                            ���ڵ� ����/ ����/ ����/ �˻� ���ַ� �����ϰ� �����
                                = CRUD   
                                
    SQL Developer
        - ��ɹ� ��ҹ���  �������� -> ��κ� �ҹ��� ���
        - �����Ǵ� ���� ��ҹ��� ����
        - �ٹٲ��ص� �ٱ۷� ���� ������
            : �ݵ�� ; (�����ݷ�) ���� ���������
        - ���ڴ� ������ ''(Ȭ����ǥ) ���
        - ,( ��ǥ) �����ϰ� �������� �����ʴ´�.
        - CRUD �� �ݵ�� commit; �ؾ���
        - ���� : �ʷϻ� �����ư/ Ctrl + Enter

    Ʈ�����
        - �����ͺ��̽� �۾��� ������ �ϳ��̴�.
        - �ϳ��� Ʈ������� ���� SQL �������� ������ �� �ִ�
        
        COMMIT          :   Ʈ������� �Ϸ��ϰ� ���� ������ ����(��������)
        ROLLBACK    :   Ʈ������� ����ϰ� ��������� �ǵ�����.
        
        - insert, update, delete ���� ���� �� commit;
        - �߰��Ϸ�! �����Ϸ�! �����Ϸ�! �̸�
            commit �Ŀ��� rollback ���� �ǵ��� �� �� ����.
            ���� ������ commit ���� �ʰ� rollback�ϸ� ���������� �ǵ��� ����.
            
*/
create table test(
    num         number          primary key,
    name        varchar2(100)                   ,
    reg             date              default   sysdate,
    age         number              default 1
);
-- alter table ���̺�� add (�÷��� Ÿ�� �ɼ�);
--not null, primary key ������
-- �÷��� ���� ���� �Ұ� = �� ������ ������ �߰�
-- ���̺� ���ڵ�(������) �� ������ �ɼ� ��� �Ұ�
alter table test add (age   number      default 1);
alter table test add(pw     varchar2(50)  not null ); // ���ڵ�( ������) �� ������ not null �ɼ� ��� �Ұ��� Ȯ���ϱ� ���� ������
insert into test values(1, 'java', sysdate, 10);

-- ���̺� �÷� �̸� ����
--alter table ���̺�� rename column �÷��� to �����;
alter table test rename column name to nick;

-- ���̺� �÷� ����
-- alter table ���̺�� drop column �÷���;
alter table test drop column pw;


commit;
select * from test;