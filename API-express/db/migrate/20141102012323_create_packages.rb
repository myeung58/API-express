class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :api
      t.string :auth_key
      t.string :client_key
      t.belongs_to :user

      t.timestamps
    end
  end
end
