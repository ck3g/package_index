require 'package_parser/package'

RSpec.describe PackageParser::Package do
  describe ".list" do
    it "returns list of package urls" do
      expect(described_class.urls(2)).to eq [
        "https://cran.r-project.org/src/contrib/A3_1.0.0.tar.gz",
        "https://cran.r-project.org/src/contrib/abbyyR_0.5.0.tar.gz"
      ]
    end
  end

  describe ".packages" do
    it "fetches the list of the packages" do
      expect(described_class.list(2)).to eq [
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
