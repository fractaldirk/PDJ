require 'test_helper'

class WallPostTest < ActionMailer::TestCase
  test "title" do
    mail = WallPost.title
    assert_equal "Title", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
