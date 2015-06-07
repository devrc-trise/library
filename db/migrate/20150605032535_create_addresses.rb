class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text        :address
      t.string      :city
      t.string      :state
      t.string      :zip

      t.timestamps  null: false
    end
  end
end
