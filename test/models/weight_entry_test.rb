require 'test_helper'

class WeightEntryTest < ActiveSupport::TestCase

	def setup
		@user = users(:michael)
		@weight_entry = @user.weight_entries.build(value: 180)
	end

	test "should be valid" do
		assert @weight_entry.valid?
	end

	test "user id should be present" do
		@weight_entry.user_id = nil
		assert_not @weight_entry.valid?
	end
	
	test "value should be present" do
		@weight_entry.value = nil
		assert_not @weight_entry.valid?
	end

	test "value should be at most 3 digits" do
		@weight_entry.value = 9999
		assert_not @weight_entry.valid?
	end

	test "order should be most recent first" do
		assert_equal weight_entries(:most_recent), WeightEntry.first
	end
end
