class BanksController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource :only => [:index, :show, :new]
	def index
		
	end
	def show
		@bank = Bank.find(params[:id])
	end
	def new
		
	end
	def create
		@u = User.find_by_id(params[:bank][:user_id])

		@bank = @u.banks.build(bank_params)

		if @bank.save
			flash[:notice] = "Bank created!"
			redirect_to root_path
		else
			flash[:alert] = "Error occurred!"
			redirect_to root_path
		end
		
	end
	def edit
		
	end
	def update
		@bank = Bank.update_attributes(bank_params)
	end
	def destroy
		
	end

	private
		def bank_params
			params.require(:bank).permit!
		end
end
