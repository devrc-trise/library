class CreateLibraryBranches < ActiveRecord::Migration
  def change
    create_table :library_branches do |t|
      t.string      :name
      t.references  :address, index: true

      t.timestamps  null: false
    end
  end
end
