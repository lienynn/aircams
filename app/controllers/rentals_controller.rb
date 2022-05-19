class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
    @camera = @rental.camera
  end

  def new
    @camera = Camera.find(params[:camera_id])
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @camera = Camera.find(params[:camera_id])
    @rental.camera = @camera
    @rental.user = current_user

    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @camera = @rental.camera
    @rental.destroy

    redirect_to rentals_path
  end

  def accepted!
    @rental = Rental.find(params[:rental_id])
    @camera = @rental.camera
    @rental.status = 1
    @rental.save
    @color = "green"

    render :show
  end

  def declined!
    @rental = Rental.find(params[:rental_id])
    @camera = @rental.camera
    @rental.status = 2
    @rental.save
    @color = "red"

    render :show
  end

  def my_owner_rentals
    @my_owner_rentals = current_user.owner_rentals
  end

  def my_camera_rentals
    @camera = Camera.find(params[:id])
    @rentals = @camera.rentals
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :status)
  end
end
