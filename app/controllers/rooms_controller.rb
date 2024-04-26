class RoomsController < ApplicationController
  def index

  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    room = Room.find(params[:id])
    #現在のルームidを取得。
    room.destroy
    #部屋のレコードをDBから削除
    redirect_to root_path
    #ルートパスへリダイレクト
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
