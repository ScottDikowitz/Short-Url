class ChangeTypeOfUserIdAndShortUrlIdOnVisits < ActiveRecord::Migration
  def change
    remove_column :visits, :user_id
    add_column :visits, :user_id, :integer
    remove_column :visits, :short_url_id
    add_column :visits, :short_url_id, :integer
  end
end
