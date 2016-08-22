require 'net/http'
require 'uri'

require 'dcf'

module PackageParser
  class Package
    REPOSITOTY_DIR = "https://cran.r-project.org/src/contrib/".freeze
    PACKAGES_URI = "#{REPOSITOTY_DIR}PACKAGES".freeze
    FILE_EXT = "tar.gz".freeze

    def self.urls(limit = 50)
      list(limit).map do |pkg|
        "#{REPOSITOTY_DIR}#{pkg["Package"]}_#{pkg["Version"]}.#{FILE_EXT}"
      end
    end

    def self.list(limit = 50)
      response = Net::HTTP.get URI(PACKAGES_URI)
      response.split("\n\n").lazy.take(limit).to_a.map do |pkg|
        Dcf.parse(pkg).first
      end
    end
  end
end
