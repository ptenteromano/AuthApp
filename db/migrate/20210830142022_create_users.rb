class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.boolean :admin, null: false
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
