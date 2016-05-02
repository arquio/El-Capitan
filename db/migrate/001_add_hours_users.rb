class AddHoursUsers < ActiveRecord::Migration
  def change
    add_column :users , :weekly_hours , :integer , :default => 0
  end
end