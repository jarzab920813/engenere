class UsersController < ApplicationController
	load_and_authorize_resource

	before_filter :authenticate_user!

  def new
    @user = User.new
  end
  def show
    @user = User.find(current_user.id)
  end
  def index
     @user = User.find(current_user.id)
  end
  def create
  	 @user = User.new
	end

end
