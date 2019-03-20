FactoryBot.define do
  factory :student, class: Student do
    name { "Bob" }
    student_number { " 5 "}
    gpa { 344 }

    school
  end
end
