class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_comment
  respond_to :html
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.search(params[:search])
    if params[:search].present?
      if @articles.empty?
        @search = "No records found for  '#{params[:search]}'"
      else 
        @search = "Your query- '#{params[:search]}' yielded #{@articles.count} results."
      end 
    end 
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    #@comment = Comment.new
    @comment = @article.user.comments.build
    if !user_signed_in?
    flash[:alert] = "Please sign in to post a comment"
    end 

  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.create(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.'} 
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    redirect_to article_calendar_url, notice: 'Article was successfully destroyed.'
    
  end

  def article_calendar
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @articles = Article.all
    @user = current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :content)
    end

    def set_comment
      @art = Article.find_by(params[:article_id])
    end 

   
end
