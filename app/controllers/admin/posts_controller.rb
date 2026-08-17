class Admin::PostsController < ApplicationController
  before_action(:require_authentication)
  before_action(:set_post, only: %i[edit update destroy])

  def index
    @posts = Post.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @post.update(post_params())
      redirect_to(admin_posts_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @post.destroy()
    redirect_to(admin_posts_path)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params().require(:post).permit(:title, :content, :status, :category_id, tag_ids: [])
  end
end
