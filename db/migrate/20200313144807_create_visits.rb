class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.timestamps
      
      t.string :user_id, :null => false
      t.string :shortened_url_id, :null => false

      t.index :user_id
      t.index :shortened_url_id
    end
  end
end
