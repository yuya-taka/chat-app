class MessagesController < ApplicationController
  def index
    @rooms = Room.all
    #↑本当はログインユーザーが持っている部屋のみ表示したい。
    @room = Room.find(params[:room_id])
    @message = Message.new
  end

  def create
    #@message = @room
    #やろう。
    @room = Room.find(params[:room_id])
    #メッセージを作成する際に、どの部屋の情報かを@roomに代入する。
    @message = @room.messages.new(message_params)
    #新規のメッセージを作成する。その時に、privateメソッドを呼び出して、引き継ぐ値を指定する。
    if @message.save #メッセージをDBに保存する。
      redirect_to room_messages_path(@room)
      #元居た部屋のページに遷移する
    else
      render :index, status: :unprocessable_entity
      #元のページに戻りつつ、エラーがあったことを表示する。
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
    #メッセージのテーブルに情報を保存する際、:contentのカラム情報のみ保存される。
    #現在はユーザーと投稿を紐づけるのみなので、マージはこの記述で問題なし。
  end

end
