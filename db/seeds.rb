# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
10.times do |blog|
  Blog.create!(
      title: "My blog post #{blog}",
      body: 'blog body'
  )
end

puts '10 blogs created'

5.times do |skill|
  Skill.create!(
      title: "skill #{skill}",
      percent_utilized: skill
  )
end

puts '5 skills created'

9.times do |portfolio|
  Portfolio.create!(
      title: "Portfolio title: #{portfolio}",
      subtitle: 'Portfolio subtitle',
      body: 'Portfolio body',
      main_image: 'https://via.placeholder.com/600x400',
      thumb_image: 'https://via.placeholder.com/350x200'
  )
end

puts '9 portfolio created'