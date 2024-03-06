class BookingsController < ApplicationController
  def new
     @booking = Booking.new
  end

  def create 
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:message] = "Booking record successfully created."
      redirect_to new_booking_path
    else
      flash[:message] = "ERROR: Booking NOT created."
      render :new, status: :unprocessable_entity
    end
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
