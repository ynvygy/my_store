class ProductsController < ApplicationController
	helper_method :sort_column, :sort_direction
	before_action :set_product, only:[:show]
	def index
		@category = Category.find(params[:category_id])
		if params[:search]
			@products = @category.products.search(params[:search]).paginate(:per_page=>10, :page=>params[:page])
		else
			@products = @category.products.paginate(:per_page=>10, :page=>params[:page]).order(sort_column + " " + sort_direction)
		end
	end
	
	def show
	end

	private

    def set_product
      @product = Product.find(params[:id])
    end
    def sort_column
    	Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  	end
  
  	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end