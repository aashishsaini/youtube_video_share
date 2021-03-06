class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :link
      t.string :title
      t.datetime :published_at
      t.integer :likes
      t.integer :dislikes
      t.string :uid
      t.text :description

      t.timestamps
    end
    add_index :videos, :uid
  end
end
