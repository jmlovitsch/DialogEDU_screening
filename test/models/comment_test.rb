require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save comment without article_id" do
    comment = comments(:three)
    assert_not comment.save, "Saved the comment without article_id"
  end

  test "should save comment with article_id" do
    comment = comments(:one)
    assert comment.save, "Saved the comment"
  end

  test "should not update comment" do
    comment = comments(:one)
    assert_not comment.update(article_id: "zero"), "Updated the comment"
  end

  test "should not save comment with no content" do
    comment = comments(:four)
    assert_not comment.save, "Saved the comment with no content"
  end


end
