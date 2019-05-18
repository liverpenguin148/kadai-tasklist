# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'exam1', email: 'exam1@exam', password_digest:'exam')

(2..50).each do |number|
  User.create(name: 'exam'+ number.to_s, email: 'exam' + number.to_s + '@exam', password_digest:'exam')
end