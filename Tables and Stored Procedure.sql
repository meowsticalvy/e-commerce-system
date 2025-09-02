CREATE TABLE employees
(
    emp_id NUMBER(5),
    emp_name VARCHAR2(100),
    emp_email VARCHAR2(100),
    emp_phone VARCHAR2(20),
    emp_dept VARCHAR2(10),
    emp_join_date DATE DEFAULT SYSDATE,
    CONSTRAINT var_emp_pk primary key(emp_id)
 );


CREATE TABLE registration (
reg_id NUMBER GENERATED ALWAYS AS IDENTITY,
emp_id NUMBER(5),
username VARCHAR2(25) NOT NULL,
password VARCHAR2(50) NOT NULL,
CONSTRAINT var_reg_empid_fk FOREIGN KEY(emp_id) REFERENCES employees (emp_id),
CONSTRAINT var_reg_uname UNIQUE(username),
CONSTRAINT var_reg_id_pk PRIMARY KEY(reg_id)
);




CREATE OR REPLACE PROCEDURE update_employee (
p_id IN NUMBER,
p_name IN VARCHAR2
) IS
BEGIN
UPDATE employees
SET emp_name = p_name
WHERE emp_id = p_id;
END;
/

CREATE OR REPLACE PROCEDURE delete_employee (
p_id IN NUMBER
) IS
BEGIN
DELETE FROM employees
WHERE emp_id = p_id;
END;
/

CREATE OR REPLACE PROCEDURE insert_employee (
p_id IN NUMBER,
p_name IN VARCHAR2,
p_email IN VARCHAR2,
p_phone IN VARCHAR2,
p_dept IN VARCHAR2,
p_join_date IN DATE
) IS
BEGIN
INSERT INTO employees (emp_id, emp_name, emp_email, emp_phone, emp_dept, emp_join_date)
VALUES (p_id, p_name, p_email, p_phone, p_dept, p_join_date);
END;
/


CREATE OR REPLACE PROCEDURE search_employee (
p_id IN NUMBER,
p_name OUT VARCHAR2,
p_email OUT VARCHAR2,
p_phone OUT VARCHAR2,
p_dept OUT VARCHAR2,
p_join_date OUT DATE
) IS
BEGIN
SELECT emp_name, emp_email, emp_phone, emp_dept, emp_join_date
INTO p_name, p_email, p_phone, p_dept, p_join_date
FROM employees
WHERE emp_id = p_id;
END;
/



CREATE OR REPLACE PROCEDURE login_employee (
p_username IN VARCHAR2,
p_password IN VARCHAR2,
p_valid OUT NUMBER,
p_emp_id OUT NUMBER
) IS
BEGIN
SELECT emp_id
INTO p_emp_id
FROM registration
WHERE username = p_username AND password = p_password;
p_valid := 1;
EXCEPTION
WHEN NO DATA_FOUND THEN
p_valid := 0;
p_emp_id := NULL;
END;
/