class Article < ActiveRecord::Base

	has_many :comments, dependent: :destroy
	belongs_to :user
	default_scope -> { order(created_at: :desc) }

	validates :name, :content, presence: true
	validates :user_id, presence: true

	def useremail
		article.user.email
	end


	def self.search(query)  
	    if query  
	      where('name LIKE ? OR content LIKE ?', "%#{query}%", "%#{query}%")  
	    else  
	      where(nil) 
	    end  
  	end
	

end
