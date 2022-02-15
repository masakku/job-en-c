class CreateMatters < ActiveRecord::Migration[6.0]
  def change
    create_table :matters do |t|
      t.string                    :title, null:false
      t.text                      :info, null:false
      t.integer                   :genre_id, null:false
      t.integer                   :scheduled_id, null:false
      t.text                      :detail, null:false
      t.integer                   :price, null:false
      t.references                :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
