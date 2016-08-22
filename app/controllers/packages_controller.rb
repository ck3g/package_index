class PackagesController < ApplicationController
  def index
    @packages = Package.order(:name).limit(100)
  end
end
