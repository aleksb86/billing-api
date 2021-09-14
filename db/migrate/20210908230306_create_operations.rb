class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.integer :amount
      t.belongs_to :account
      t.belongs_to :operation_name

      t.timestamps
    end
  end
end
