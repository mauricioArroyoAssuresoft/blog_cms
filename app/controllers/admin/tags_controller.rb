class Admin::TagsController < ApplicationController
  before_action(:require_authentication)

  def index
    @tags = Tag.all()
  end

  def new
    @tag = Tag.new()
  end

  def create
    @tag = Tag.new(tag_params())

    if @tag.save()
      redirect_to(admin_tags_path)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
