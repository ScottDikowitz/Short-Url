# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string(255)
#  short_url    :string(255)
#  submitter_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# require 'SecureRandom'

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :presence => true, :uniqueness => true

  def self.random_code

    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end

    code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(long_url: long_url, submitter_id: user, short_url: ShortenedUrl.random_code)
  end

end
