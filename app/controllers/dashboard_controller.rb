class DashboardController < ApplicationController
	before_filter :authenticate_user!
  def index
  	load_perm_scope(current_user)
  end
  private
	  def load_perm_scope(user)
	  	if user.has_role? :admin
	  		@role = "Admin"
	  		@a = Account.all
	  		@b = Bank.all
	  		@u = User.all.where.not(id: user.id)
	  	else
	  		@role = "User"
	  	end
	  end
end
