class CalendarController < ApplicationController
  def show
  	@date = params[:date] ? Date.parse(params[:date]) : Date.today
    @articles = Article.all
    #@users = User.all
  end
end
