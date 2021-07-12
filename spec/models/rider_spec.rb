RSpec.describe Rider, type: :model do
  context 'create rider' do
    it 'ensures email presence' do
      is_expected.to validate_presence_of(:email)
    end
    it 'ensures license_plate presence' do
      is_expected.to validate_presence_of(:license_plate)
    end
    # Associations tests
  end
end
