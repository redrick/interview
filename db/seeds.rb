# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

print 'Cleaning up the db: '
[User, Task].map(&:delete_all)
print "Done.\n"

print 'Loading users: '
{
  # admins
  admin: [
    { name: 'Joe', surname: 'Doe', email: 'joe@example.com', password: 'password', phone: '123456789' }
  ],
  # managers
  manager: [
    { name: 'Jane', surname: 'Doe', email: 'jane@example.com', password: 'password', phone: '987654321' }
  ]
}.each do |key, records|
  klass = key.to_s.classify.constantize
  records.each do |rec|
    klass.create!(rec)
  end
end
print "Done.\n"

print 'Adding tasks: '
users = User.all
(1..10).each do |i|
  Task.create(task: "Task ##{i}", user: users.sample, done_at: (rand(10)>5) ? Time.now : nil)
end
print "Done\n"
