class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string      :name,    index: true
      t.string      :phone
      t.references  :address, index: true

      t.timestamps  null: false
    end
  end
end
