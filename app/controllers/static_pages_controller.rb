class StaticPagesController < ApplicationController
  def home
  	@articles = Article.all
  	if !user_signed_in?
    flash[:success] = "Please signup/signin in to post an article"
    end 
  end
end
