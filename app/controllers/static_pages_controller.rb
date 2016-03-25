class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		redirect_to "/home"
  	end
  end
end
