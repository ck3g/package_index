require 'package_parser/package'

class SyncPackages
  def initialize(limit)
    @limit = limit
  end

  def self.sync(limit = 50)
    new(limit).sync
  end

  def sync
    PackageParser::Package.list(limit).each do |pkg|
      create_package_from_raw_data pkg
    end
  end

  private

  attr_reader :limit

  def create_package_from_raw_data(pkg)
    attrs = { name: pkg["Package"], version: pkg["Version"] }
    details = PackageParser::Package.new(pkg["Package"], pkg["Version"]).details

    Package.find_or_create_by(attrs) do |package|
      package.published_at = DateTime.parse(details["Date/Publication"])
      package.title = details["Title"]
      package.description = details["Description"]
      package.authors = details["Author"]
      package.maintainers = details["Maintainer"]
    end
  end
end
