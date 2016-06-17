class CreateAppSetupTypes < ActiveRecord::Migration
  def change
    create_table :app_setup_types do |t|
      t.string :name, limit: 60, null: false
      t.string :description

      t.timestamps null: false
    end
    
    reversible do |dir|
      dir.up do
        change_column_null :app_setup_types, :id, false
      end
      dir.down do
      end
    end
    
  end
end
