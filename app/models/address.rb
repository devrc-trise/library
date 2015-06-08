class Address < ActiveRecord::Base
  def to_builder
    Jbuilder.new do |json|
      json.id id
      json.address address
      json.city city
      json.state state
      json.zip zip
    end
  end
end
