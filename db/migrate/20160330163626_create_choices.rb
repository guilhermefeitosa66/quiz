class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.text :description
      t.boolean :correct
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
