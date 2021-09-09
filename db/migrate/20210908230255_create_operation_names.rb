class CreateOperationNames < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_names do |t|
      t.string :name, index: { unique: true }

      t.timestamps
    end
  end
end
