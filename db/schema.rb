# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160822130642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "maintainers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_maintainers", force: :cascade do |t|
    t.integer  "package_id",    null: false
    t.integer  "maintainer_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["maintainer_id"], name: "index_package_maintainers_on_maintainer_id", using: :btree
    t.index ["package_id"], name: "index_package_maintainers_on_package_id", using: :btree
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "version",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "published_at"
    t.string   "title"
    t.string   "description"
    t.string   "authors"
    t.string   "maintainers"
  end

  add_foreign_key "package_maintainers", "maintainers"
  add_foreign_key "package_maintainers", "packages"
end
