class CreateManagements < ActiveRecord::Migration[6.1]
  def change
    create_table :managements do |t|
      t.string :title
      t.text :content
      t.datetime :start_time

      t.timestamps
    end
  end
end
