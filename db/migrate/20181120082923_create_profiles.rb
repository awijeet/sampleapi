class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :sex
      t.date :date_of_birth
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
