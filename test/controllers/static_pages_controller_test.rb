require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

	def setup
		@user = users(:michael)
		@base_title = "Weight Tracker"
	end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@base_title}"
    assert_template 'static_pages/home'
  end

  test "home should redirect if logged in" do
  	log_in_as(@user)
  	get :home
  	assert_redirected_to '/home'
  end

end
