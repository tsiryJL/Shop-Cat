Item.destroy_all

12.times do |index|
	item = Item.create(
		title: Faker::Creature::Cat.name,
		# title: Faker::Lorem.sentence(word_count: 2),
		description: Faker::Creature::Cat.breed,
		price: Faker::Number.between(from: 100, to: 800),
		image_url: "chat#{index}.jpg"
	)
end

print("Seed Fait");