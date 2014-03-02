module ErrorMessages
	def form_errors_count obj
		if obj.errors.any?
			ec = pluralize(obj.errors.count, "error")
			errors = "<div id='error_explanation'>The form contains #{ec}.</div>"
			raw(errors)
		end
	end
end