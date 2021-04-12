class CreateTestimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonials do |t|
      t.string :slug
      t.string :name
      t.string :designation
      t.string :project
      t.text :content
      t.boolean :status, default: true
      t.string :avatar
      t.string :facebook
      t.string :instagram
      t.string :github
      t.string :linkedin
      
      t.timestamps
    end
  end
end
