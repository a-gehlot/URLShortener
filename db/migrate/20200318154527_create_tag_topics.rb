class CreateTagTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_topics do |t|
      t.timestamps

      t.string :topic, :null => false
    end
  end
end
