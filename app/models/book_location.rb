class BookLocation < ActiveRecord::Base
  belongs_to :book
  belongs_to :library_branch
end
