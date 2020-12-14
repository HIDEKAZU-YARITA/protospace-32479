class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id)
    else
      @comments = Comment.where(prototype: @prototype.id)
      render "prototypes/show"
    end
  end

  private

  def comment_params
    params.permit(:text).merge(user_id: current_user.id).merge(prototype_id: @prototype.id)
  end

end
