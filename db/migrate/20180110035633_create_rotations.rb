class CreateRotations < ActiveRecord::Migration
  def change
    create_table :rotations do |t|
      t.integer :bump_group_id
      t.integer :party_id

      t.timestamps

    end
  end
end
