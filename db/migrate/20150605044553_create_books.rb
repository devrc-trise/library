class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books  do |t|
      t.string      :isbn,        index: true
      t.string      :title,       index: true
      t.references  :publisher,   index: true

      t.timestamps  null: false
    end
  end
end
