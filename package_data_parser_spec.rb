require 'pry'

require 'net/http'
require 'uri'

require 'dcf'

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



RSpec.describe Package do
  describe ".list" do
    it "returns list of package urls" do
      expect(Package.urls(2)).to eq [
        "https://cran.r-project.org/src/contrib/A3_1.0.0.tar.gz",
        "https://cran.r-project.org/src/contrib/abbyyR_0.5.0.tar.gz"
      ]
    end
  end

  describe ".packages" do
    it "fetches the list of the packages" do
      expect(Package.list(2)).to eq [
        {
          "Package" => "A3",
          "Version" => "1.0.0",
          "Depends" => "R (>= 2.15.0), xtable, pbapply",
          "Suggests" => "randomForest, e1071",
          "License" => "GPL (>= 2)",
          "NeedsCompilation" => "no"
        },
        {
          "Package" => "abbyyR",
          "Version" => "0.5.0",
          "Depends" => "R (>= 3.2.0)",
          "Imports" => "httr, XML, curl, readr, progress",
          "Suggests" => "testthat, rmarkdown, knitr (>= 1.11)",
          "License" => "MIT + file LICENSE",
          "NeedsCompilation" => "no"
        }
      ]
    end
  end
end
