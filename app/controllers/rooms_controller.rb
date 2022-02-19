class RoomsController < ApplicationController

  def index

  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to rooms_path(@room)
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
    
     
    
    private
    def room_params
    params.permit(user_ids: [])
    end
end
