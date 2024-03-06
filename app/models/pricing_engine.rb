class PricingEngine
  BASE_CHARGE = 20 # this value is in dollars
  DOG_PER_HOUR_RATE = 10 # this value is in dollars
  CAT_PER_HOUR_RATE = 5 # this value is in dollars

  def initialize(booking)
    @booking = booking
  end

  def get_cost_of_service
    animal_type = @booking.animal_type
    hours_requested = @booking.hours_requested

    calculate_cost_of_service(animal_type, hours_requested)
  end

  private

  def calculate_cost_of_service(animal_type, hours_requested)
    if animal_type == "dog"
      BASE_CHARGE + (DOG_PER_HOUR_RATE * hours_requested)
    elsif animal_type == "cat"
      BASE_CHARGE + (CAT_PER_HOUR_RATE * hours_requested)
    end
  end
end