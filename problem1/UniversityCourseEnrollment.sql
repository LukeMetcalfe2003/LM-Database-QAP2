-- Table for students
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    school_enrollment_date DATE
);

-- Table for professors
CREATE TABLE professors(
    professor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department(50)
);

-- Table for courses
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    course_description VARCHAR(300),
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
);

-- Table for enrollments
CREATE TABLE enrollments(
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    PRIMARY KEY (student_id, course_id),
    enrollment_date DATE
);

-- inserting data for student table
INSERT INTO students (first_name, last_name, email, school_enrollment_date) VALUES 
('John', 'Doe', 'jdoe@gmail.com', '2023-06-05'),
('Jane', 'Doe', 'janedoe@hotmail.com', '2024-01-01'),
('Rick', 'Smith', 'rsmith@gmail.com', '2022-06-06'),
('Gordon', 'Ramsay', 'gramsay@hotmail.co', '2024-02-02'),
('Luke', 'Metcalfe', 'lmetcalfe@hotmail.com', '2021-03-03');

-- inserting data for professors
INSERT INTO professors (first_name, last_name, department) VALUES 
('Matthew', 'English', 'Databases'),
('Ainee', 'Malik', 'JAVA'),
('Maurice', 'Babin', 'Python'),
('John', 'Smith', 'Physics');

-- inserting data for courses table
INSERT INTO courses (course_name, course_description, professor_id) VALUES 
('Database', 'Learn about databases', 1),
('Physics 101', 'Learn about Physics', 2),
('Python Programming', 'Learn about Python', 3);

-- inserting data for enrollments table
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES 
(1, 1, '2023-06-05'),
(2, 2, '2024-01-01'),
(3, 3, '2022-06-06'),
(4, 1, '2024-02-02'),
(5, 2, '2021-03-03');

-- Adding tasks
-- get all students in Physics 101
SELECT CONCAT(students.first_name, ' ', students.last_name) AS full_name
FROM students
JOIN enrollments ON students.student_id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'Physics 101';

-- get all the courses and professors
SELECT courses.course_name, CONCAT(professors.first_name, ' ', professors.last_name) AS professor_name
FROM courses
JOIN professors ON courses.professor_id = professors.professor_id;

-- get all the courses with at least one student in them 
SELECT DISTINCT courses.course_name
FROM courses
JOIN enrollments ON courses.course_id = enrollments.course_id;

-- update student email
UPDATE students
SET email = 'ljmet@hotmail.com'
WHERE students.student_id = 5;

-- remove a student from a course
DELETE FROM enrollments
WHERE enrollments.student_id = 3 AND course_id = 1;
