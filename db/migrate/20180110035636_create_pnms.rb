class CreatePnms < ActiveRecord::Migration
  def change
    create_table :pnms do |t|
      t.string :name
      t.string :hometown
      t.string :year
      t.integer :party_id

      t.timestamps

    end
  end
end
