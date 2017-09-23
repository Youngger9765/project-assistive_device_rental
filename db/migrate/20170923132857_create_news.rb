class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :name
      t.string :description
      t.boolean :enable

      t.timestamps
    end
  end
end
