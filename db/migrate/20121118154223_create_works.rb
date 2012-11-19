class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.date :work_dated
      t.string :p_image
      t.text :notes
      t.text :description
      t.string :provenance

      t.timestamps
    end
    add_index :works, :title, :unique => true
  end
  def down
    drop_table :works
  end
end
