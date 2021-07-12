RSpec.describe Driver, type: :model do
  context 'create driver' do
    it 'ensures email presence' do
      is_expected.to validate_presence_of(:email)
    end
    # Associations tests
  end
end
