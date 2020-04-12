10.times do |post|
	Post.create!(
		title: "my post #{post}",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dolor sit amet consectetur adipiscing elit. Auctor elit sed vulputate mi sit amet mauris. Sit amet justo donec enim diam. Lobortis feugiat vivamus at augue eget arcu."
		)
end

puts "10 posts created"

5.times do |skill|
	Skill.create!(
		title: "Rails #{skill}",
		percent: 15
		)
end

puts "5 skills created"


9.times do |portfolio|
	Portfolio.create!(
		title: "My portfolio #{portfolio}",
		subtitle: "great service",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		main_img: "https://place-hold.it/600x300",
		thumb_img: "https://place-hold.it/300x200"

		)
end

puts "9 portfolios created"

