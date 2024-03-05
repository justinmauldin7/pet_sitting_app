require 'rails_helper'

describe "user sees create bookings form on the bookings new page" do
  it "shows create booking fields" do
    visit new_booking_path

    expect(page).to have_content("New Booking")

    expect(page).to have_content("First Name")
    expect(page).to have_selector("input#first_name")

    expect(page).to have_content("Last Name")
    expect(page).to have_selector("input#last_name")

    expect(page).to have_content("Animal Name")
    expect(page).to have_selector("input#animal_name")

    expect(page).to have_content("Animal Type")
    expect(page).to have_select('Animal Type',
                                  options: ['cat', 'dog']
                                )

    expect(page).to have_content("Hours Requested")
    expect(page).to have_select('Hours Requested',
                                  options: ['2', '3', '4', '5', '6', '7', '8']
                                )

    expect(page).to have_content("Date of Service")
    expect(page).to have_selector("select#_date_of_service_1i")
    expect(page).to have_selector("select#_date_of_service_2i")
    expect(page).to have_selector("select#_date_of_service_3i")

    expect(page).to have_button("Submit Booking")
  end
end