class Product < ActiveRecord::Base
	belongs_to :user
    belongs_to :category
	has_many :ratings, as: :ratable, dependent: :destroy


	def avgrate
        @average = 0
		@ratings = Rating.where({'ratable_id': self.id, 'ratable_type': self.class})
        if @ratings.count == 0
            return "No rated"
        else
    	   @ratings.each do |rating|
    	   @average += rating.score
    	   end
    	   @average =  @average.to_f/@ratings.count
           return @average
        end
  	end

end
