class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
	def new
		
	end
	def create
		
	end
	def edit
		
	end
	def update
		
	end
	def destroy
		
	end

end
