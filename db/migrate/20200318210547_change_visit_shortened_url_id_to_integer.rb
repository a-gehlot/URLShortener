class ChangeVisitShortenedUrlIdToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :visits, :shortened_url_id, :integer, using: 'shortened_url_id::integer'
  end
end
