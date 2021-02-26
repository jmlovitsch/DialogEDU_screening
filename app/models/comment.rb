class Comment < ApplicationRecord
  belongs_to :article

  # validates the presence of comment' content
  validates :content, presence: true

#   set the default for the pagination limits
  paginates_per 25
  max_paginates_per 100

  def self.comments_by_article(article_id)
   return Article.find(article_id).comments
    end

end
