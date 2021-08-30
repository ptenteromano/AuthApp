require 'rails_helper'

describe HomeController, type: :controller do
  describe '#welcome' do
    it 'renders the root route' do
      get :welcome

      expect(response).to render_template(:welcome)
    end
  end
end
