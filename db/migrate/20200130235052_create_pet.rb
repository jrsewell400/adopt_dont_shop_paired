class CreatePet < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :image
      t.string :name
      t.integer :age
      t.string :description
      t.string :sex
      t.string :adopted 
    end
  end
end
