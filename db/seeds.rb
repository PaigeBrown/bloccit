require 'random_data'

 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 100.times do
   Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolve: false
    )
 end
 
 puts "#{Post.count}"
 Post.find_or_create_by(title: "The Unique One", body: "Uniqueness all over here", )
 puts "#{Post.count}"

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"
