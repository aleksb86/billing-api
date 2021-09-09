class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :code, index: { unique: true }

      t.timestamps
    end
  end
end
