class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.text :code_snippet, default: ""

      t.timestamps
    end
  end
end
