class CalendarController < ApplicationController
  def show
  	@date = params[:date] ? Date.parse(params[:date]) : Date.today
    @articles = Article.all
    @user = current_user
    #@users = User.all
  end
end
