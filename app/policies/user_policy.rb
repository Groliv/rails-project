class UserPolicy < ApplicationPolicy
	attr_reader :userp, :userm

	def initialize(userp, userm)
		@userp = userp
		@userm = userm
	end

	def giveRight?
		@userp.admin?
	end

	def update?
    	@userp.present?
  	end

  	def delete?
    	@userp.present? || @userp.admin?
  	end
end
