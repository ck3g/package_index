require 'rails_helper'

RSpec.describe SyncPackages, type: :service do
  describe ".sync" do
    it "stores only missing packages into database" do
      create :package, name: "abc", version: "2.1"

      expect { described_class.sync(3) }.to change(Package, :count).by 2
    end

    context "when package has all required attributes" do
      it "saves all required attributes" do
        described_class.sync(1)
        attrs = Package.last.attributes.except("id", "created_at", "updated_at")

        expect(attrs).to eq(
          "name" => "A3",
          "version" => "1.0.0",
          "published_at" => DateTime.parse("2015-08-16 23:05:52"),
          "title" => "Accurate, Adaptable, and Accessible Error Metrics for Predictive Models",
          "description" => "Supplies tools for tabulating and analyzing the results of predictive models. The methods employed are applicable to virtually any predictive model and make comparisons between different methodologies straightforward.",
          "authors" => "Scott Fortmann-Roe",
          "maintainers" => "Scott Fortmann-Roe <scottfr@berkeley.edu>"
        )
      end
    end

    context "when package has no details" do
      it "saves only name nad version" do
        allow_any_instance_of(PackageParser::Package)
          .to receive(:details)
          .and_return({})

        described_class.sync(1)

        attrs = Package.last.attributes.except("id", "created_at", "updated_at")

        expect(attrs).to eq(
          "name" => "A3",
          "version" => "1.0.0",
          "published_at" => nil,
          "title" => nil,
          "description" => nil,
          "authors" => nil,
          "maintainers" => nil
        )
      end
    end
  end
end
