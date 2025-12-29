CREATE INDEX "enrollments_index_1" ON enrollments("course_id");
CREATE INDEX "enrollments_index_2" ON enrollments("student_id");
CREATE INDEX "satisfies_index" ON satisfies("course_id");
CREATE INDEX "courses_index" ON courses("semester", "department", "number");
