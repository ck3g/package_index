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

  describe "#details" do
    subject do
      described_class.new(package, version).details
    end

    context "when fetch is not successfull" do
      let(:package) { "ACA" }
      let(:version) { "1.0" }

      it "returns no details" do
        is_expected.to eq({})
      end
    end

    context "when fetch is successfull" do
      let(:package) { "A3" }
      let(:version) { "1.0.0" }

      it "fetches all the information about the package" do
        is_expected.to eq(
          "Package" => "A3",
          "Version" => "1.0.0",
          "Depends" => "R (>= 2.15.0), xtable, pbapply",
          "Author" => "Scott Fortmann-Roe",
          "Date" => "2015-08-15",
          "Date/Publication" => "2015-08-16 23:05:52",
          "Depends" => "R (>= 2.15.0), xtable, pbapply",
          "Description" => "Supplies tools for tabulating and analyzing the results of predictive models. The methods employed are applicable to virtually any predictive model and make comparisons between different methodologies straightforward.",
          "License" => "GPL (>= 2)",
          "Maintainer" => "Scott Fortmann-Roe <scottfr@berkeley.edu>",
          "NeedsCompilation" => "no",
          "Packaged" => "2015-08-16 14:17:33 UTC; scott",
          "Repository" => "CRAN",
          "Suggests" => "randomForest, e1071",
          "Title" => "Accurate, Adaptable, and Accessible Error Metrics for Predictive Models",
          "Type" => "Package",
        )
      end
    end
  end
end
