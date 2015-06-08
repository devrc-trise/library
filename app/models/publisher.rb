class Publisher < ActiveRecord::Base
  has_many :books
  belongs_to :address

  def to_builder(i_address: true)
    Jbuilder.new do |json|
      json.id id
      json.name name
      json.phone phone
      json.address address.to_builder if i_address
    end
  end
end
