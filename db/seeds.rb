# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Task.delete_all

users = [
  { name: 'Lukas',  surname: 'Lazarcik',  email: 'l.l@gmail.com',
    password: 'lukaslukas', phone: '0907123123', type: 'Admin' },
  { name: 'Fero',   surname: 'Baranec',   email: 'f.b@gmail.com',
    password: 'lukaslukas', phone: '0908321321', type: 'Manager' }
]

User.create!(users)

tasks = [
  { description: 'Finish interview' },
  { description: 'Go buy groceries', completed_at: 1.hour.ago },
]

lukas = User.find_by_email 'l.l@gmail.com'

lukas.tasks.create!(tasks)
