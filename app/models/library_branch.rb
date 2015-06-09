class LibraryBranch < ActiveRecord::Base
  has_many :book_locations
  has_many :books, through: :book_locations
  has_many :borrowed_books
  belongs_to :address

  def to_builder
    Jbuilder.new do |json|
      json.id id
      json.name name
      json.address address.to_builder
    end
  end
end
