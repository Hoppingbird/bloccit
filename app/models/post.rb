class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	
	#default_scope { order('create_at DESC') }
	
	#scope :order_by_title, -> { order('title ASC') }
	
	scope :ordered_by_reverse_created_at, -> { order('created_at DESC') }
	  

end
