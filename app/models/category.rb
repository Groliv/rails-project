class Category < ActiveRecord::Base
	has_ancestry
	has_many :products

	def to_s
		name
	end

	def self.arrange_as_array(options={}, hash=nil)                                                                                                                                                            
		hash ||= arrange(options)
		arr = []
		puts hash
		hash.each do |node, children|
			arr << node
			arr += arrange_as_array(options, children) unless children.nil?
		end
		puts arr
    	arr
	end

	def name_for_selects
		"#{'-' * depth} #{name}"
	end

	def possible_parents
		parents = Category.arrange_as_array(:order => 'name')
		return new_record? ? parents : parents - subtree
	end

end
