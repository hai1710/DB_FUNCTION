USE QuanLySinhVien;

-- Hiển thị số lượng sinh viên ở từng nơi
SELECT Address, COUNT(StudentID) FROM student
GROUP BY Address;

-- Tính điểm trung bình các môn học của mỗi học viên
SELECT S.StudentID, S.StudentName, AVG(M.Mark) AS 'DTB'
FROM Student S JOIN Mark M USING(StudentId)
GROUP BY S.StudentId, S.StudentName;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS 'AVG'
FROM Student S JOIN MARK M USING(StudentId)
GROUP BY S.StudentId, S.StudentName
HAVING 'AVG' > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS DTB
FROM Student S JOIN MARK M USING(StudentId)
GROUP BY S.StudentId, S.StudentName
HAVING DTB3 >= ALL (SELECT AVG(Mark) FROM Mark M GROUP BY M.StudentId);