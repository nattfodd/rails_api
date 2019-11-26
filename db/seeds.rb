# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

departments = Department.insert_all([
  { name: 'Marketing' },
  { name: 'Development' },
  { name: 'Business Analysis' },
  { name: 'Statistics' },
  { name: 'Research' },
  { name: 'Customer Success' },
], returning: [:id])

employees_data = departments.each_with_object([]) do |dp, memo|
  memo.concat(Array.new(rand(0..10)).map {
    { name: FFaker::Name.name, department_id: dp.fetch('id') }
  })
end
Employee.insert_all(employees_data)
