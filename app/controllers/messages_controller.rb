class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find_by(id: params[:user])
      @message = current_user.messages.new
  end

  def create
    @recipient = User.find_by(id: params[:user])
    conversation= current_user.send_message(@recipient, params[:body], params[:subject])
    flash[:success] = "Message has been sent!"
    redirect_to conversations_path(box: "sent")

  end
end
