class RatingPolicy < ApplicationPolicy
	attr_reader :user, :rating

	def initialize(user, rating)
		@user = user
		@rating = rating
	end

	def update?
    	@user.present? && @rating.user == @user 
  	end

  	def create?
    	@user.present? 
  	end

  	def delete?
    	@user.present? && (@rating.user == @user || @user.admin? )
  	end

end