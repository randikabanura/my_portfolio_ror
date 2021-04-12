class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :introduction
      t.text :description
      t.string :tags
      t.boolean :status, default: true
      t.integer :order
      t.string :slug

      t.timestamps
    end
    add_index :blogs, :slug, unique: true
  end
end
