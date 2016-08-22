class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :name, null: false
      t.string :version, null: false

      t.timestamps
    end
  end
end
