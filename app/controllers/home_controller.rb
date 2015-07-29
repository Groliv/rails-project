class HomeController < ApplicationController

	def index
	@products = Product.all
	puts @products.inspect
	@products = @products.sort { | p1, p2|
		av1 = p1.avgrate == "No rated" ? 0 : p1.avgrate
		av2 = p2.avgrate == "No rated" ? 0 : p2.avgrate
		av2 <=> av1
	}
	end
end
