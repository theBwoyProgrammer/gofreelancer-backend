class CreateFreelancers < ActiveRecord::Migration[7.0]
  def change
    create_table :freelancers do |t|
      t.string :name
      t.string :photo
      t.text :details
      t.integer :fee
      t.string :location

      t.timestamps
    end
  end
end
