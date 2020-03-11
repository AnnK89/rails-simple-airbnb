class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
    @action = 'Create'
  end

  def create
    flat = Flat.new(flat_params)
    flat.save

    redirect_to flats_path
  end

  def edit
    @action = 'Edit'
  end

  def update
    @action = @_action_name
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :picture_url, :description, :number_of_guests, :price_per_night)
  end
end
