class Package < ApplicationRecord
  validates :name, presence: true
  validates :version, presence: true, uniqueness: { scope: :name }

  # TODO: extract into package presenter
  def url
    "#{PackageParser::REPOSITOTY_DIR}#{name}_#{version}.#{PackageParser::FILE_EXT}"
  end
end
