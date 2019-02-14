3.times do |topic|
  Topic.create!(title: "Topic #{topic}")
end

puts '3 topics created'

10.times do |blog|
  Blog.create!(
    title: "My blog post #{blog}",
    body: 'blog body',
    topic_id: Topic.last.id
  )
end

puts '10 blogs created'

5.times do |skill|
  Skill.create!(
    title: "skill #{skill}",
    percent_utilized: (skill + 1) * 10
  )
end

puts '5 skills created'

9.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio}",
    subtitle: 'Ruby on Rails',
    body: 'Portfolio body',
    main_image: 'https://via.placeholder.com/600x400',
    thumb_image: 'https://via.placeholder.com/350x200'
  )
end

1.times do |portfolio|
  Portfolio.create!(
      title: "Portfolio title: #{portfolio}",
      subtitle: 'Angular',
      body: 'Portfolio body',
      main_image: 'https://via.placeholder.com/600x400',
      thumb_image: 'https://via.placeholder.com/350x200'
  )
end

puts '9 portfolio created'
