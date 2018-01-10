class CreateBumpGroups < ActiveRecord::Migration
  def change
    create_table :bump_groups do |t|
      t.string :letter

      t.timestamps

    end
  end
end
