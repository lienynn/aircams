class CamerasController < ApplicationController
  def index
    @cameras = Camera.all
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def edit
    @camera = Camera.find(params[:id])
  end

  def update
    @camera = Camera.find(params[:id])

    if @camera.update(camera_params)
      redirect_to camera_path(@camera)
    else
      render :edit
    end
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy

    redirect_to my_cameras_path
  end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @user = current_user
    @camera.user = @user

    if @camera.save
      redirect_to camera_path(@camera)
    else
      render :new
    end
  end

  def my_cameras
    @cameras = Camera.where(user: current_user)

  end

  private

  def camera_params
    params.require(:camera).permit(:model, :address, :price_per_day, :details, :photo)
  end
end
