require 'rails_helper'

RSpec.describe Admin::BookingsController, type: :controller do
  context 'GET #index' do
    it 'should render admin index page' do
      get :index

      expect(response.status).to eq(200)
      expect(response).to render_template :index
    end
  end
end