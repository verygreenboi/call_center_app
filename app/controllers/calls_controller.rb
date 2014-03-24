class CallsController < ApplicationController
	
	def index
		# Initial call request
		if params[:Called]																										#Check Called params value exists
			@bank = Bank.find_by_phone_number(params[:Called])
			if @bank.blank?
				@worked = false
				redirect_to new_call_path(:format => params[:format], :message => "failed", :step => "error")
				# render xml: '<Say voice="woman">Sorry your request failed.</Say>'
			else
				@worked = true
				session[:bank] = @bank.id
				
				respond_to do |format|
					format.xml
				end	
			end	
		else
			@worked = false
		end
	end

	def new
		@bank = Bank.find(session[:bank])
		@partial = params[:step].to_s
		respond_to do |format|
			format.xml
		end
	end

	def verifyacc
		@a = Account.find_by_account_number(params[:Digits])
		if @a.blank?
			redirect_to new_call_path(:format => params[:format], :step => "noacc")
		else
			session[:account_id] = @a.id
			session[:account_pin] = @a.pin
			session[:account_ver] = @a.verify
			session[:account_bal] = @a.balance
			session[:account_cur] = @a.currency
			redirect_to new_call_path(:format => params[:format], :step => "pin")
		end
	end

	def verifypin
		if params[:Digits]
			if params[:Digits] == session[:account_pin]
				redirect_to new_call_path(:format => params[:format], :step => "verify")
			else
				redirect_to new_call_path(:format => params[:format], :step => "pinfail")
			end
		else
			redirect_to new_call_path(:format => params[:format], :step => "error")
		end
	end

	def verifyver
		if params[:Digits]
			if params[:Digits] == session[:account_ver]
				redirect_to calls_acc_path(:format => params[:format])
			else
				redirect_to new_call_path(:format => params[:format], :step => "verfail")
			end
		else
			redirect_to new_call_path(:format => params[:format], :step => "error")
		end
	end

	def acc
		@bal = session[:account_bal] 
		@cur = session[:account_cur]
	end

	def routing

		if params[:step] == "routing"
			
			@digits = params[:Digits].to_i
			case @digits
			when 1
				redirect_to new_call_path(:format => params[:format], :step => "getacc")
			when 2
				redirect_to new_call_path(:format => params[:format], :step => "transfer")
			when 3
				redirect_to new_call_path(:format => params[:format], :step => "redirect")
			else					
				redirect_to new_call_path(:format => params[:format], :step => "error")
			end

		end
		
	end

end
