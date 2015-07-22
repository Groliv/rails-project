class ProductPolicy < ApplicationPolicy
	attr_reader :user, :product

	def initialize(user, product)
		@user = user
		@product = product
	end

	def update?
    	@user.present? && @product.user == @user 
  	end

  	def create?
    	@user.present? && @product.user == @user 
  	end

  	def delete?
    	@user.present? && @product.user == @user 
  	end

end
