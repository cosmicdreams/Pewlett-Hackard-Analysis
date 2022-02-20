CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

-- auto-generated definition
CREATE TABLE dept_emp
(
    emp_no    integer NOT NULL,
    dept_no   text    NOT NULL,
    from_date date,
    to_date   date,
    CONSTRAINT dept_emp_pk
        PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

ALTER TABLE dept_emp
    OWNER TO postgres;



CREATE TABLE employees
(
    emp_no     INT     NOT NULL,
    birth_date DATE    NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name  VARCHAR NOT NULL,
    gender     VARCHAR NOT NULL,
    hire_date  DATE    NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager
(
    dept_no   VARCHAR(4) NOT NULL,
    emp_no    INT        NOT NULL,
    from_date DATE       NOT NULL,
    to_date   DATE       NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries
(
    emp_no    INT  NOT NULL,
    salary    INT  NOT NULL,
    from_date DATE NOT NULL,
    to_date   DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);

-- auto-generated definition
CREATE TABLE titles
(
    emp_no    integer NOT NULL,
    title     varchar NOT NULL,
    from_date date    NOT NULL,
    to_date   date,
    CONSTRAINT titles_pk
        PRIMARY KEY (emp_no, title, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

ALTER TABLE titles
    OWNER TO postgres;

