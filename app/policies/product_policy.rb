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
    	@user.present? 
  	end

    def minbidded
      @user.present? && @user != @product.user
    end

    def immediat
      @user.present? && @user != @product.user
    end

  	def destroy?
    	@user.present? && (@product.user == @user || @user.admin? )
  	end
end
