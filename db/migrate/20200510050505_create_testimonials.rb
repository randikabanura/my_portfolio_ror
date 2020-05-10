class CreateTestimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonials do |t|
      t.string :slug
      t.string :name
      t.string :designation
      t.string :project
      t.text :content
      
      t.timestamps
    end
  end
end
