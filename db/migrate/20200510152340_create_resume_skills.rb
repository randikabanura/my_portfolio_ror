class CreateResumeSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :resume_skills do |t|
      t.integer :order
      t.string :title
      t.integer :percentage
      t.boolean :status, default: true
      
      t.timestamps
    end
  end
end
