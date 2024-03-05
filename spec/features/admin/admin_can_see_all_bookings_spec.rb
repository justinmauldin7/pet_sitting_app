require 'rails_helper'

describe "as an admin" do
  describe "visitng the admin booking index page" do
    let!(:booking_1) do 
      Booking.create( first_name: 'John',
                      last_name: 'Smith',
                      animal_name: 'Rufus',
                      animal_type: 'dog',
                      hours_requested: 2,
                      date_of_service: '03-04-2024')
    end

    let!(:booking_2) do 
      Booking.create( first_name: 'Jane',
                      last_name: 'Doe',
                      animal_name: 'mittens',
                      animal_type: 'cat',
                      hours_requested: 4,
                      date_of_service: '03-07-2024')
    end

    let!(:booking_3) do
      Booking.create( first_name: 'Sam',
                      last_name: 'Doe',
                      animal_name: 'wiskers',
                      animal_type: 'cat',
                      hours_requested: 7,
                      date_of_service: '03-11-2024')
    end 

    let!(:booking_4) do 
      Booking.create( first_name: 'Sally',
                      last_name: 'Smith',
                      animal_name: 'rascal',
                      animal_type: 'dog',
                      hours_requested: 3,
                      date_of_service: '03-05-2024')
    end

    it "shows all booking records" do 
      visit admin_bookings_path

      within("#booking-#{booking_1.id}") do
        expect(page).to have_content(booking_1.first_name)
        expect(page).to have_content(booking_1.last_name)
        expect(page).to have_content(booking_1.animal_name)
        expect(page).to have_content(booking_1.hours_requested)
        expect(page).to have_content(booking_1.date_of_service)
      end

      within("#booking-#{booking_2.id}") do
        expect(page).to have_content(booking_2.first_name)
        expect(page).to have_content(booking_2.last_name)
        expect(page).to have_content(booking_2.animal_name)
        expect(page).to have_content(booking_2.hours_requested)
        expect(page).to have_content(booking_2.date_of_service)
      end

      within("#booking-#{booking_3.id}") do
        expect(page).to have_content(booking_3.first_name)
        expect(page).to have_content(booking_3.last_name)
        expect(page).to have_content(booking_3.animal_name)
        expect(page).to have_content(booking_3.hours_requested)
        expect(page).to have_content(booking_3.date_of_service)
      end

      within("#booking-#{booking_4.id}") do
        expect(page).to have_content(booking_4.first_name)
        expect(page).to have_content(booking_4.last_name)
        expect(page).to have_content(booking_4.animal_name)
        expect(page).to have_content(booking_4.hours_requested)
        expect(page).to have_content(booking_4.date_of_service)
      end
    end

    it "shows all booking records with newest record showing first" do 
      visit admin_bookings_path

      expect(booking_4.animal_name).to appear_before(booking_3.animal_name)
      expect(booking_3.animal_name).to appear_before(booking_2.animal_name)
      expect(booking_2.animal_name).to appear_before(booking_1.animal_name)
      
      expect(page).to have_css("#booking-#{booking_4.id} ~ #booking-#{booking_3.id}")
      expect(page).to have_css("#booking-#{booking_3.id} ~ #booking-#{booking_2.id}")
      expect(page).to have_css("#booking-#{booking_2.id} ~ #booking-#{booking_1.id}")
    end
  end
end