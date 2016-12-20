class PostsController < ApplicationController
  # before_action :set_post, only: [:new, :index, :show, :edit, :update, :destroy]
  def new
  	@post = Post.new
  end

  def index
    @post = Post.all
  end
  def edit
  end

  def show
    @post=Post.find(params[:id])
  end

  def destroy
     @post=Post.find(params[:id])
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'post was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  def create
  	@post = Post.new(permit_post)
  	if @post.save
  		flash[:success] = "success!"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = @post.errors.full_messages
  		redirect_to new_post_path

  	end
  	
  end

  private
def set_post
   @post = Post.find(params[:id])
end
  def permit_post
  	params.require(:post).permit(:image, :description)
  	
  end
end
