class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :owner
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :items, :owner
    add_index :items, :name
  end
end
