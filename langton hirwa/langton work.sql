DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;

CREATE TABLE departments (
    department_id   NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(30) NOT NULL,
    created_at      DATE DEFAULT SYSDATE
);

CREATE TABLE employees (
    employee_id   NUMBER(6) PRIMARY KEY,
    first_name    VARCHAR2(20),
    last_name     VARCHAR2(25) NOT NULL,
    salary        NUMBER(8, 2),
    hire_date     DATE NOT NULL,
    department_id NUMBER(4),
    created_at    DATE DEFAULT SYSDATE,
    CONSTRAINT fk_dept FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert Department Records
INSERT INTO departments (department_id, department_name, created_at) 
VALUES (10, 'Administration', TO_DATE('2026-10-01', 'YYYY-MM-DD'));

INSERT INTO departments (department_id, department_name, created_at) 
VALUES (20, 'Marketing', TO_DATE('2026-10-01', 'YYYY-MM-DD'));

INSERT INTO departments (department_id, department_name, created_at) 
VALUES (30, 'Purchasing', TO_DATE('2026-10-01', 'YYYY-MM-DD'));

INSERT INTO departments (department_id, department_name, created_at) 
VALUES (40, 'Human Resources', TO_DATE('2026-10-01', 'YYYY-MM-DD'));

INSERT INTO departments (department_id, department_name, created_at) 
VALUES (50, 'IT Software', TO_DATE('2026-10-01', 'YYYY-MM-DD'));

-- Insert Employee Records
INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id, created_at) 
VALUES (101, 'HIRWA', 'LANGTON', 4500.00, TO_DATE('2020-01-15', 'YYYY-MM-DD'), 50, TO_DATE('2026-10-08', 'YYYY-MM-DD'));

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id, created_at) 
VALUES (102, 'Alice', 'Smith', 2800.00, TO_DATE('2018-03-20', 'YYYY-MM-DD'), 10, TO_DATE('2026-10-08', 'YYYY-MM-DD'));

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id, created_at) 
VALUES (103, 'Bob', 'Jones', 6000.00, TO_DATE('2022-07-10', 'YYYY-MM-DD'), 20, TO_DATE('2026-10-08', 'YYYY-MM-DD'));

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id, created_at) 
VALUES (104, 'Charlie', 'Brown', 3500.00, TO_DATE('2015-11-05', 'YYYY-MM-DD'), 30, TO_DATE('2026-10-08', 'YYYY-MM-DD'));

INSERT INTO employees (employee_id, first_name, last_name, salary, hire_date, department_id, created_at) 
VALUES (105, 'Diana', 'Prince', 8000.00, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 40, TO_DATE('2026-10-08', 'YYYY-MM-DD'));

COMMIT;
DECLARE
    v_student_id   VARCHAR2(20) := '20252SEN087';
    v_student_name VARCHAR2(50) := 'HIRWA LANGTON';
    v_number       NUMBER := 15;
BEGIN
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Input Number : ' || v_number);
    DBMS_OUTPUT.PUT_LINE('========================================');

    IF v_number > 0 THEN
        GOTO pos_label;
    ELSIF v_number < 0 THEN
        GOTO neg_label;
    ELSE
        GOTO zero_label;
    END IF;

    <<pos_label>>
    DBMS_OUTPUT.PUT_LINE('Classification: Positive');
    GOTO check_even_odd;

    <<neg_label>>
    DBMS_OUTPUT.PUT_LINE('Classification: Negative');
    GOTO check_even_odd;

    <<zero_label>>
    DBMS_OUTPUT.PUT_LINE('Classification: Zero');
    GOTO end_label;

    <<check_even_odd>>
    IF MOD(v_number, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Parity        : Even');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Parity        : Odd');
    END IF;
    GOTO end_label;

    <<end_label>>
    DBMS_OUTPUT.PUT_LINE('========================================');
END;
/
DECLARE
    v_student_id   VARCHAR2(20) := '20252SEN087';
    v_student_name VARCHAR2(50) := 'HIRWA LANGTON';
    v_salary       NUMBER := 45000;
    v_review_status VARCHAR2(50);
BEGIN
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Current Salary: ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('========================================');

    IF v_salary < 30000 THEN
        GOTO low_salary;
    ELSIF v_salary BETWEEN 30000 AND 60000 THEN
        GOTO medium_salary;
    ELSE
        GOTO high_salary;
    END IF;

    <<low_salary>>
    v_review_status := 'Eligible for 15% Increase';
    GOTO print_result;

    <<medium_salary>>
    v_review_status := 'Eligible for 10% Increase';
    GOTO print_result;

    <<high_salary>>
    v_review_status := 'Eligible for 5% Increase';
    GOTO print_result;

    <<print_result>>
    DBMS_OUTPUT.PUT_LINE('Review Status: ' || v_review_status);
    GOTO end_label;

    <<end_label>>
    DBMS_OUTPUT.PUT_LINE('========================================');
END;
/
/*
-- ILLEGAL PL/SQL CODE EXAMPLE
-- Reason: Oracle PL/SQL forbids GOTO jumps into IF statements, loops, or sub-blocks.

DECLARE
    v_test NUMBER := 10;
BEGIN
    GOTO inside_if_label; -- Error PLS-00375: illegal GOTO statement

    IF v_test > 5 THEN
        <<inside_if_label>>
        DBMS_OUTPUT.PUT_LINE('Inside IF block');
    END IF;
END;
/
*/

-- CORRECTED WORKING VERSION:
DECLARE
    v_student_id   VARCHAR2(20) := '20252SEN087';
    v_student_name VARCHAR2(50) := 'HIRWA LANGTON';
    v_test         NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_name || ' (' || v_student_id || ')');
    
    IF v_test > 5 THEN
        DBMS_OUTPUT.PUT_LINE('Condition Met: Value is greater than 5');
    END IF;
END;
/
DECLARE
    v_student_id   VARCHAR2(20) := '20252SEN087';
    v_student_name VARCHAR2(50) := 'HIRWA LANGTON';
    v_number       NUMBER := 15;
    v_class        VARCHAR2(20);
    v_parity       VARCHAR2(20);
BEGIN
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('========================================');

    IF v_number > 0 THEN
        v_class := 'Positive';
    ELSIF v_number < 0 THEN
        v_class := 'Negative';
    ELSE
        v_class := 'Zero';
    END IF;

    IF v_number != 0 THEN
        IF MOD(v_number, 2) = 0 THEN
            v_parity := 'Even';
        ELSE
            v_parity := 'Odd';
        END IF;
        DBMS_OUTPUT.PUT_LINE('Number ' || v_number || ' is ' || v_class || ' and ' || v_parity);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Number ' || v_number || ' is Zero');
    END IF;
END;
/
CREATE OR REPLACE FUNCTION fn_annual_salary (
    p_monthly_salary IN NUMBER
) RETURN NUMBER IS
BEGIN
    IF p_monthly_salary IS NULL OR p_monthly_salary < 0 THEN
        RETURN 0;
    END IF;
    RETURN p_monthly_salary * 12;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END fn_annual_salary;
/
CREATE OR REPLACE FUNCTION fn_years_of_service (
    p_hire_date IN DATE
) RETURN NUMBER IS
    v_years NUMBER;
BEGIN
    IF p_hire_date IS NULL OR p_hire_date > SYSDATE THEN
        RETURN 0;
    END IF;
    
    v_years := TRUNC(MONTHS_BETWEEN(SYSDATE, p_hire_date) / 12);
    RETURN v_years;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END fn_years_of_service;
/
CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_annual_salary IN NUMBER
) RETURN NUMBER IS
    v_tax NUMBER := 0;
BEGIN
    IF p_annual_salary IS NULL OR p_annual_salary <= 0 THEN
        RETURN 0;
    ELSIF p_annual_salary <= 30000 THEN
        v_tax := p_annual_salary * 0.10;
    ELSIF p_annual_salary <= 60000 THEN
        v_tax := p_annual_salary * 0.15;
    ELSE
        v_tax := p_annual_salary * 0.20;
    END IF;
    
    RETURN ROUND(v_tax, 2);
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END fn_calculate_tax;
/