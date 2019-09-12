class Course < ApplicationRecord
  has_many :student_courses
  has_many :students, through: :student_courses

  validates_presence_of :name

  def student_grade(student_id)
    student_courses.where(student_id: student_id).pluck(:grade).first
  end
end
