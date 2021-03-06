-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
                            first_name,
                            last_name,
                            title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title) AS count,
       title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--- Deliverable 2

SELECT DISTINCT ON (e.emp_no) e.emp_no,
                              e.first_name,
                              e.last_name,
                              e.birth_date,
                              de.from_date,
                              de.to_date,
                              t.title
INTO mentorship_eligibility
FROM employees e
         INNER JOIN dept_emp de ON e.emp_no = de.emp_no
         INNER JOIN titles t ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01')
  AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- For Report
SELECT *
FROM retiring_titles;


SELECT COUNT(*) AS count, di.dept_name
FROM unique_titles
         INNER JOIN dept_info di ON unique_titles.emp_no = di.emp_no
GROUP BY dept_name
ORDER BY count DESC;

select count(*) from mentorship_eligibility;

