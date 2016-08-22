class Package < ApplicationRecord
  validates :name, presence: true
  validates :version, presence: true, uniqueness: { scope: :name }
end
