class Author < ActiveRecord::Base
  has_and_belongs_to_many :books, join_table: :authors_books

  def to_builder(i_books: true)
    Jbuilder.new do |json|
      json.id id
      json.first_name first_name
      json.middle_name middle_name
      json.last_name last_name
      json.books books.map { |book| book.to_builder(i_authors: false).attributes! } if i_books
    end
  end
end
