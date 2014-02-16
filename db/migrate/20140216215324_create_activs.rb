class CreateActivs < ActiveRecord::Migration
  def change
    create_table :activs do |t|
      t.string :sent_title
      t.integer :sent_user_id
      t.string :got_title
      t.integer :got_user_id

      t.timestamps
    end
    
    add_index :activs, :sent_user_id
    add_index :activs, :got_user_id
  end
end