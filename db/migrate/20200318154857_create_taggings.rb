class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.timestamps

      t.string :shortened_url_id, :null => false
      t.string :tag_topic_id, :null => false
    end

  add_index :taggings, :shortened_url_id
  add_index :taggings, :tag_topic_id
  add_index :taggings, [:tag_topic_id, :shortened_url_id], :unique => true
  
  end

end
