class CreateGroupsPeopleJoin < ActiveRecord::Migration
  def up
    create_table :groups_people, :id => false do |t|
      t.integer "group_id"
      t.integer "people_id"
    end
  end

  def down
    drop_table :groups_people
  end
end
