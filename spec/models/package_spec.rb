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

  describe "#url" do
    subject { package.url }

    let!(:package) { create :package, name: "abc", version: "1.2.3" }

    it "returns url to the package" do
      is_expected.to eq "https://cran.r-project.org/src/contrib/abc_1.2.3.tar.gz"
    end
  end
end
