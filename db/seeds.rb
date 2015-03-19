require 'faker'

# Create Users
5.times do 
  user = User.new(
    name:        Faker::Name.name,
    email:       Faker::Internet.email,
    password:    Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
    title:       Faker::Lorem.sentence,
    user:        users.sample
  )
end
topics = Topic.all

# Create Bookmarks
30.times do
  Bookmark.create!(
    user:        users.sample,
    topic:       topics.sample,
    url:         Faker::Internet.url
  )
end
bookmarks = Bookmark.all

# Create a member
member = User.new(
  name:      'Member User',
  email:     'member@example.com',
  password:  'helloworld'
  )
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Bookmark.count} bookmarks created."