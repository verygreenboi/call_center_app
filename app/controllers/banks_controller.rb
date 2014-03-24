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
			render 'new'
		end
		
	end
	def edit
		@bank = Bank.find(params[:id])
	end
	def update
		@bank = Bank.find(params[:id])
		if @bank.update_attributes(bank_params)
			# Handle Update
			flash[:notice] = "Bank updated"
			redirect_to @bank
		else
			render 'edit'
		end
	end
	def destroy
		Bank.find(params[:id]).destroy
    flash[:notice] = "Bank deleted."
    redirect_to root_url
	end

	private
		def bank_params
			params.require(:bank).permit!
		end
end
