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
    ShortenedUrl.create!(long_url: long_url, submitter_id: user.id, short_url: ShortenedUrl.random_code)
  end


  def num_clicks
    Visit.all.select{ |visit| visit.short_url_id == self.id}.count
  end

  def num_uniques
    a = Visit.all.select{ |visit| visit.short_url_id == self.id}
    a.uniq.count
  end

  belongs_to(
    :submitter,
    :class_name => "User",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )
  has_many(
    :visits,
    class_name: "Visit",
    foreign_key: :short_url_id,
    primary_key: :id
  )
  has_many(
    :visitors,
    through: :visits,
    source: :visitor
  )

end
