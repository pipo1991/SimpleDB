class CreatePeople < ActiveRecord::Migration
  def up
    create_table :people do |t|
      t.references :group
      t.integer "nid"
      t.string "name",:limit => 25
      t.timestamps
    end
  end
  
  def down
    drop_table :people
  end
end
