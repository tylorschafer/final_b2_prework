require 'rails_helper'

describe Student do
  describe 'valadations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'instance methods' do
    before :each do
      @tylor = Student.create(name: 'Tylor')
      @math = Course.create(name: 'Math')
      @tylor_math = @tylor.student_courses.create(grade: 3.2, course_id: @math.id)
    end

    it '#student_grade returns the grade for a specific student' do
      expect(@math.student_grade(@tylor.id)).to eq(@tylor_math.grade)
    end
  end
end
