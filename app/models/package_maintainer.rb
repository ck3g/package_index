class PackageMaintainer < ApplicationRecord
  belongs_to :package
  belongs_to :maintainer

  validates :package, :maintainer, presence: true
end
