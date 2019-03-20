require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'attributes of a student' do
  #   it 'has a name' do
  #     testname = 'Ella'
  #     student = Student.create(name: testname)
  #     expect(student.name).to eq(testname)
  #   end

  it { should respond_to :name }
  it { should respond_to :gpa }
  it { should respond_to :student_number }
  end

  describe 'Validations' do
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :name }
    it { should validate_presence_of :student_number }
    it { should validate_presence_of :gpa }
    it { should validate_numericality_of :student_number }
    #student_number >=0 ,= 10000

    it 'has a gpa lower bound' do
      should validate_numericality of (:gpa).
      is_greater_than_or_equal_to(0)
    end

    it 'has a gpa higher bound' do
      should validate_numercality_of(:gpa).
      is_less_than_or_equal_to(10000)
    end
  end

  describe "uniqueness" do
    Student.create!(name: 'ella', student_number: 123, gpa: 345)
    subject { Student.new(name: 'ella', student_number: 123, gpa: 345) }
    it { should validate_uniqueness_of(:name) }
  end
  #refactor above using factory bot.create!!!!

  describe "numericality" do
    before(:each) do
      student = FactoryBot.create(:student)
    end

    it { should validate_numericality_of(student.gpa) }
    it { should validate_numericality_of(student.student_number) }
  end
end
