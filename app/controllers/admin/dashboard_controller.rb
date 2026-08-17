class Admin::DashboardController < ApplicationController
  before_action(:require_authentication)

  def index
    @posts_count = Post.count()
    @drafts_count = Post.draft.count()
    @published_posts_count = Post.published.count()
    @comments_count = Comment.count()
    @users_count = User.count()
  end
end
