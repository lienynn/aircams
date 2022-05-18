class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  # def show
  # end

  def new
  end

  def create
  end

  def destroy
  end
end
