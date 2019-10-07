class CommentsController < ApplicationController
  http_basic_authenticate_with name: "sam", password: "sam", only: :destroy

  def new
    @article = Article.find(params[:id])
    @comments = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
     if @comment.destroy
       redirect_to article_path(@article)
     end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
