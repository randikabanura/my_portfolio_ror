class CreateSiteImages < ActiveRecord::Migration[6.0]
  def change
    create_table :site_images do |t|
      t.string :slug
      t.string :name
      t.string :image
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
