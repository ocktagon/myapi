class CreateApiV1Todolists < ActiveRecord::Migration[5.0]
  def change
    create_table :api_v1_todolists do |t|
      t.string :title

      t.timestamps
    end
  end
end
