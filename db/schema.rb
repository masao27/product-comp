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

ActiveRecord::Schema.define(version: 20190618062620) do

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "prodname",    limit: 65535
    t.text     "description", limit: 65535
    t.text     "storename",   limit: 65535
    t.text     "storeurl",    limit: 65535
    t.text     "imageurl",    limit: 65535
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
