class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @camera = Camera.find(params[:camera_id])
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @camera = Camera.find(params[:camera_id])
    @user = User.find(current_user.id)
    @rental.camera = @camera
    @rental.user = @user
    @rental.save

    redirect_to rental_path(@rental)
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy

    redirect_to rentals_path
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
