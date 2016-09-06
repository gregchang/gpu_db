class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text :designer
      t.text :model
      t.text :name
      t.text :part
      t.integer :boostClock
      t.integer :baseClock
      t.integer :memClock
      t.integer :vram
      t.float :length
      t.float :width
      t.float :height
      t.integer :backplate
      t.integer :warranty
      t.integer :msrp
      t.text :manurl
      t.text :power
      t.integer :ports
      t.text :ports_detailed
      t.text :cooling
      t.text :imgurl

      t.timestamps
    end
  end
end
