require 'net/http'
require 'uri'

require 'rubygems/package'
require 'zlib'
require 'open-uri'

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

    def details
      description_file = extract_description_file_from_archive(open(url))
      return {} unless description_file

      Dcf.parse(description_file.read).first
    end

    def url
      "#{REPOSITOTY_DIR}#{package}_#{version}.#{FILE_EXT}"
    end

    private

    attr_reader :package, :version

    def description_file_name
      "#{package}/#{DESCRIPTION_FILE_NAME}"
    end

    def extract_description_file_from_archive(source)
      return unless source.is_a? Tempfile

      tar_extract = Gem::Package::TarReader.new(Zlib::GzipReader.open(source))
      description_file = tar_extract.detect do |entry|
        entry.full_name == description_file_name
      end
      tar_extract.close

      description_file
    end
  end
end
