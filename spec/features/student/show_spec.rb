require 'rails_helper'

describe 'Student show page' do
  before :each do
    @tylor = Student.create(name: 'Tylor Schafer')
    @math = Course.create(name: 'Math')
    @music = Course.create(name: 'Music Class')
    @student_course_math = @tylor.student_course.create(grade: 3.0, course_id: @math.id)
    @student_course_music = @tylor.student_course.create(grade: 4.0, course_id: @music.id)
  end

  it 'Shows info about the student' do
    visit student_path(@tylor)

    expect(page).to have_content(@tylor.name)
    expect(page).to have_content("#{@math.name}: #{@student_course_math.grade}")
    expect(page).to have_content("#{@music.name}: #{@student_course_music.grade}")
  end
end
