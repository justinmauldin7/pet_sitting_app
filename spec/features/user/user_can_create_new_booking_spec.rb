require 'rails_helper'

describe "as an user" do
  describe "visiting the booking new page" do
      let(:valid_booking_params) do
        { first_name: 'John',
          last_name: 'Smith',
          animal_name: 'Rufus',
          animal_type: 'dog',
          hours_requested: 2,
          date_of_service: {
                              year: '2024',
                              month: 'March',
                              day: '11'
                            }
        }
      end
    
      it "can create a new booking" do
        expect {
                  visit new_booking_path
    
                  fill_in(:booking_first_name, with: valid_booking_params[:first_name])
                  fill_in(:booking_last_name, with: valid_booking_params[:last_name])
                  fill_in(:booking_animal_name, with: valid_booking_params[:animal_name])
    
                  select(valid_booking_params[:animal_type], from: 'booking_animal_type')
                  select(valid_booking_params[:hours_requested], from: 'booking_hours_requested')
    
                  select(valid_booking_params[:date_of_service][:year], from: 'booking_date_of_service_1i')
                  select(valid_booking_params[:date_of_service][:month], from: 'booking_date_of_service_2i')
                  select(valid_booking_params[:date_of_service][:day], from: 'booking_date_of_service_3i')
    
                  click_on "Submit Booking"
                }.to change { Booking.count }.by(1)
    
        expect(current_path).to eq(new_booking_path)
        expect(page).to have_content("Booking record successfully created.")
      end
    
      it "DOES NOT create a new booking if all fields are not filled in" do
        expect {
                  visit new_booking_path
    
                  # skipping filing in the 'booking_first_name' field so the creation will fail.
                  fill_in(:booking_last_name, with: valid_booking_params[:last_name])
                  fill_in(:booking_animal_name, with: valid_booking_params[:animal_name])
    
                  select(valid_booking_params[:animal_type], from: 'booking_animal_type')
                  select(valid_booking_params[:hours_requested], from: 'booking_hours_requested')
    
                  select(valid_booking_params[:date_of_service][:year], from: 'booking_date_of_service_1i')
                  select(valid_booking_params[:date_of_service][:month], from: 'booking_date_of_service_2i')
                  select(valid_booking_params[:date_of_service][:day], from: 'booking_date_of_service_3i')
    
                  click_on "Submit Booking"
                }.to change { Booking.count }.by(0)
    
        expect(page).to have_content("ERROR: Booking NOT created.")
      end
  end
end