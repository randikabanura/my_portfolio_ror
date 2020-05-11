class CreateSocialLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :social_links do |t|
      t.string :name
      t.string :icon_text
      t.integer :link_type
      t.integer :order
      t.text :link
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
