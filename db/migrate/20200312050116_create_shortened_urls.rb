class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.string "short_url", null: false
      t.string "long_url"
      t.integer "user_id", null: false

      t.timestamps

      t.index :user_id
      t.index :short_url, unique: true
    end
  end
end
