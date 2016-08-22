class PackagesController < ApplicationController
  def index
    @packages = Package.order(:name).limit(100)
  end

  def show
    @package = Package.find params[:id]
  end
end
