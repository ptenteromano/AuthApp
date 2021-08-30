require 'rails_helper'

describe Admin do
  context 'on initialize' do
    let(:admin) { FactoryBot.create(:admin) }

    it 'inherits from User' do
      expect(admin.is_a?(User)).to be_truthy
      expect(admin).to be_instance_of(Admin)
    end

    it 'populates admin' do
      expect(admin.admin).to be(true)
    end

    context 'when admin is false' do
      let(:admin) { FactoryBot.build(:admin, admin: false) }

      it 'is invalid' do
        expect(admin).not_to be_valid
        expect(admin.errors[:admin]).to eq(['Must be true'])
      end
    end
  end
end
