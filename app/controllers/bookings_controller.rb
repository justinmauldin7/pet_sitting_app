class BookingsController < ApplicationController
  def new
     @booking = Booking.new
  end

  def create 

  end

  private
  
  def booking_params
    params.require(:booking).permit(:first_name,
                                    :last_name,
                                    :animal_name,
                                    :animal_type,
                                    :hours_requested,
                                    :date_of_service)
  end
end
