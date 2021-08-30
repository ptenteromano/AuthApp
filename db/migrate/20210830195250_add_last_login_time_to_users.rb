class AddLastLoginTimeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_login_time, :timestamp, null: false
  end
end
