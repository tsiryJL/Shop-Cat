# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all

12.times do |index|
	item = Item.create(
		title: Faker::Creature::Cat.name,
		# title: Faker::Lorem.sentence(word_count: 2),
		description: Faker::Creature::Cat.breed,
		price: Faker::Number.between(from: 15, to: 100),
		image_url: "chat#{index}.jpg"
	)
end

3.times do |i|
	user = User.create(
		email: "csadmin#{i}@yopmail.com",
		password: "adminadmin",
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		description: Faker::Lorem.paragraph(sentence_count: 5)
	)
end
