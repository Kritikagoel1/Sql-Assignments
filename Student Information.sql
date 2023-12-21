--Q2--
-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);


-- Create Teacher table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
-- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
-- Create Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create Payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
--Q3(a)--
-- Insert 10 values into Students table with Indian names and numbers
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
    (1, 'Aarav', 'Patel', '1995-07-12', 'aarav.patel@example.com', '9876543210'),
    (2, 'Diya', 'Sharma', '1993-02-18', 'diya.sharma@example.com', '8765432109'),
    (3, 'Advait', 'Sinha', '1998-11-05', 'advait.sinha@example.com', '7654321098'),
    (4, 'Zara', 'Kumar', '1990-09-25', 'zara.kumar@example.com', '6543210987'),
    (5, 'Aanya', 'Das', '1996-04-30', 'aanya.das@example.com', '5432109876'),
    (6, 'Vihaan', 'Choudhury', '1994-08-15', 'vihaan.choudhury@example.com', '4321098765'),
    (7, 'Ananya', 'Rao', '1991-12-10', 'ananya.rao@example.com', '3210987654'),
    (8, 'Arjun', 'Mukherjee', '1997-06-22', 'arjun.mukherjee@example.com', '2109876543'),
    (9, 'Ishita', 'Nair', '1999-03-08', 'ishita.nair@example.com', '1098765432'),
    (10, 'Kabir', 'Verma', '1992-01-20', 'kabir.verma@example.com', '9876543210');

-- Insert 10 values into Teacher table
INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
    (1, 'Dr. Manoj', 'Sharma', 'manoj.sharma@example.com'),
    (2, 'Prof. Anjali', 'Verma', 'anjali.verma@example.com'),
    (3, 'Dr. Rajat', 'Singh', 'rajat.singh@example.com'),
    (4, 'Prof. Priya', 'Gupta', 'priya.gupta@example.com'),
    (5, 'Dr. Sanjay', 'Patil', 'sanjay.patil@example.com'),
    (6, 'Prof. Neha', 'Kumar', 'neha.kumar@example.com'),
    (7, 'Dr. Rohit', 'Shah', 'rohit.shah@example.com'),
    (8, 'Prof. Ananya', 'Das', 'ananya.das@example.com'),
    (9, 'Dr. Vikram', 'Rao', 'vikram.rao@example.com'),
    (10, 'Prof. Ritu', 'Chopra', 'ritu.chopra@example.com');
-- Insert 10 values into Courses table
INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
    (1, 'Computer Science Fundamentals', 4, 1),
    (2, 'Data Structures and Algorithms', 5, 2),
    (3, 'Introduction to Artificial Intelligence', 3, 3),
    (4, 'Database Management Systems', 4, 4),
    (5, 'Web Development Basics', 3, 5),
    (6, 'Software Engineering Principles', 5, 6),
    (7, 'Machine Learning Essentials', 4, 7),
    (8, 'Network Security', 4, 8),
    (9, 'Mobile App Development', 3, 9),
    (10, 'Digital Marketing Strategies', 3, 10);
-- Insert 10 values into Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 1, '2023-01-15'),
    (2, 2, 3, '2023-02-20'),
    (3, 3, 5, '2023-03-10'),
    (4, 4, 7, '2023-04-25'),
    (5, 5, 9, '2023-05-05'),
    (6, 6, 2, '2023-06-12'),
    (7, 7, 4, '2023-07-18'),
    (8, 8, 6, '2023-08-22'),
    (9, 9, 8, '2023-09-30'),
    (10, 10, 10, '2023-10-15');
-- Insert 10 values into Payments table
INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
    (1, 1, 5000.00, '2023-01-05'),
    (2, 2, 6000.00, '2023-02-10'),
    (3, 3, 4500.00, '2023-03-15'),
    (4, 4, 5500.00, '2023-04-20'),
    (5, 5, 7000.00, '2023-05-25'),
    (6, 6, 4800.00, '2023-06-30'),
    (7, 7, 5200.00, '2023-07-05'),
    (8, 8, 6300.00, '2023-08-10'),
    (9, 9, 5800.00, '2023-09-15'),
    (10, 10, 7500.00, '2023-10-20');

	--Q3(b)--
	--1)--
	Insert into Students(student_id, first_name, last_name, date_of_birth, email, phone_number)
	Values
	(11,'John','Doe','1995-08-15','john.doe@example.com',' 1234567890');
	--2)--
	Insert into  Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(11,1,8,'2023-12-01');
	--3)--
     Update Teacher 
	 set email='m.sharma@example.com'
	 where teacher_id=1;
	 --Q4)--
	 delete from Enrollments where student_id=1 and course_id=8;
	 --Q5)--
	 update Courses set teacher_id=1 where course_name='Mobile App Development';
	 --Q6)--
ALTER TABLE Enrollments
ADD CONSTRAINT FK_Student_Enrollment
FOREIGN KEY (student_id)
REFERENCES Students(student_id)
ON DELETE CASCADE;
DELETE FROM Students
WHERE student_id = 'your_student_id';
	 --Q7)--
	 update Payments set amount=8000 where payment_id=8;
--Q4 Joins--
--1)--
select s.student_id,s.first_name, sum(p.amount)as total_pay from Students s
join Payments p on s.student_id=p.student_id
where p.student_id=8
GROUP BY s.student_id,s.first_name;
--2)--
select c.course_name, count(e.student_id)as totals from Courses c
left join Enrollments e on e.course_id=c.course_id
GROUP BY c.course_name;
--3)--
select s.student_id, s.first_name, s.last_name from Students s
left join Enrollments e on e.student_id=s.student_id
where e.course_id is null;
--4)--
select s.first_name, s.last_name, c.course_name from Students s
join Enrollments e on e.student_id=s.student_id
join Courses c on c.course_id=e.course_id;
--5)--
select t.first_name, t.last_name,c.course_name from Teacher t
join Courses c on c.teacher_id=t.teacher_id;
--6)--
select s.student_id,s.first_name,s.last_name,e.enrollment_date from Students s
join Enrollments e on s.student_id=e.student_id
join Courses c on c.course_id=e.course_id

--7)--
SELECT Students.student_id, Students.first_name, Students.last_name
FROM Students
LEFT JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.payment_id IS NULL;
--8)--

SELECT Courses.course_id, Courses.course_name
FROM Courses
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
WHERE Enrollments.enrollment_id IS NULL;
--9)--

SELECT DISTINCT E1.student_id, S.first_name, S.last_name
FROM Enrollments E1
JOIN Enrollments E2 ON E1.student_id = E2.student_id AND E1.course_id <> E2.course_id
JOIN Students S ON E1.student_id = S.student_id;
--10)--

SELECT Teacher.teacher_id, Teacher.first_name, Teacher.last_name
FROM Teacher
LEFT JOIN Courses ON Teacher.teacher_id = Courses.teacher_id
WHERE Courses.course_id IS NULL;
--Q5)-1)--

SELECT course_id, course_name, AVG(enrollment_count) AS average_students_enrolled
FROM (
    SELECT C.course_id, C.course_name, COUNT(E.student_id) AS enrollment_count
    FROM Courses C
    LEFT JOIN Enrollments E ON C.course_id = E.course_id
    GROUP BY C.course_id, C.course_name
) AS course_enrollment_counts
GROUP BY course_id, course_name;

--2)--
SELECT Students.student_id, Students.first_name, Students.last_name, Payments.amount AS highest_payment
FROM Students
JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.amount = (
    SELECT MAX(amount)
    FROM Payments
);
--4)--
SELECT Teacher.teacher_id, Teacher.first_name, Teacher.last_name, COALESCE(SUM(Payments.amount), 0) AS total_payments
FROM Teacher
LEFT JOIN Courses ON Teacher.teacher_id = Courses.teacher_id
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
LEFT JOIN Payments ON Enrollments.student_id = Payments.student_id
GROUP BY Teacher.teacher_id, Teacher.first_name, Teacher.last_name;
--5)--
SELECT student_id, first_name, last_name
FROM Students
WHERE (
    SELECT COUNT(DISTINCT course_id) 
    FROM Courses
    ) = (
    SELECT COUNT(DISTINCT course_id) 
    FROM Enrollments
    WHERE Students.student_id = Enrollments.student_id
);
--6)--
SELECT teacher_id, first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (
SELECT  teacher_id FROM Courses);
--7)--
SELECT AVG(age) AS average_age
FROM (
    SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age
    FROM Students
) AS student_ages;
--8)--
SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (
SELECT  course_id FROM Enrollments);
--10)--
SELECT student_id, first_name, last_name
FROM Students
WHERE student_id IN (
SELECT student_id FROM Payments
GROUP BY student_id
HAVING COUNT(payment_id) > 1);
--11)--
SELECT Students.student_id, Students.first_name, Students.last_name,SUM(Payments.amount) AS total_payments
FROM Students
LEFT JOIN Payments ON Students.student_id = Payments.student_id
GROUP BY Students.student_id, Students.first_name, Students.last_name;
--12)--
SELECT Courses.course_id, Courses.course_name, COUNT(Enrollments.student_id) AS student_count
FROM Courses
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
GROUP BY Courses.course_id, Courses.course_name;
--13)--
SELECT Students.student_id, Students.first_name, Students.last_name,AVG(Payments.amount)AS average_payment
FROM Students
LEFT JOIN Payments ON Students.student_id = Payments.student_id
GROUP BY Students.student_id, Students.first_name, Students.last_name;





