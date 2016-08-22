require 'net/http'
require 'uri'

require 'dcf'

module PackageParser
  class Package
    def initialize(package, version)
      @package = package
      @version = version
    end

    def self.urls(limit = 50)
      list(limit).map do |pkg|
        new(pkg["Package"], pkg["Version"]).url
      end
    end

    def self.list(limit = 50)
      response = Net::HTTP.get URI(PACKAGES_URI)
      response.split("\n\n").lazy.take(limit).to_a.map do |pkg|
        Dcf.parse(pkg).first
      end
    end

    def url
      "#{REPOSITOTY_DIR}#{package}_#{version}.#{FILE_EXT}"
    end

    private

    attr_reader :package, :version
  end
end
