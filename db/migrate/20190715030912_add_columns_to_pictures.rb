class AddColumnsToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :email,:string
    add_column :pictures, :name, :string
    add_column :pictures, :content, :text
  end
end
