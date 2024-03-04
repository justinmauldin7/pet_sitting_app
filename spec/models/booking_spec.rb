require 'rails_helper'

RSpec.describe Booking, type: :model do
  context 'validation tests' do 
    it 'ensures presence of first name' do
      booking = Booking.new(last_name: 'Smith', animal_name: 'Rufus', animal_type: 'dog', hours_requested: 2, date_of_service: '03-04-2024').save
      
      expect(booking).to eq(false)
    end

    it 'ensures presence of last name' do
      booking = Booking.new(first_name: 'John', animal_name: 'Rufus', animal_type: 'dog', hours_requested: 2, date_of_service: '03-04-2024').save
      
      expect(booking).to eq(false)
    end

    it 'ensures presence of animal name' do
      booking = Booking.new(first_name: 'John', last_name: 'Smith', animal_type: 'dog', hours_requested: 2, date_of_service: '03-04-2024').save
      
      expect(booking).to eq(false)
    end

    it 'ensures presence of animal type' do
      booking = Booking.new(first_name: 'John', last_name: 'Smith', animal_name: 'Rufus', hours_requested: 2, date_of_service: '03-04-2024').save
      
      expect(booking).to eq(false)
    end

    it 'ensures presence of hours requested' do
      booking = Booking.new(first_name: 'John', last_name: 'Smith', animal_name: 'Rufus', animal_type: 'dog', date_of_service: '03-04-2024').save
      
      expect(booking).to eq(false)
    end

    it 'ensures presence of date of service' do
      booking = Booking.new(first_name: 'John', last_name: 'Smith', animal_name: 'Rufus', animal_type: 'dog', hours_requested: 2).save
      
      expect(booking).to eq(false)
    end

    it 'should save successfully' do 
      booking = Booking.new(first_name: 'John', last_name: 'Smith', animal_name: 'Rufus', animal_type: 'dog', hours_requested: 2, date_of_service: '03-04-2024').save
      
      expect(booking).to eq(true)
    end
  end
end
