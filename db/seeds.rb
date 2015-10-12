# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Task.delete_all
Category.delete_all
CategoriesTask.delete_all

users = [
  { name: 'Lukas',  surname: 'Lazarcik',  email: 'l.l@gmail.com',
    password: 'lukaslukas', phone: '0907123123', type: 'Admin' },
  { name: 'Fero',   surname: 'Baranec',   email: 'f.b@gmail.com',
    password: 'lukaslukas', phone: '0908321321', type: 'Manager' }
]
User.create!(users)
lukas = User.find_by_email 'l.l@gmail.com'

categories = [
  { name: 'personal' },
  { name: 'work' },
  { name: 'very much important' }
]
Category.create!(categories)

tasks = [
  { description: 'Finish interview' },
  { description: 'Go buy groceries', completed_at: 1.hour.ago },
]
lukas.tasks.create!(tasks)

work_task = Task.find_by_description('Finish interview')
work_task.categories_tasks.create!(category: Category.find_by_name('work'))
work_task.categories_tasks.create!(category: Category.find_by_name('very much important'))

personal_task = Task.find_by_description('Go buy groceries')
personal_task.categories_tasks.create!(category: Category.find_by_name('personal'))
