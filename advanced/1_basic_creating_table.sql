CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_latter_file_name VARCHAR(255),
    status VARCHAR(50)
);



-- Insert sample data into the job_applied table
INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_latter_file_name,
    status
) VALUES (
    1,
    '2023-10-01',
    TRUE,
    'resume_john_doe.pdf',
    TRUE,
    'cover_letter_john_doe.pdf',
    'applied'
),
(
    2,
    '2023-10-02',
    FALSE,
    'resume_jane_doe.pdf',
    TRUE,
    'cover_letter_jane_doe.pdf',
    'interviewing'
),
(
    3,
    '2023-10-03',
    TRUE,
    'resume_alice_smith.pdf',
    FALSE,
    NULL,
    'rejected'
),
(
    4,
    '2023-10-04',
    FALSE,
    'resume_bob_johnson.pdf',
    TRUE,
    'cover_letter_bob_johnson.pdf',
    'offer_received'
),
(
    5,
    '2023-10-05',
    TRUE,
    'resume_charlie_brown.pdf',
    FALSE,
    NULL,
    'hired'
);


-- Add a new column 'contact' to the job_applied table
ALTER TABLE job_applied
ADD contact VARCHAR(50);


-- Update the contact column with specific values for each job_id
UPDATE job_applied
SET contact = 'Employment Agency'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Direct Application'
WHERE job_id = 2;   

UPDATE job_applied
SET contact = 'Online Job Portal'   
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Recruiter'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Company Website'
WHERE job_id = 5;



-- Rename the 'contact' column to 'contact_name'
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;


-- Change the data type of 'contact_name' column to TEXT
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;


-- Remove the 'contact_name' column from the job_applied table
ALTER TABLE job_applied
DROP COLUMN contact_name;


-- Query to select all data from the job_applied table
SELECT * FROM job_applied;


-- to drop a table
-- DROP TABLE job_applied