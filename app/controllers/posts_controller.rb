class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    set_post!
    @post.category = params[:category]
    @post.content = params[:content]
    @post.title = params[:title]
    if @post.valid? 
        @post.save
        redirect_to post_path(@post)
    else 
      render :edit 
    end 
  end 


  
  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
