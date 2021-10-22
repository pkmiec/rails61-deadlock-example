class CreatePrimaryModels < ActiveRecord::Migration[6.1]
  def change
    create_table :primary_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
