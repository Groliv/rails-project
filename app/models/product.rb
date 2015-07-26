class Product < ActiveRecord::Base
	belongs_to :user
	has_many :ratings, as: :ratable, dependent: :destroy


	def avgrate
		@average = 0
		@ratings = Rating.where({'ratable_id': self.id, 'ratable_type': self.class})
    	@ratings.each do |rating|
    	  @average += rating.rate
    	end
    	@average =  @average.to_f/@ratings.count
    	return @average
  	end

end
