require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  context 'GET #new' do
    it 'should render new page' do
      get :new

      expect(response).to render_template :new
    end
  end
end