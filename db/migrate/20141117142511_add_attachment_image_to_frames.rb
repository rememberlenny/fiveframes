class AddAttachmentImageToFrames < ActiveRecord::Migration
  def self.up
    change_table :frames do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :frames, :image
  end
end
