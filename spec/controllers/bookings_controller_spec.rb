require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  let(:valid_params) do
    { booking: { first_name: 'John',
                  last_name: 'Smith',
                  animal_name: 'Rufus',
                  animal_type: 'dog',
                  hours_requested: 2,
                  date_of_service: '03-04-2024' } 
    } 
  end

  let(:invalid_params) do 
    { booking: {  last_name: 'Smith',
                  animal_name: 'Rufus',
                  animal_type: 'dog',
                  hours_requested: 2,
                  date_of_service: '03-04-2024' } 
    } 
  end

  context 'GET #new' do
    it 'should render new page' do
      get :new

      expect(response).to render_template :new
    end
  end

  context "POST #create" do
    it "should create a booking with valid attributes" do
      expect { post :create, params: valid_params }.to change { Booking.count }.by(1)

      expect(response).to redirect_to bookings_path
    end

    it "should not create a booking with invalid attributes" do
      post :create, params: invalid_params

      expect(response.status).to eq(422)
      expect(response).to render_template :new
    end
  end
end