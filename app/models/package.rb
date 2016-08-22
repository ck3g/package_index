class Package < ApplicationRecord
  validates :name, presence: true
  validates :version, presence: true, uniqueness: { scope: :name }

  def url
    PackageParser::Package.new(name, version).url
  end
end
