class CreateOtherModels < ActiveRecord::Migration[6.1]
  def change
    create_table :other_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
