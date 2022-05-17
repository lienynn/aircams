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

  # def update
  #   @camera = Camera.find(params[:id])
  #   @camera.update(camera_params)

  #   redirect_to camera_path(@camera)
  # end

  # def destroy
  #   @camera = Camera.find(params[:id])
  #   @camera.destroy

  #   redirect_to cameras_path
  # end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @user = current_user
    @camera.user = @user
    @camera.save

    redirect_to camera_path(@camera)
  end

  private

  def camera_params
    params.require(:camera).permit(:model, :zip_code, :price_per_day, :details)
  end

end
