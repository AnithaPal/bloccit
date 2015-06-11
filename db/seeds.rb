require 'faker'

#create posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph)
  
end
posts = Post.all

#create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph)

end 

#create advertisments
50.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.characters(6),
    price: Faker::Commerce.price)

end 

puts "Seed finished"
puts "#{Post.count} posts are created"
puts "#{Comment.count} comments are created"
puts "#{Advertisement.count} advertisements are created"

require 'faker'
 
 