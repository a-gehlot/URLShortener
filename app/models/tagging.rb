# == Schema Information
#
# Table name: taggings
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shortened_url_id :integer          not null
#  tag_topic_id     :integer          not null
#
class Tagging < ApplicationRecord
    belongs_to :tag_topic, class_name: "TagTopic", foreign_key: "tag_topic_id"
    belongs_to :shortened_url, class_name: "ShortenedUrl", foreign_key: "shortened_url_id"
end

    
    
