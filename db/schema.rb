# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150605064233) do

  create_table "addresses", force: :cascade do |t|
    t.text     "address",    limit: 65535
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zip",        limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "first_name",  limit: 255
    t.string   "middle_name", limit: 255
    t.string   "last_name",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "authors", ["last_name"], name: "index_authors_on_last_name", using: :btree

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "book_id",   limit: 4
    t.integer "author_id", limit: 4
  end

  add_index "authors_books", ["book_id", "author_id"], name: "index_authors_books_on_book_id_and_author_id", unique: true, using: :btree

  create_table "book_locations", force: :cascade do |t|
    t.integer  "book_id",           limit: 4
    t.integer  "library_branch_id", limit: 4
    t.integer  "num_copies",        limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "book_locations", ["book_id", "library_branch_id"], name: "index_book_locations_on_book_id_and_library_branch_id", unique: true, using: :btree
  add_index "book_locations", ["library_branch_id"], name: "index_book_locations_on_library_branch_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "isbn",         limit: 255
    t.string   "title",        limit: 255
    t.integer  "publisher_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "books", ["isbn"], name: "index_books_on_isbn", using: :btree
  add_index "books", ["publisher_id"], name: "index_books_on_publisher_id", using: :btree
  add_index "books", ["title"], name: "index_books_on_title", using: :btree

  create_table "borrowed_books", force: :cascade do |t|
    t.integer  "book_id",           limit: 4
    t.integer  "library_branch_id", limit: 4
    t.integer  "borrower_id",       limit: 4
    t.datetime "borrow_date"
    t.date     "due_date"
    t.boolean  "is_returned",       limit: 1
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "borrowed_books", ["book_id", "library_branch_id", "borrower_id"], name: "index_on_book_librarybranch_borrower", unique: true, using: :btree
  add_index "borrowed_books", ["borrower_id"], name: "index_borrowed_books_on_borrower_id", using: :btree
  add_index "borrowed_books", ["library_branch_id"], name: "index_borrowed_books_on_library_branch_id", using: :btree

  create_table "borrowers", force: :cascade do |t|
    t.integer  "card_no",     limit: 4
    t.string   "first_name",  limit: 255
    t.string   "middle_name", limit: 255
    t.string   "last_name",   limit: 255
    t.string   "phone",       limit: 255
    t.string   "gender",      limit: 1
    t.integer  "address_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "borrowers", ["address_id"], name: "index_borrowers_on_address_id", using: :btree
  add_index "borrowers", ["card_no"], name: "index_borrowers_on_card_no", using: :btree
  add_index "borrowers", ["last_name", "first_name"], name: "index_borrowers_on_last_name_and_first_name", using: :btree

  create_table "library_branches", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "address_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "library_branches", ["address_id"], name: "index_library_branches_on_address_id", using: :btree

  create_table "publishers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.integer  "address_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "publishers", ["address_id"], name: "index_publishers_on_address_id", using: :btree
  add_index "publishers", ["name"], name: "index_publishers_on_name", using: :btree

end
