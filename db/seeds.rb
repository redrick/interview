# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

UserAdmin.create(email: 'admin@tm.com', password: 'qwertyuiop', first_name: 'admin', last_name: 'admin')
Category.create(name: 'Daily', description: 'Some daily todo tasks')
Category.create(name: 'Weekly', description: 'Some weekly todo tasks')