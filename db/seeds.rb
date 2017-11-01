# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Role.create(name:'admin')
User.create!(first_name:'admin', last_name: 'admin', password:'admin@1234', email:'admin@gmail.com', role_id:1, secret_code_id:1)