class CommentsController < ApplicationController
  before_action(:require_authentication)

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments().build((comment_params()))
    @comment.user = Current.user

    if @comment.save()
      redirect_to(@post)
    else
      redirect_to(@post, alert: @comment.errors().full_messages().to_sentence())
    end
  end

  private

  def comment_params
    params().require(:comment).permit(:content)
  end
end
