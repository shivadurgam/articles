class AddCommentToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :article, index: true
    add_foreign_key :articles, :articles
  end
end
