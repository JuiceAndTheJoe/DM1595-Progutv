CREATE TABLE Teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    age INTEGER,
    gender TEXT);
    
INSERT INTO Teachers (fullname, age, gender) VALUES ("Linda Kann", 62, "F");
INSERT INTO Teachers (fullname, age, gender) VALUES ("Viggo Kann", 61, "M");
INSERT INTO Teachers (fullname, age, gender) VALUES ("Leif Handberg", 63, "M");
INSERT INTO Teachers (fullname, age, gender) VALUES ("Haibo Li", 59, "M");
INSERT INTO Teachers (fullname, age, gender) VALUES ("Jarmo Laaksolahti", 58, "M");

CREATE TABLE Courses  (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher_id INTEGER,
    course TEXT,
    year INTEGER);
    
INSERT INTO Courses (teacher_id, course,year) VALUES (1, "DD1320 Tilda", 2);
INSERT INTO Courses (teacher_id, course, year) VALUES (2, "DD2350 Algkomp", 3);
INSERT INTO Courses (teacher_id, course, year) VALUES (3, "DM1581 Intromedia", 1);
INSERT INTO Courses (teacher_id, course, year) VALUES (4, "DM1580 Videoteknik", 2);
INSERT INTO Courses (teacher_id, course, year) VALUES (5, "DM1595 Progutv", 3);

SELECT * FROM Teachers;
SELECT * FROM Courses;

/* Who teaches what? What year is it given? */
SELECT 
    Teachers.fullname,
    Courses.course,
    Courses.year
FROM Teachers
LEFT JOIN Courses
    ON Teachers.id = Courses.teacher_id;

/* Are any teachers married? (share a last name?) */
SELECT 
    t1.fullname AS teacher1,
    t2.fullname AS teacher2
FROM Teachers t1
JOIN Teachers t2
    ON t1.id < t2.id
   AND substr(t1.fullname, instr(t1.fullname, ' ') + 1) =
       substr(t2.fullname, instr(t2.fullname, ' ') + 1);