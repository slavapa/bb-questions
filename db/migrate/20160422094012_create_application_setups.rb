class CreateApplicationSetups < ActiveRecord::Migration
  def change
    create_table :application_setups do |t|
      t.references :app_setup_type, index: true, foreign_key: true, null: false
      t.references :language, index: true, foreign_key: true
      t.string :code_id, null: false
      t.string :description
      t.string :str_value, null: false

      t.timestamps null: false
    end
    
    add_index :application_setups, ["language_id", "code_id"], unique: true, 
      name: 'index_application_setups_language_id_code_id'
  end
end
