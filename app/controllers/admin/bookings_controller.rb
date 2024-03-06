class Admin::BookingsController < ApplicationController
  def index
    @bookings = Booking.all.order(created_at: :desc)
  end
end