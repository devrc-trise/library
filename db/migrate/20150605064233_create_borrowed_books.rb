class CreateBorrowedBooks < ActiveRecord::Migration
  def change
    create_table :borrowed_books do |t|
      t.references  :book
      t.references  :library_branch,  index: true
      t.references  :borrower,        index: true
      t.datetime    :borrow_date
      t.date        :due_date
      t.boolean     :is_returned

      t.timestamps  null: false
    end

    add_index :borrowed_books, [:book_id, :library_branch_id, :borrower_id], unique: true, name: 'index_on_book_librarybranch_borrower'
  end
end
