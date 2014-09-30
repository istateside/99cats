class CatRentalRequestsController < ApplicationController
  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cats_url
    end
  end

  def approve
    @cat_rental_request.approve!
  end
  def deny
    @cat_rental_request.deny!
  end

  private
  def cat_rental_request_params
      params.require(:@cat_rental_request).permit(
      :cat_id, :start_date, :end_date, :status
      )
  end
end