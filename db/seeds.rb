# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vendor = Vendor.create({
  name: 'McDonalds',
  description: 'Fast Food Restaurant',
  address: 'Midvalley City',
  company_registration:  '121415-D'
})

vendor_user = User.create({
    first_name: 'Kian Yang',
    last_name: 'Low',
    address: 'Subang Jaya',
    email: 'kianyang@gmail.com',
    password: 'kianyang',
    password_confirmation: 'kianyang',
    vendor: vendor
})
vendor_user.add_role :vendor

consumer = User.create({
    first_name: 'John',
    last_name: 'Doe',
    address: 'California',
    email: 'john.doe@gmail.com',
    password: 'johndoe',
    password_confirmation: 'johndoe'
})
consumer.add_role :consumer

['Food and Beverage', 'Grocery', 'Entertainment'].each do |category|
    Category.create(name: category)
end

food_and_beverage_category = Category.where(name: 'Food and Beverage').first

[
  { name: 'Cheese Burger', price: 10.00, sku: '4151', vendor: vendor, category: food_and_beverage_category},
  { name: 'Big Mac', price: 15.00, sku: '4151', vendor: vendor, category: food_and_beverage_category },
  { name: 'French fries', price: 5.00, sku: '4151', vendor: vendor, category: food_and_beverage_category },
].each do |product|
  Product.create(product)
end


