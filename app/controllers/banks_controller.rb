class BanksController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource
	def index
		
	end
	def show
		
	end
	def new
		
	end
	def create
		@u = User.find(params[:user_id])
		@bank = @u.banks.build(bank_params)

		if @bank.save
			flash[:success] = "Bank created!"
			redirect_to root_path
		end
		
	end
	def edit
		
	end
	def update
		
	end
	def destroy
		
	end

	private
		def bank_params
			params.require(:bank).permit!
		end
end
