class CreatePackageMaintainers < ActiveRecord::Migration[5.0]
  def change
    create_table :package_maintainers do |t|
      t.references :package, foreign_key: true, null: false
      t.references :maintainer, foreign_key: true, null: false

      t.timestamps
    end
  end
end
