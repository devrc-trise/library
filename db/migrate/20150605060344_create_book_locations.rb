class CreateBookLocations < ActiveRecord::Migration
  def change
    create_table :book_locations do |t|
      t.references  :book
      t.references  :library_branch, index: true
      t.integer     :num_copies

      t.timestamps  null: false
    end

    add_index :book_locations, [:book_id, :library_branch_id], unique: true
  end
end
