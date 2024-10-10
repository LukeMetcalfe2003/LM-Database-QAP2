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
INSERT INTO students (
        first_name,
        last_name,
        email,
        school_enrollment_date
    )
VALUES ('John', 'Doe', 'jdoe@gmail.com', '2023-06-05'),
    (
        'Jane',
        'Doe',
        'janedoe@hotmail.com',
        '2024-01-01'
    ),
    (
        'Rick',
        'Smith',
        'rsmith@gmail.com',
        '2022-06-06'
    ),
    (
        'Gordon',
        'Ramsay',
        'gramsay@hotmail.co',
        '2024-02-02'
    ),
    (
        'Luke',
        'Metcalfe',
        'lmetcalfe@hotmail.com',
        '2021-03-03'
    );
-- inserting data for professors
INSERT INTO professors (first_name, last_name, department)
VALUES ('Matthew', 'English', 'Databases'),
    ('Ainee', 'Malik', 'JAVA'),
    ('Maurice', 'Babin', 'Python'),
    ('Noman', 'Atique', 'JavaScript');