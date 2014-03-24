class AccountsController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource :only => [:index, :show, :new]
	def new
		unless current_user.has_role? :admin
			@bank = Bank.all.where(user_id: current_user.id)
		else
			@bank = Bank.all
		end
	end
	def create
		@a = Bank.find_by_id(params[:account][:bank_id])
		@account = @a.accounts.build(account_params)

		if @account.save
			flash[:notice] = "Account created!"
			redirect_to root_path
		else
			flash[:alert] = "Error occurred!"
			render 'new'
		end
	end
	def edit
		@account = Account.find(params[:id])
	end
	def update
		@account = Account.find(params[:id])
		if @account.update_attributes(account_params)
			flash[:notice] = "Account updated"
			redirect_to @account
		else
			render 'edit'
		end
	end
	def destroy
		Account.find(params[:id]).destroy
    flash[:notice] = "Account deleted."
    redirect_to root_url		
	end

	private
		def account_params
			params.require(:account).permit!
		end
end
