class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.integer     :card_no,     index: true
      t.string      :first_name
      t.string      :middle_name
      t.string      :last_name
      t.string      :phone
      t.string      :gender,      limit: 1
      t.references  :address,     index: true

      t.timestamps  null: false
    end

    add_index :borrowers, [:last_name, :first_name]
  end
end
