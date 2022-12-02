class CreateFreelancersSpecializations < ActiveRecord::Migration[7.0]
  def change
    create_table :freelancers_specializations, id: false  do |t|
      t.belongs_to :freelancer
      t.belongs_to :specialization

    end
  end
end
