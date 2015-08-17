require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  def setup
    @micropost = microposts(:second_recent)
  end

  test "should redirect when logged in" do
    assert_no_difference 'Micropost.count' do
      post :create, micropost: {content: "Lorem Ipsum"}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in" do
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: @micropost
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:testuser))
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: micropost
    end
    assert_redirected_to root_url
  end
end
