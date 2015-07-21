class Addresse < ActiveRecord::Base
	belongs_to :user
	enum typeAddresse: { sending: 0, posting: 1, billing: 2 }	
end
