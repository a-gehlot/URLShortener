# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string           not null
#  long_url   :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :user_id, presence: true
    validate :no_spamming, :non_premium_max
    
    belongs_to :submitter, class_name: "User", foreign_key: "user_id"
    has_many :visits, dependent: :destroy
    has_many :visitors, Proc.new { distinct }, through: :visits, source: :user
    has_many :taggings, class_name: "Tagging", foreign_key: "shortened_url_id", dependent: :destroy

    has_many :tag_topics, through: :taggings, source: :tag_topic



    def self.random_code
        loop do
            code = SecureRandom.urlsafe_base64
            return code unless ShortenedUrl.exists?(code)
        end
    end     

    def self.create_shortened_url(user, long_url)
        short_code = ShortenedUrl.random_code
        short_url = ShortenedUrl.create!(
            short_url: "#{short_code}",
            long_url: "#{long_url}",
            user_id: user.id
        )
    end

    def num_clicks
        Visit.count()
    end

    def unique_clicks
        Visit.distinct.count(:user_id)
    end

    def num_recent_uniques
        Visit.where("created_at > ?", 10.minutes.ago).distinct.count(:user_id)
    end

    def no_spamming
        count = ShortenedUrl.where("created_at > ?", 1.minute.ago).count(:user_id)
        if count > 5
            errors[:base] << "Please wait one minute before submitting another URL"
        end
    end

    def non_premium_max
        if submitter.premium == false
            count = ShortenedUrl.count(:user_id)
            if count > 5
                errors[:base] << "Maximum of 5 links for nonpremium users"
            end
        end
    end

    def self.prune(n)
        old_visits = ShortenedUrl.joins(:submitter).where("users.premium = false").left_outer_joins(:visits).where("visits.created_at < ?", 1.minutes.ago).or(
            ShortenedUrl.joins(:submitter).left_outer_joins(:visits).where("shortened_urls.created_at < ?", 1.minutes.ago).where("visits.id IS NULL"))
        old_visits.destroy_all
    end

end
