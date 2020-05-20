class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :to_user_id

      t.timestamps
    end
  end
end
