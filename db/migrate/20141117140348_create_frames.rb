class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.text :description
      t.references :story, index: true

      t.timestamps
    end
  end
end
