class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.text :description
      t.string :token
      t.integer :cover

      t.timestamps
    end
  end
end
