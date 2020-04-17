# 3.times do |topic|
# 	Topic.create!(
# 		title: "Topic #{topic}"
# 		)
# end

# puts "3 topics created"

# 10.times do |post|
# 	Post.create!(
# 		title: "my post #{post}",
# 		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dolor sit amet consectetur adipiscing elit. Auctor elit sed vulputate mi sit amet mauris. Sit amet justo donec enim diam. Lobortis feugiat vivamus at augue eget arcu.",
# 		topic_id: Topic.last.id
# 		)
# end

# puts "10 posts created"

# 5.times do |skill|
# 	Skill.create!(
# 		title: "Rails #{skill}",
# 		percent: 15
# 		)
# end

# puts "5 skills created"


# 7.times do |portfolio|
# 	Portfolio.create!(
# 		title: "My portfolio #{portfolio}",
# 		subtitle: "Ruby on Rails",
# 		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
# 		main_img: "https://place-hold.it/600x300",
# 		thumb_img: "https://place-hold.it/300x200"
# 		)
# end

# 	2.times do |portfolio|
# 	Portfolio.create!(
# 		title: "My portfolio #{portfolio}",
# 		subtitle: "Angular",
# 		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
# 		main_img: "https://place-hold.it/600x300",
# 		thumb_img: "https://place-hold.it/300x200"
# 		)
# end

# puts "9 portfolios created"


3.times do |technology|
	Technology.create!(
		name: "Technology #{technology}",
		portfolio_id: Portfolio.last.id
		)
end

puts "3 technologies created"
