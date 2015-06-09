class Borrower < ActiveRecord::Base
  has_many :borrowed_books
  belongs_to :address

  def to_builder
    Jbuilder.new do |json|
      json.id id
      json.card_no card_no
      json.first_name first_name
      json.middle_name middle_name
      json.last_name last_name
      json.phone phone
      json.address address.to_builder
    end
  end
end
