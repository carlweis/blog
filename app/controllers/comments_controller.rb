class CommentsController < ApplicationController
  before_action :set_post, :only => [:create, :destroy]

  def create
    if @post.comments.create(comment_params)
      redirect_to @post,
                  notice: 'Comment was successfully created.'
    else
      redirect_to @post,
                  alert: 'Error creating comment.'
    end
  end

  def destroy
    @post.comments.find(params[:id]).destroy
    redirect_to @post,
                notice: 'Comment has been removed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body, :email)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
