class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :project
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
