puts("|- - - - - - - - - - Creando usuarios de prueba - - - - - - - - - -")
User.create([
  {name: 'Administrador', legal_number: '123450-k',email: 'admin@email.cl', password: 'admin', password_confirmation: 'admin'},
  {name: 'Usuario prueba 1', legal_number: '123451-k',email: 'user01@email.cl', password: 'iwill2020', password_confirmation: 'iwill2020'},
  {name: 'Usuario prueba 2', legal_number: '123452-k',email: 'user02@email.cl', password: 'iwill2020', password_confirmation: 'iwill2020'},
])

User.first.add_role :admin

puts("|- - - - - - - - - - Creando regiones y comunas - - - - - - - - - -")
data = JSON.parse(File.read("public/chile_comunas_regiones.json"))
country = Country.create(name: "Chile")

data.each do |item|
  region = Region.create(name: item["region"], country_id: country.id)
  
  item["comunas"].each do |commune|
    Commune.create(name: commune, region_id: region.id)
  end
end
