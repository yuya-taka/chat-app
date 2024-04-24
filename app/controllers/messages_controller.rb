class MessagesController < ApplicationController
  def index
    @rooms = Room.all
  end
end
