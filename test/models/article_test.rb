require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  article = Article.new
  article.body = "This is the body"



  test "should not save article without title" do
    assert_not article.save, "Saved the article without a title"
  end

  article.title = "onlynine9"

  test "should not save article without a ten character title" do
    assert_not article.save, "Saved the article without a 10 character title"
  end


end
