class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :mobile_number
      t.string :sms
      t.boolean :validated, :default => false

      t.timestamps
    end
  end
end
