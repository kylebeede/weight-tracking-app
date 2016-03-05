require 'test_helper'

class WeightEntriesControllerTest < ActionController::TestCase
	
	def setup
		@weight_entry = weight_entries(:one)
	end

	test "should redirect create when not logged in" do
		assert_no_difference 'WeightEntry.count' do
			post :create, weight_entry: { value: 100 }
		end
		assert_redirected_to login_url
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'WeightEntry.count' do
			delete :destroy, id: @weight_entry
		end
		assert_redirected_to login_url
	end

end
