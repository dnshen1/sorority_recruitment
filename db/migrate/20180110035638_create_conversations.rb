class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :party_id
      t.integer :member_id
      t.integer :pnm_id

      t.timestamps

    end
  end
end
