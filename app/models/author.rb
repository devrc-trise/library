class Author < ActiveRecord::Base
  has_and_belongs_to_many :books, join_table: :authors_books

  def to_builder
    Jbuilder.new do |json|
      json.id id
      json.first_name first_name
      json.middle_name middle_name
      json.last_name last_name
    end
  end
end
