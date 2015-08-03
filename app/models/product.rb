class Product < ActiveRecord::Base
	belongs_to	:user
	belongs_to	:category
	has_many	:ratings,	as: :ratable,	dependent: :destroy
	has_many	:biddings,  dependent: :destroy
	accepts_nested_attributes_for :biddings

	after_initialize do
  		if self.new_record?
    		# values will be available for new record forms.
    		self.purchased = false 
    		self.price = self.minbid
  		end
	end

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

	def autobid
		puts "self.minbid :" + self.minbid.to_s
	 	self.price = self.price + self.minbid
	end  

	def purchased?
		self.purchased = true
	end

	def prixmaxi
		if self.amount >= immediatprice || self.price >= immediatprice
			self.purchased?
		end
	end


end
