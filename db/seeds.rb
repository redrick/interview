# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(name: 'Name', surname: 'Surname', email: 'email@example.com', phone: '0123456789')
user.tasks << Task.new(title: 'Title', description: 'Description')
