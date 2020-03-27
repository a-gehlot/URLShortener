# == Schema Information
#
# Table name: visits
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#  shortened_url_id :integer          not null
#
class Visit < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    belongs_to :shortened_url, class_name: "ShortenedUrl", foreign_key: "shortened_url_id"

    validates :user, presence: true

    def self.record_visit!(user, shortened_url)
        Visit.create!(user_id: user.id, shortened_url_id: shortened_url.id)
    end

end
