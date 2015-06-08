class BookLocation < ActiveRecord::Base
  belongs_to :book
  belongs_to :library_branch

  def to_builder(i_book: true, i_library_branch: true)
    Jbuilder.new do |json|
      json.book book.to_builder if i_book
      json.library_branch library_branch if i_library_branch
      json.num_copies num_copies
    end
  end
end
