require 'package_parser/package'

class SyncPackages
  def self.sync(limit = 50)
    PackageParser::Package.list(limit).each do |pkg|
      Package.find_or_create_by(name: pkg["Package"], version: pkg["Version"])
    end
  end
end
