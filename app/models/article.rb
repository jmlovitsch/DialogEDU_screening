class Article < ApplicationRecord
    has_many :comments

    validates :title, presence: true
    validates :title, length: {minimum: 10}
    validates :body, presence: true

end
