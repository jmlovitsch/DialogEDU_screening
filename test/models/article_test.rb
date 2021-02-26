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

  test "should delete comments of articles" do
    article = articles(:three)
    comment = comments(:five)
    article.save
    comment.save
    count = Comment.count
    article.destroy

    assert_equal Comment.count, count-1, "comment count minus one"
  end


  test "should assert comments not equal after article delete" do
    article = articles(:three)
    comment = comments(:five)
    article.save
    comment.save
    count = Comment.count
    article.destroy

    assert_not_equal Comment.count, count, "comment count minus one"
  end



end
