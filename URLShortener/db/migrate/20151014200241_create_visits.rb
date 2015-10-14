class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :user_id
      t.string :short_url_id
      t.timestamps
    end
  end
end
