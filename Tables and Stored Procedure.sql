CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    emp_email VARCHAR2(100),
    emp_phone VARCHAR2(100),
    emp_dept VARCHAR2(100),
    emp_join_date DATE
);

CREATE TABLE Registration (
    reg_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    emp_id NUMBER,
    username VARCHAR2(50) UNIQUE NOT NULL,
    password VARCHAR2(100) NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

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
    WHEN NO_DATA_FOUND THEN
        p_valid := 0;
        p_emp_id := NULL;
END;
/


COLUMN EMP_ID FORMAT 9999
COLUMN EMP_NAME FORMAT A25      
COLUMN EMP_EMAIL FORMAT A40     
COLUMN EMP_PHONE FORMAT A20     
COLUMN EMP_DEPT FORMAT A15      
COLUMN EMP_JOIN_ FORMAT A20

SET LINESIZE 200
SET PAGESIZE 50 