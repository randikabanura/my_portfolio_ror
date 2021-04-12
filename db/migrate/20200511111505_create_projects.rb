class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :introduction
      t.text :description
      t.integer :project_type
      t.string :tags
      t.string :website
      t.integer :order
      t.string :image
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
