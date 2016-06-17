300.times do
  q = Question.create title:      Faker::Company.bs,
                      body:       Faker::Hipster.paragraph,
                      view_count: rand(100)
  5.times { q.answers.create body: Faker::ChuckNorris.fact } if q.persisted?
end

# puts Cowsay.say "300 inputs done!!"

#
# 300.times do
#   User.create     first_name: Faker::Name.first_name,
#                   last_name:  Faker::Name.last_name,
#                   email:      Faker::Internet.email
#   5.times {q.answers.create body: Faker::ChuckNorris.fact} if q.persisted?
# end

['sports', 'Art', 'Cats', "tech", 'news'].each do |cat|
Category.create name: cat
end




puts Cowsay.say "300 inputs done!!"
