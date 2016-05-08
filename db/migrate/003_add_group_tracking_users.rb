class AddGroupTrackingUsers < ActiveRecord::Migration
  def change
    add_column :users , :group_tracking , :boolean , :default => false
  end
end