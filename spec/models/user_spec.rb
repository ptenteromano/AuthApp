require 'rails_helper'

describe User do
  context 'on initialize' do
    let(:user) { FactoryBot.create(:user) }

    it 'creates an instance of User' do
      expect(user).to be_instance_of(User)
    end

    it 'populates logged in and uuid' do
      expect(user.last_login_time).to be_instance_of(ActiveSupport::TimeWithZone)
      expect(user.uuid).to be_instance_of(String)
    end
  end

  context 'with an invalid email' do
    let(:user) { FactoryBot.build(:user, email: 1234) }

    it 'is invalid' do
      expect(user).not_to be_valid
      expect(user.errors[:email]).to eq(['Invalid email'])
    end
  end
end
