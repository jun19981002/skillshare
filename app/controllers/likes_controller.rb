class Public::LikesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:comment_id])
    @like = Like.create(user_id: current_user.id, post_id: post.id, comment_id: comment.id)
    redirect_to skill_path(comment.post)
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:comment_id])
    Like.find_by(user_id: current_user.id, post_id: post.id, comment_id: comment.id).destroy
    redirect_to skill_path_path(comment.post)
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

end
