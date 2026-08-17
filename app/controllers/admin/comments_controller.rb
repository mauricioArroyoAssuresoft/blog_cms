class Admin::CommentsController < ApplicationController
  before_action(:require_authentication)

  def index
    @comments = Comment.includes(:post, :user).order(created_at: :desc)
  end
end
