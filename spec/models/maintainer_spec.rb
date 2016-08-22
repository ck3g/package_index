require 'rails_helper'

RSpec.describe Maintainer, type: :model do
  it "has a valid factory" do
    expect(create :maintainer).to be_valid
  end

  describe ".associations" do
    it { is_expected.to have_many(:package_maintainers).dependent(:destroy) }
    it { is_expected.to have_many(:maintained_packages) }
  end

  describe ".validations" do
    subject { create :maintainer }
    it { is_expected.to validate_presence_of :name }
  end
end
