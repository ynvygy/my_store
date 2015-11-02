module ApplicationHelper
	def number_to_euro(amount)
	  number_to_currency(amount,:unit=>'€')
	end
	def itemsnumber
  		current_user.cart.line_items.count
  	end
  	def cartpage
  		if @cart 
  			return @cart
  		else
  			return current_user.cart
  		end
  	end
end
