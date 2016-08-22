require 'package_parser'

RSpec.describe PackageParser::Package do
  describe ".list" do
    subject { described_class.urls(2) }

    it "returns list of package urls" do
      is_expected.to eq [
        "https://cran.r-project.org/src/contrib/A3_1.0.0.tar.gz",
        "https://cran.r-project.org/src/contrib/abbyyR_0.5.0.tar.gz"
      ]
    end
  end

  describe ".list" do
    subject { described_class.list(2) }

    it "fetches the list of the packages" do
      is_expected.to eq [
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
