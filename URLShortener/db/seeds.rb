# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do

  ShortenedUrl.create(:long_url => "google.com", :short_url => "goog", :submitter_id => 6)
  ShortenedUrl.create(:long_url => "ask.com", :short_url => "ask", :submitter_id => 4)
  ShortenedUrl.create(:long_url => "yahoo.com", :short_url => "yah", :submitter_id => 5)

  User.create(:email => "blah@yahoo.com")
  User.create(:email => "appacademy@yahoo.com")
  User.create(:email => "sdfopk@yahoo.com")
  User.create(:email => "powerpowirpoe@yahoo.com")

end
