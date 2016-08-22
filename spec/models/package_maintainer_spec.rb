require 'rails_helper'

RSpec.describe PackageMaintainer, type: :model do
  it "has a valid factory" do
    expect(create :package_maintainer).to be_valid
  end

  describe ".associations" do
    it { is_expected.to belong_to :package }
    it { is_expected.to belong_to :maintainer }
  end

  describe ".validations" do
    context "when valid" do
      subject { create :package_maintainer }
      it { is_expected.to validate_presence_of :package }
      it { is_expected.to validate_presence_of :maintainer }
    end
  end
end
