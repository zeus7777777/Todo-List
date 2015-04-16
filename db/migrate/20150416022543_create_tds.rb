class CreateTds < ActiveRecord::Migration
  def change
    create_table :tds do |t|
      t.string :name
      t.integer :status

      t.timestamps null: false
    end
  end
end
