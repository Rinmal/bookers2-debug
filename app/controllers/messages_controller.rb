class MessagesController < ApplicationController

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @messages = Message.create(params.require(:message).permit(:user_id, :talk, :room_id).merge(user_id: current_user.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました"
    end
    redirect_back(fallback_location: root_path)
  end
end
