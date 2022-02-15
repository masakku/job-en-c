class MattersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_matter, only: [:show, :edit, :update, :destroy]

  def index
    @matters = Matter.all.order(created_at: 'DESC')
  end

  def new
    @matter = Matter.new
  end

  def create
    @matter = Matter.new(matter_params)
    if @matter.valid?
      @matter.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @matter.update(matter_params)
    if @matter.update(matter_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @matter.user_id == current_user.id && @matter.destroy
  end

  private

  def matter_params
    params.require(:matter).permit(:title, :info, :genre_id, :scheduled_id, :detail, :price,
                                   :image).merge(user_id: current_user.id)
  end

  def set_matter
    @matter = Matter.find(params[:id])
  end
end
