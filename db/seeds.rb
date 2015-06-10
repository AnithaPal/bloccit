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

uniq_post = Post.find_or_create_by!(title: "This is my unique title", body: "This is my unique body")
uniq_comment = Comment.find_or_create_by!(post: uniq_post, body: "This is my unique comment")
puts "Seed finished"
puts "#{Post.count} posts are created"
puts "#{Comment.count} comments are created"
puts uniq_post
puts uniq_comment

require 'faker'
 
 