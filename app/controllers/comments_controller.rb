class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)


    redirect_to item_path(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to item_path(@comment.item_id)
  end

private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id,item_id:params[:id])
  end
end


