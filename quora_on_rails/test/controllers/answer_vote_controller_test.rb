require 'test_helper'

class AnswerVoteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get answer_vote_index_url
    assert_response :success
  end

end
