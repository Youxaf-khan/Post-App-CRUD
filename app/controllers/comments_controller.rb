class CommentsController < ApplicationController
  before_action :find_post, only: [:update,:create]
  before_action :find_comment, only: [:destroy,:edit,:update]
  def create
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def edit

  end

  def update
   if @comment.update(comment_params)
    redirect_to @post
   else
    render 'comments/edit'
   end
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end
