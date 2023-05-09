USE QuanLySinhVien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM subject
WHERE Credit = ALL(SELECT MAX(Credit) FROM subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT Sub.SubId, Sub.SubName, M.Mark
FROM subject Sub JOIN MARK M USING(SubId)
WHERE MARK = All(SELECT MAX(Mark) FROM Mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS DTB
FROM Student S JOIN Mark M USING (StudentId)
GROUP BY S.StudentId
ORDER BY DTB DESC;