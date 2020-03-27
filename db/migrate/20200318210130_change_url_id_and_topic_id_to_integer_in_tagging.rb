class ChangeUrlIdAndTopicIdToIntegerInTagging < ActiveRecord::Migration[6.0]
  def change
      change_column :taggings, :tag_topic_id, :integer, using: 'tag_topic_id::integer'
      change_column :taggings, :shortened_url_id, :integer, using: 'shortened_url_id::integer'
      #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
