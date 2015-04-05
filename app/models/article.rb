class Article < ActiveRecord::Base

	has_many :comments
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	

end
