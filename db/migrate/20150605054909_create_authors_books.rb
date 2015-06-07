class CreateAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books, id: false do |t|
      t.references  :book
      t.references  :author
    end

    add_index :authors_books, [:book_id, :author_id], unique: true
  end
end
