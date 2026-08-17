class Admin::CategoriesController < ApplicationController
  before_action(:require_authentication)

  def index
    @categories = Category.all()
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params())

    if @category.save()
      redirect_to(admin_categories_path)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
