//��������
alter session set"_ORACLE_SCRIPT"=true;

// create user ������ identified by ��й�ȣ;
create user scott identified by tiger;

//���� ����
//grant ���Ѹ�, ���Ѹ� to ������;
grant resource, connect, dba to scott;

commit;
