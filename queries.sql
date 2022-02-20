-- Who has the highest score in Maths
SELECT studentName FROM student stu
WHERE studentID = (
    SELECT studentID FROM (
        SELECT * FROM examResult WHERE subject = 'Maths'
        ) mm WHERE mm.marks = MAX(mm.marks)
    )


-- Who has the lowest score in English
SELECT studentName FROM student stu
WHERE studentID = (
    SELECT studentID FROM (
                              SELECT * FROM examResult WHERE subject = 'English'
                          ) mm WHERE mm.marks = MIN(mm.marks)
)

-- Please rank the students by their average score in descending order
SELECT e.studentID, AVG(e.marks) averageMark from examResult e
GROUP BY e.studentID
ORDER BY averageMark DESC



-- Find the names of students that begin with ‘A’

SELECT studentName FROM student
WHERE studentName LIKE 'a%'





-- Find how many students have more than two subjects with score 85 or above
SELECT count(*) FROM (
SELECT selectedResult.studentID, COUNT(selectedResult.studentID) countID FROM
(SELECT * FROM examResult e WHERE e.marks >= 85) selectedResult GROUP BY selectedResult.studentID)
WHERE countID > 2


-- Please rank the students by their average score in descending order

SELECT e.studentID, AVG(e.marks) averageMarks, s.studentName FROM examResult e
LEFT OUTER JOIN student s
ON e.studentID = s.studentID
GROUP BY e.studentID
ORDER BY averageMarks DESC
