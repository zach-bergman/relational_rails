# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Guitar.destroy_all
Store.destroy_all

@store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
@store_2 = Store.create!(name: "Guitar World", ongoing_sale: false, annual_revenue: 80000)
@store_3 = Store.create!(name: "Happy Strings", ongoing_sale: true, annual_revenue: 50000)

@guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)
@guitar_2 = @store_1.guitars.create!(name: "Ibanez RG470DX", used: true, price: 500)
@guitar_3 = @store_2.guitars.create!(name: "Epiphone Les Paul", used: false, price: 680)
@guitar_4 = @store_2.guitars.create!(name: "Schecter Omen", used: true, price: 500)