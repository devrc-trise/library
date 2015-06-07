class LibraryBranch < ActiveRecord::Base
  has_many :book_locations
  has_many :books, through: :book_locations
  has_many :borrowed_books
end
