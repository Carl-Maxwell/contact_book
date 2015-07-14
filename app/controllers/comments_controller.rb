class CommentsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      render json: user.comments
    elsif params[:contact_id]
      contact = Contact.find(params[:contact_id])
      render json: contact.comments
    end
  end

  def create
    if params[:user_id]
      user = User.find(params[:user_id])
      comment = user.comments.build(comment_params)
    elsif params[:contact_id]
      contact = Contact.find(params[:contact_id])
      comment = contact.comments.build(comment_params)
    else
      fail
    end
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end


  #destroy

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
