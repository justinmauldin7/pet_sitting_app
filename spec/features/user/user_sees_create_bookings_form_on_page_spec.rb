require 'rails_helper'

describe "as an user" do
  describe "visiting the booking new page" do
    it "shows the create booking form with fields to create a new booking" do
      visit new_booking_path
  
      expect(page).to have_content("New Booking")
  
      expect(page).to have_content("First Name")
      expect(page).to have_selector("input#booking_first_name")
  
      expect(page).to have_content("Last Name")
      expect(page).to have_selector("input#booking_last_name")
  
      expect(page).to have_content("Animal Name")
      expect(page).to have_selector("input#booking_animal_name")
  
      expect(page).to have_content("Animal Type")
      expect(page).to have_select('Animal Type',
                                    options: ['cat', 'dog']
                                  )
  
      expect(page).to have_content("Hours Requested")
      expect(page).to have_select('Hours Requested',
                                    options: ['2', '3', '4', '5', '6', '7', '8']
                                  )
  
      expect(page).to have_content("Date of Service")
      expect(page).to have_selector("select#booking_date_of_service_1i")
      expect(page).to have_selector("select#booking_date_of_service_2i")
      expect(page).to have_selector("select#booking_date_of_service_3i")
  
      expect(page).to have_button("Submit Booking")
    end
  end
end