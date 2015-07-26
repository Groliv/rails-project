class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		   :recoverable, :rememberable, :trackable, :validatable

 	has_many :addresses, dependent: :destroy
 	has_many :products, dependent: :destroy
 	has_many :ratings, as: :ratable, dependent: :destroy
 	accepts_nested_attributes_for :addresses, allow_destroy: true


 	def admin?
    	admin == true
  	end


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
