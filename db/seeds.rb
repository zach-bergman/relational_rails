# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

@store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
@store_2 = Store.create!(name: "Guitar World", ongoing_sale: false, annual_revenue: 80000)
@store_3 = Store.create!(name: "Happy Strings", ongoing_sale: true, annual_revenue: 50000)

# Guitars.destroy
