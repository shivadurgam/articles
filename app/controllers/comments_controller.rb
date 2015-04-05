class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
 
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @article
    else 
      flash[:error] = @comment.errors.full_messages
      redirect_to @article
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :article_id)
    end
end
