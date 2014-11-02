class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :type
      t.string :url
      t.string :doc
      t.belongs_to :package

      t.timestamps
    end
  end
end
