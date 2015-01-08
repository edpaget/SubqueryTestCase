class CreateThangies < ActiveRecord::Migration
  def change
    create_table :thangies do |t|

      t.timestamps null: false
    end
  end
end
