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

  def categ
    @category = Category.find(params[:search])
  end
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
