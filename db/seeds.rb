# Clean DB

User.delete_all
Task.delete_all
Category.delete_all


# Create Users

admin = Admin.create!(
  name: "Janko",
  surname: "Hrasko",
  email: "janko@hrasko.sk",
  phone: "+420 123 456",
)

manager = Manager.create!(
  name: "Marienka",
  surname: "Vesela",
  email: "marienka@vesela.sk",
  phone: "+420 555 555",
)


# Create Categories

sport = Category.create!(
  name: "sport",
)

kitchen = Category.create!(
  name: "kitchen",
)


# Create Tasks

Task.create!(
  user: admin,
  category: sport,
  text: "play rugby",
)

Task.create!(
  user: manager,
  category: kitchen,
  text: "prepare food",
)
