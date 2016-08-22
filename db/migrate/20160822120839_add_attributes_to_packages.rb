class AddAttributesToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :packages, :published_at, :datetime
    add_column :packages, :title, :string
    add_column :packages, :description, :string
    add_column :packages, :authors, :string
    add_column :packages, :maintainers, :string
  end
end
