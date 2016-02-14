# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless TypesOfVehicle.any?
  puts "Dodaje pojazdy ..."
  trading_types = [
    { name: "Samochód osobowy" },
    { name: "Samochód ciężarowy" },
    { name: "Ciągnik" },
    { name: "Przyczepa" }
  ]

  TypesOfVehicle.create( trading_types )
end

unless TypesOfEvent.any?
  puts "Dodaje zdarzenia ..."
  trading_types = [
    { name: "Naprawa" },
    { name: "Ubezpieczenie" },
    { name: "Przegląd techniczny" },
    { name: "Inne" }
  ]

  TypesOfEvent.create( trading_types )
end