require 'rails_helper'

RSpec.describe SyncPackages, type: :service do
  describe ".sync" do
    it "stores only missing packages into database" do
      create :package, name: "abc", version: "2.1"

      expect { described_class.sync(3) }.to change(Package, :count).by 2
    end
  end
end
