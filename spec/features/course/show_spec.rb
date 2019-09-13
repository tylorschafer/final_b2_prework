require 'rails_helper'

describe 'Course show page' do
  before :each do
    @math = Course.create(name: 'Math')
    @tylor = Student.create(name: 'Tylor')
    @brian = Student.create(name: 'Brian')
    @meg = Student.create(name: 'Meg')
    @student_course_tylor = @tylor.student_courses.create(grade: 2.3, course_id: @math.id)
    @student_course_brian = @brian.student_courses.create(grade: 3.1, course_id: @math.id)
    @student_course_meg = @meg.student_courses.create(grade: 3.9, course_id: @math.id)
  end

  it 'Shows info on that course' do
    visit course_path(@math)

    expect(page).to have_content(@math.name)
    expect(page).to have_content("Student Statistics")

    expected =(
      "#{@meg.name}: #{@student_course_meg.grade}\n"
      "#{@brian.name}: #{@student_course_brian.grade}\n"
      "#{@tylor.name}: #{@student_course_tylor.grade}"
    )

    expect(page).to have_content(expected)
  end
end
