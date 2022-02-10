class RemoveCareerFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :career, :string
  end
end
