require 'rails_helper'

describe Course do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'instance methods' do
    before :each do
      @math = Course.create(name: 'Math')
      @tylor = Student.create(name: 'Tylor')
      @brian = Student.create(name: 'Brian')
      @meg = Student.create(name: 'Meg')
      @student_course_tylor = @tylor.student_courses.create(grade: 2.3, course_id: @math.id)
      @student_course_brian = @brian.student_courses.create(grade: 3.1, course_id: @math.id)
      @student_course_meg = @meg.student_courses.create(grade: 3.9, course_id: @math.id)
    end

    it '#student_rank returns student names and grade ordered by grade' do
      expect(@math.student_rank[0].name).to eq(@meg.name)
      expect(@math.student_rank[0].grade).to eq(@student_course_meg.grade)
      expect(@math.student_rank[1].name).to eq(@brian.name)
      expect(@math.student_rank[1].grade).to eq(@student_course_brian.grade)
      expect(@math.student_rank[2].name).to eq(@tylor.name)
      expect(@math.student_rank[2].grade).to eq(@student_course_tylor.grade)
    end
  end
end
