class CommentsController < ApplicationController

  def create
  end

  def destroy
  end 

end

private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end
