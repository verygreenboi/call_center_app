class CallsController < ApplicationController
	def index
		@bank = Bank.find_by_phone_number(params[:Called])
		respond_to do |format|
			format.xml
		end		
	end
end
