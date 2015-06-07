class BorrowedBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :library_branch
  belongs_to :borrower
end
