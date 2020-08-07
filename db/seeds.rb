# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {name: 'Usuario prueba 1', email: 'user01@email.cl', password: 'iwill2020', password_confirmation: 'iwill2020'},
  {name: 'Usuario prueba 2', email: 'user02@email.cl', password: 'iwill2020', password_confirmation: 'iwill2020'},
])