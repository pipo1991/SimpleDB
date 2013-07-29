class CreateGroupsHumenJoin < ActiveRecord::Migration
  def up
    create_table "groups_humen", :id => false do |t|
      t.integer "group_id"
      t.integer "human_id"
    end
  end

  def down
    drop_table "groups_humen"
  end
end
