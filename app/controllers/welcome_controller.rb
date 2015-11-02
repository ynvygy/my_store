class WelcomeController < ApplicationController
	def index 
		@categories = Category.all
		@products = Product.all
		@category = Category.all
	end
end