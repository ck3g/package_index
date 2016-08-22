class Package < ApplicationRecord
  has_many :package_maintainers, dependent: :destroy
  # Prefixed with p_ to avoid conflicts with existing "maintainers" field
  # during transition to Maintainer model
  has_many :p_maintainers, through: :package_maintainers, class_name: "Maintainer", source: :package

  validates :name, presence: true
  validates :version, presence: true, uniqueness: { scope: :name }

  def url
    PackageParser::Package.new(name, version).url
  end
end
