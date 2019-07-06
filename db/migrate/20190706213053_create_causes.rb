class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :name
      t.integer :runner_id
      t.integer :race_id
    end 
  end
end
