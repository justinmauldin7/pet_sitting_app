require 'rails_helper'

RSpec.describe PricingEngine do
  let!(:dog_booking) do 
    Booking.create( first_name: 'John',
                    last_name: 'Smith',
                    animal_name: 'Rufus',
                    animal_type: 'dog',
                    hours_requested: 2,
                    date_of_service: '03-04-2024')
  end

  let!(:cat_booking) do 
    Booking.create( first_name: 'Jane',
                    last_name: 'Doe',
                    animal_name: 'mittens',
                    animal_type: 'cat',
                    hours_requested: 6,
                    date_of_service: '03-07-2024')
  end

  let(:base_charge) { 20 }
  let(:dog_per_hour_rate) { 10 }
  let(:cat_per_hour_rate) { 5 }

  it "can calculate the cost of service for a dog" do
    pricing_engine = PricingEngine.new(dog_booking)
    cost_of_service = pricing_engine.get_cost_of_service

    expected_cost_of_service = base_charge + (dog_per_hour_rate * dog_booking.hours_requested)

    expect(cost_of_service).to be_an(Integer)
    expect(cost_of_service).to eq(expected_cost_of_service)

    expect(cost_of_service).not_to be_an(String)
    expect(cost_of_service).not_to eq(expected_cost_of_service.to_s)
  end

  it "can calculate the cost of service for a cat" do
    pricing_engine = PricingEngine.new(cat_booking)
    cost_of_service = pricing_engine.get_cost_of_service

    expected_cost_of_service = base_charge + (cat_per_hour_rate * cat_booking.hours_requested)

    expect(cost_of_service).to be_an(Integer)
    expect(cost_of_service).to eq(expected_cost_of_service)

    expect(cost_of_service).not_to be_an(String)
    expect(cost_of_service).not_to eq(expected_cost_of_service.to_s)
  end
end