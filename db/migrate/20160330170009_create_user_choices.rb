class CreateUserChoices < ActiveRecord::Migration
  def change
    create_table :user_choices do |t|
      t.references :user_quiz, index: true, foreign_key: true
      t.references :choice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
