# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  premium    :boolean          default("false")
#
class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true

    has_many :submitted_urls, class_name: "ShortenedUrl", foreign_key: "user_id"
    has_many :visited_urls, Proc.new { distinct }, class_name: "Visit", foreign_key: "user_id"
end
