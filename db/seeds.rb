
require 'faker'

10.times do
    Comment.create(content: Faker::Lorem.sentences(number: 5, supplemental: true), article_id: Article.create(title: Faker::Lorem.words(number: 4), body: Faker::Lorem.paragraphs(number: 20) ).id )

end
