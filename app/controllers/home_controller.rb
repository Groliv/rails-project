class HomeController < ApplicationController

	def index
	@products = Product.all
	@products.order(avgrate: :desc)
	end
end
