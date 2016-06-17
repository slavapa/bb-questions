class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :from
      t.string :ip
      t.boolean :banned
      t.boolean :selected
      t.boolean :approved
      t.integer :sequence
      t.text :question, null: false
      t.text :translation
      t.text :reformed

      t.timestamps null: false
    end
    
    add_index :questions, :name
    add_index :questions, :from
  end
end
