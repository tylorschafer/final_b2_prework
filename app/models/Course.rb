class Course < ApplicationRecord
  has_many :student_courses
  has_many :students, through: :student_courses

  validates_presence_of :name

  def student_rank
    student_courses.joins(:student)
                   .select("students.name, student_courses.grade")
                   .order('student_courses.grade DESC')
  end
end
