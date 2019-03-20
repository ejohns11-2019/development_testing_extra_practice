FactoryBot.define do
  factory :school,  class: School do
    name 'University of Utah'
    address '50 N Medical Dr SLC'
    principal 'Mr. Watts'
    capacity 12000
    private_school true
  end
end
