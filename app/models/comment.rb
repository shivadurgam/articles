class Comment < ActiveRecord::Base
    belongs_to :article
    belongs_to :user
  	default_scope -> { order(created_at: :desc) }
  	validates :article_id, presence: true

end
