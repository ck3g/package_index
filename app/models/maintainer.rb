class Maintainer < ApplicationRecord
  has_many :package_maintainers, dependent: :destroy
  has_many :maintained_packages, through: :package_maintainers,
    class_name: "Package", source: :maintainer

  validates :name, presence: true
end
