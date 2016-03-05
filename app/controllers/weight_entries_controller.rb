class WeightEntriesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		@weight_entry = current_user.weight_entries.build(weightentry_params)
		if @weight_entry.save
			flash[:success] = "Weight entry created!"
		end
		redirect_to current_user
	end

	def destroy
	end

	private
		def weightentry_params
			params.require(:weight_entry).permit(:value)
		end
end
