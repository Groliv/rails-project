class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		   :recoverable, :rememberable, :trackable, :validatable

 	has_many :addresses, dependent: :destroy
 	has_many :products, dependent: :destroy
 	accepts_nested_attributes_for :addresses, allow_destroy: true
end
