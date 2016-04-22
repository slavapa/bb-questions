class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name, limit: 60, null: false
      t.string :code, limit: 5, null: false
      t.boolean :is_rtl, default: false, null: false

      t.timestamps null: false
    end
    add_index :languages, :name
    add_index :languages, :code
    
    add_index :languages, ["name", "code"], unique: true, 
      name: 'index_languages_name_code'
      
    reversible do |dir|
      dir.up do
        change_column_null :languages, :id, false
      end
      dir.down do
      end
    end
  end
end
