class CreateTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :trackers do |t|
      t.string :guid
      t.string :url
      t.datetime :datetime

    end
  end
end
