class ProductsController < ApplicationController
	before_action :set_product, only:[:show]
	def index
		@category = Category.find(params[:category_id])
		if params[:search]
			@products = @category.products.search(params[:search]).paginate(:per_page=>10, :page=>params[:page])
		else
			@products = @category.products.paginate(:per_page=>10, :page=>params[:page])
		end
	end
	
	def show
	end

	private

    def set_product
      @product = Product.find(params[:id])
    end
end