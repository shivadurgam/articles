class StaticPagesController < ApplicationController
  def home
    @articles = Article.search(params[:search])
    if params[:search].present?
      if @articles.empty?
        @search = "No records found for  '#{params[:search]}'"
      else 
        @search = "Your query- '#{params[:search]}' yielded #{@articles.count} results."
      end 
    end   
  	if !user_signed_in?
    flash[:success] = "Please signup/signin in to post an article"
    end 
  end

  def account
  end
end
