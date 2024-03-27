//�Լ�
//<���ڰ��� �Լ�>//
/*
    *upper - ��� �빮�ڷκ���
    lower  - ��� �ҹ��ڷ� ����
    initcap - ù���ڸ� �빮��
*/
 select  upper(ename), lower(ename), initcap(ename) from emp;
 select * from emp where upper(ename) = upper('scott');
 select * from emp where upper(ename) like upper('%s%');//�빮�� S�����ԵǾ��ִ� �빮��ename �߿��� ����
 //%SC% - �α��ڰ� �پ��ִ°͸� ����
 //%S%C% - �ܾ��� �α��ڰ� �� �ִ°͸� ����
 
 //length
 select ename, length(ename) from emp;// ename �÷��� ���� ���̸� ��ȸ
 select ename, sal, deptno, length(ename) from emp where length(ename) = 4;// �̸����̰� 4�� ����� �̸� �޿� �μ���ȣ ��ȸ
 
 //lengthb
 //*lengthb = ������ ����Ʈ �� ( �ѱ��� �ѱ��ڴ� 3����Ʈ)
 //*�Լ��� ����� ���̺� �̸��� ���ʿ��� ��� dual(�������̺�)���
 select length('�ѱ�'), lengthb('�ѱ�') from dual;// length = ���ڼ�(2),lengthb=����Ʈ��(6)

 //substr - ���� ����
 select job, substr(job, 1,3) from emp;// ����Ŭ�� �ε��� 1���� ���� ������ �ε��� ����
          //substr(�÷���, ����index, ���ڼ�)
select job, substr(job, 3, 2) from emp;// �ε���3������ 2���� ����
select job, substr(job,3) from emp;// �ε��� 3������ ������ ����
select job, substr(job,-1) from emp; // �ڿ������� 1���� 
select job, substr(job,-3) from emp;//�ڿ������� 3����
select job, substr(job,-3,2) from emp;//�ڿ��� 3��°���� 2����
select job, substr(job,1) from emp;//��ü ��� 1
select job, substr(job,-length(job)) from emp;// ��ü ���2 
select substr('������������', 3,2) from dual;// �Լ��� �̿��Ұ�� �������̺����ؼ� ���� ����

//instr - ���� �ε�����ġ ã��
//instr(�÷���, 'ã�ƺ�����', �����ε���, ã���ִ� �ߺ��� ������ ��°)
select instr('hello oracle', 'l') from dual;// �ߺ��Ǵ� �����ϰ�� ���� ù��° ������ �ε�����ȣ�� ���´�.
select instr('hello oracle', 'l',5)from dual;// 5���ε������� ������ ������ ������ �ε�����ȣ�� ����
select instr('hello oracle', 'l',1,2)from dual;// �ε��� 1������ ������ �ߺ��� ������ 2��° ��������

//replace - ���� ����
//replace(�÷���, ������ ����, ��ü�ҹ���)
select replace('010-1234-5678','-',' ')from dual;// �������� �������� ��ü
select job, replace(job,'M','-')from emp;// job �÷� ���� M�� -�� ��ü

//������ �� ���� ä��� lpad(��), rpad(��)
// l(r)pad(�÷���, ��ü��������, �����ä���ٹ���)
select lpad('oracle',7)from dual;
select lpad('oracle',10,'*')from dual;// ��ü���� 10 
select rpad('oracle',20,'��')from dual;// �ѱ��� �ѱ��ڴ� �ΰ�������
select rpad('890101-1',14,'*')from dual;// �ֹι�ȣ ǥ�� ������(������ Ȯ�ο������� ������)

// concat - �ι��ڿ� ������ ��ġ��
//concat(�÷�1, �÷�2)- ������ �÷� �ΰ��ǰ��� ��Ĩ
select concat(ename, job)from emp;// ����̸�+��å
select concat(empno,ename)from emp;//�����ȣ+����̸�
select empno||'-'||job from emp;// �����ȣ + - + ��å  

//trim, ltrim(��),rtrim(��) - Ư�� ���� �����
//trim('����'or�÷�)- �յ� ���� ��
//l(r)trim('����'or�÷�, '��������') - ������ ���� �Ǵ� �÷��� ���� ��(����)�� �������ڸ� �����
//l(r)trim('����'or�÷�)- �������ڰ� ���� ��� �����ѹ����� ��(����)���� ���鸸 �����Ѵ�. 
select trim('        <oracle>         ')from dual;// �յ� ��������
select ltrim('<oracle>','<')from dual;      // ���ʿ��ִ� < �����
select rtrim('<oracle>','>')from dual;      // �����ʿ��ִ� > �����
select ltrim('    <oracle>     ')from dual; // ������ ���� ����
select rtrim('    <oracle>     ')from dual; // �������� ���� ����


//<���ڰ����Լ�>//

//�ݿø�(round) �ø�(ceil)
//round(�Ҽ�, �ݿø��� �ڸ���)
select round(1234.5678)from dual;
select round(1234.5678,0)from dual;
select round(1234.5678,1)from dual; // �Ҽ��� �� ù��°�ڸ����� �ݿø�
select round(1234.5678,2)from dual; // �Ҽ��� �� �ι�°�ڸ����� �ݿø�
select round(1234.5678,-1)from dual;//�Ҽ��� �� ù��°�ڸ����� �ݿø�
select round(1234.5678,-2)from dual;//�Ҽ��� �� �ι�°�ڸ����� �ݿø�

//ceil()
select ceil(1234.5678)from dual;// 1235 �ø�
select ceil(-1234.5678)from dual;

//trunc ����, floor ����
//trunc(�Ҽ�, �Ҽ����� �ڸ���)- ������ �Ҽ��� ������ �Ҽ��� �Ʒ� �ڸ����� ����
select trunc(1234.5678)from dual;   // �Ҽ��� �Ʒ� ����
select trunc(1234.5678,1)from dual; // �Ҽ��� �Ʒ� ù��° �ڸ� ���Ĺ���
select trunc(1234.5678,2)from dual; // �Ҽ��� �Ʒ� �ι�° �ڸ� ���Ĺ���
select trunc(1234.5678,3)from dual; // �Ҽ��� �Ʒ� ����° �ڸ� ���Ĺ���
select sal, trunc(sal/12)from emp;  // ������ ���� �Ҽ����� ��������(= �����κ�ȯ)
select trunc(3.14)from dual;        //�Ҽ��� ���Ϲ����� ������ ��ȯ


















 