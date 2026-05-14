create database job_tracker;

use job_tracker;

CREATE TABLE job_applications (
    application_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    job_role VARCHAR(100),
    platform VARCHAR(50),
    application_date DATE,
    status VARCHAR(50),
    salary_range VARCHAR(50),
    location VARCHAR(100),
    work_mode VARCHAR(50),
    required_skills VARCHAR(255),
    interview_date DATE
);

select count(*)as total_applications
from job_applications;


select status, count(*) as total
from job_applications
group by status;

SELECT platform, COUNT(*) AS total
FROM job_applications
GROUP BY platform
ORDER BY total DESC;

SELECT company_name, COUNT(*) AS total
FROM job_applications
GROUP BY company_name
ORDER BY total DESC;

SELECT 
    MONTH(application_date) AS month_number,
    MONTHNAME(application_date) AS month_name,
    COUNT(*) AS applications
FROM job_applications
GROUP BY MONTH(application_date), MONTHNAME(application_date)
ORDER BY month_number;

SELECT COUNT(*) AS interview_calls
FROM job_applications
WHERE status = 'Interview Scheduled';

  SELECT *
FROM job_applications
WHERE status = 'Rejected';

SELECT *
FROM job_applications
WHERE status = 'Selected';

 SELECT COUNT(*) AS remote_jobs
FROM job_applications
WHERE work_mode = 'Remote';

SELECT *
FROM job_applications
WHERE salary_range = '6-8 LPA';

SELECT required_skills, COUNT(*) AS demand
FROM job_applications
GROUP BY required_skills
ORDER BY demand DESC;

SELECT location, COUNT(*) AS total
FROM job_applications
GROUP BY location
ORDER BY total DESC;

SELECT application_date, COUNT(*) AS total
FROM job_applications
GROUP BY application_date
ORDER BY application_date;

SELECT company_name, COUNT(*) AS total
FROM job_applications
GROUP BY company_name
ORDER BY total DESC
LIMIT 5;

 SELECT 
(
    SUM(CASE WHEN status='Interview Scheduled' THEN 1 ELSE 0 END)
    / COUNT(*)
) * 100 AS interview_rate_percentage
FROM job_applications;

 SELECT 
(
    SUM(CASE WHEN status='Selected' THEN 1 ELSE 0 END)
    / COUNT(*)
) * 100 AS selection_rate_percentage
FROM job_applications;

 CREATE VIEW dashboard_summary AS
SELECT
    company_name,
    job_role,
    platform,
    status,
    location,
    work_mode,
    salary_range
FROM job_applications;

 DELIMITER //

CREATE PROCEDURE GetSelectedCandidates()
BEGIN
    SELECT *
    FROM job_applications
    WHERE status = 'Selected';
END //

DELIMITER ;
CALL GetSelectedCandidates();

 CREATE INDEX idx_status
ON job_applications(status);

select * from job_applications;

