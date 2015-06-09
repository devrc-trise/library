class Book < ActiveRecord::Base
  has_many :book_locations
  has_many :library_branches, through: :book_locations
  has_many :borrowed_books
  belongs_to :publisher
  has_and_belongs_to_many :authors, join_table: :authors_books

  def to_builder(i_publisher: true, i_authors: true)
    Jbuilder.new do |json|
      json.id id
      json.isbn isbn
      json.title title
      json.publisher publisher.to_builder if i_publisher
      json.authors authors.map { |author| author.to_builder.attributes! } if i_authors
    end
  end
end
