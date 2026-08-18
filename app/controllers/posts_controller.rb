class PostsController < ApplicationController
  # MYTODO - check that edit has Current.User find(posts) so a user cannot edit the post of another user
  before_action :require_authentication, except: %i[index show]

  def index
    @posts = Post.published.order(created_at: :desc)
  end

  def show
    @post = Post.published.find(params[:id])
  end

  def new
    @post = Post.new()
    @categories = Category.all()
    @tags = Tag.all()
  end

  def create
    @post = Current.user.posts.build(post_params())
    @post.status = :published
    if @post.save()
      redirect_to(@post, notice: "Post was created")
    else
      @categories = Category.all()
      @tags = Tag.all()
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @post = Current.user.posts.find(params[:id])
    @categories = Category.all()
    @tags = Tag.all()
  end

  def update
    @post = Current.user.posts.find(params[:id])

    if @post.update(post_params())
      redirect_to(@post)
    else
      @categories = Category.all()
      @tags = Tag.all()
      render(:edit, status: :unprocessable_entity)
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, tag_ids: [])
  end
end
