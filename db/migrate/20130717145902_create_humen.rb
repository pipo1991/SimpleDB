class CreateHumen < ActiveRecord::Migration
  def up
    create_table "humen" do |t|
      t.references "group"
      t.integer "nid"
      t.string "name",:limit => 25
      t.timestamps
    end
  end
  
  def down
    drop_table "humen"
  end
end
