class CreateSiteDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :site_documents do |t|
      t.string :slug
      t.string :name
      t.boolean :status, default: true
      
      t.timestamps
    end
  end
end
