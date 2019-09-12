require 'rails_helper'

describe Student do
  describe 'valadations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :grade}
  end
  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end
end
