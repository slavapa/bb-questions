class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 60, null: false
      t.string :family_name, limit: 60
      t.string :email, limit: 255
      t.boolean :admin, default: false
      t.string :password_digest
      t.string :remember_digest

      t.timestamps null: false
    end
    
    add_index :users, :email, unique: true
    add_index :users, :name
    add_index :users, :family_name
  end
end
