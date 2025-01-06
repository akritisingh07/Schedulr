class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]  # To require users to be logged in for certain actions

  # Display all posts
  def index
    @posts = Post.all
  end

  # Show a single post
  def show
    @post = Post.find(params[:id])
  end

  # Display the form to create a new post
  def new
    @post = current_user.posts.build
  end

  # Handle the creation of a new post
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  # Display the form to edit a post
  def edit
    @post = Post.find(params[:id])
  end

  # Handle updating the post
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  # Handle deleting a post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted."
  end

  private

  # Strong parameters to allow only the required fields for posts
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
