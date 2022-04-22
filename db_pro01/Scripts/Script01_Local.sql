--���ǹ�(Query�ۼ�)
SELECT 'HELLO Oracle' FROM DUAL;

/*
 * �����(user)�� local�� ������ ����� system ������ �����. - DBMS ������ ����
 * �Ϲ� ����� ������ ���� ����� ������ ������ �и�.
 */

-- ������ �н����� �����ϴ� ���
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