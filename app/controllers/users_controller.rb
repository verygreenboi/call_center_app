class UsersController < ApplicationController
	before_filter :authenticate_user!
  load_and_authorize_resource :only => [:index, :show, :new]

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
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			# Handle Update
			flash[:notice] = "User updated"
			redirect_to @user
		else
			render 'edit'
		end
	end
	def destroy
		User.find(params[:id]).destroy
    flash[:notice] = "User deleted."
    redirect_to root_url
	end

	private
		def user_params
			params.require(:user).permit!
		end

end
