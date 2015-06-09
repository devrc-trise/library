class BorrowedBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :library_branch
  belongs_to :borrower

  def to_builder(i_book: true, i_library_branch: true, i_borrower: true)
    Jbuilder.new do |json|
      json.id id
      json.book book.to_builder(i_publisher: false, i_authors: false) if i_book
      json.library_branch library_branch.to_builder if i_library_branch
      json.borrower borrower.to_builder if i_borrower
      json.borrow_date borrow_date
      json.due_date due_date
    end
  end
end
