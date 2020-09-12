Item.destroy_all

5.times do |index|
	item = Item.create(
		title: Faker::Creature::Cat.name,
		# title: Faker::Lorem.sentence(word_count: 2),
		description: Faker::Creature::Cat.breed,
		price: Faker::Number.between(from: 15, to: 100),
		image_url: "chat#{index}.jpg"
	)
end

print("Seed Fait");