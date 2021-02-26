class Article < ApplicationRecord
    has_many :comments, dependent: :destroy

    # validating title and body presence and title length may not be lower than 10 characters
    validates :title, presence: true
    validates :title, length: {minimum: 10}
    validates :body, presence: true

    #   set the default for the pagination limits
    paginates_per 5
    max_paginates_per 25

    def self.search_articles(search)
        @newArray = self.select do |article|
            article.title.include?(search) || article.body.include?(search)
        end


        @newArray
    end



end
