--���ǹ�(Query�ۼ�)
SELECT 'HELLO Oracle' FROM DUAL;

/*
 * �Ϲ� ����� ������ ���� ����� ������ ������ �и�.
 * �Ʒ��� �۾��� ������ ������ �ִ� ������ ����ؾ� ��.
 */

-- ������ �н����� �����ϴ� ���(���� - CREATE, ���� - ALTER)
CREATE USER puser1 IDENTIFIED BY puser1;

/*
 * ������ ������ ���� �ο�(��, �������� �ο�)
 * RESOURCE�� CONNECT�� �������� ���ѵ��� �������� �����Ǿ� �ִ�.(ROLE ����)
 * CONNECT�� ���Ӹ� �ϴ� ����
 * RESOURCE�� DB�ڿ��� ����� �� �ְ� �ϴ� ���� (CREATE SEQUENCE, CREATE TABLE, CREATE TRIGGER ...)
 */
GRANT RESOURCE, CONNECT TO puser1;
GRANT INSERT ANY TABLE, UPDATE ANY TABLE
	, DELETE ANY TABLE, CREATE VIEW
 TO puser1;

 
-- ���콺 ��Ŭ�� - ���� - Ȱ��ȭ�� DB���� ����

-- ���̺����̽� ��� ���� �ο�
ALTER USER puser1 quota 10M ON USERS;
COMMIT;
 
-- ����� ���� ��� Ȯ���ϴ� ��.(USERNAME = �÷���)
SELECT USERNAME FROM ALL_USERS;

-- ������ �ο��� ���� Ȯ�� (������ ����)
SELECT PRIVILEGE FROM DBA_SYS_PRIVS WHERE GRANTEE = 'PUSER1';

-- ������ �ο��� ROLE ���� Ȯ�� (������ ����)
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'PUSER1';

COMMIT;








