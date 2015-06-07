class Address < ActiveRecord::Base
  def to_builder
    Jbuilder.new do |json|
      json.address address
      json.city city
      json.state state
      json.zip zip
    end
  end
end
