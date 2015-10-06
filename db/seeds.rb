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
  { name: 'Lukas',  surname: 'Lazarcik',  email: 'l.l@gmail.com', phone: '132', type: 'Admin' },
  { name: 'Fero',   surname: 'Baranec',   email: 'f.b@gmail.com', phone: '99',  type: 'Manager' }
]

User.create!(users)

tasks = [
  { description: 'Finish interview', order: 1 },
  { description: 'Go buy groceries', order: 2, completed_at: 1.hour.ago },
]

lukas = User.find_by_email 'l.l@gmail.com'

lukas.tasks.create!(tasks)
