class BiddingPolicy < ApplicationPolicy
	attr_reader :user, :product, :bidding

	def initialize(product, bidding)
		@user = user
    	@bidding = bidding
	end

	def new?
    	@user.present? && @user != @bidding.product.user
  	end

  	def create?
    	@user.present? && @user != @bidding.product.user
  	end

end
