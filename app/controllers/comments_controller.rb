class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_param)
    redirect_to articles_path(@article)
  end
  def destroy
    @article = Article.find(params[:id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to articles_path(@article)
  end
  private
    def comment_param
      params.require(:comment).permit(:commenter, :body)
    end
end
