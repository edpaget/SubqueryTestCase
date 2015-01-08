class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :user, index: true
      t.references :resource, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :roles, :users
  end
end
