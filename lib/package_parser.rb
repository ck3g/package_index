require "package_parser/package"

module PackageParser
  REPOSITOTY_DIR = "https://cran.r-project.org/src/contrib/".freeze
  PACKAGES_URI = "#{REPOSITOTY_DIR}PACKAGES".freeze
  FILE_EXT = "tar.gz".freeze
end
