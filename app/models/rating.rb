class Rating < ActiveRecord::Base
	belongs_to :ratable, polymorphic: true
	belongs_to :user

end
