class CreateResumeItems < ActiveRecord::Migration[6.0]
  def change
    create_table :resume_items do |t|
      t.integer :order
      t.integer :item_type
      t.text :description
      t.string :title
      t.date :start
      t.date :end
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
