# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {name: 'Administrador', legal_number: '123450-k',email: 'admin@email.cl', password: 'admin', password_confirmation: 'admin'},
  {name: 'Usuario prueba 1', legal_number: '123451-k',email: 'user01@email.cl', password: 'iwill2020', password_confirmation: 'iwill2020'},
  {name: 'Usuario prueba 2', legal_number: '123452-k',email: 'user02@email.cl', password: 'iwill2020', password_confirmation: 'iwill2020'},
])

User.first.add_role :admin