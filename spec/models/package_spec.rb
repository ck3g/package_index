require 'rails_helper'

RSpec.describe Package, type: :model do
  it "has a valid factory" do
    expect(create :package).to be_valid
  end

  describe '.validations' do
    context "when valid" do
      subject { create :package }
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_presence_of :version }
      it { is_expected.to validate_uniqueness_of(:version).scoped_to(:name) }
    end
  end
end
