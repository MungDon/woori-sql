//계정생성
alter session set"_ORACLE_SCRIPT"=true;

// create user 계정명 identified by 비밀번호;
create user scott identified by tiger;

//계정 권한
//grant 권한명, 권한명 to 계정명;
grant resource, connect, dba to scott;

commit;
